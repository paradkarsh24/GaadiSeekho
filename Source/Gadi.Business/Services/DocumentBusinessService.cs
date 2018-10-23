﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Gadi.Business.Extensions;
using Gadi.Business.Interfaces;
using Gadi.Business.Models;
using Gadi.Data.Interfaces;

namespace Gadi.Business.Services
{
    public class DocumentBusinessService : IDocumentsBusinessService
    {
        private readonly IMapper _mapper;
        private readonly IDocumentDataService _documentDataService;
        private readonly IProductDataService _productDataService;
        private string Product => "Gadi";

        public DocumentBusinessService(IDocumentDataService documentDataService, IMapper mapper, IProductDataService productDataService)
        {
            _documentDataService = documentDataService;
            _mapper = mapper;
            _productDataService = productDataService;
        }
        #region Create
        public byte[] DownloadDocument(Guid documentGuid)
        {
            //var document = _documentServiceRestClient.Download(documentGuid);
            return null;
        }

        public async Task<ValidationResult<Document>> CreateDocument(Document document)
        {
            //Get Document
            var documentsResultData = await _documentDataService.RetrieveAsync<Data.Entities.DocumentDetail>(e => e.PersonnelId == document.PersonnelId && e.CategoryId == document.CategoryId);
            var documentsResult = _mapper.MapToList<DocumentDetail>(documentsResultData);

            //Delete Documents
            if (documentsResult.Count > 0)
            {
                await DeleteDocuments(documentsResult.ToList());
            }

            //Create Documents
            var validationResult = new ValidationResult<Document>();
            var newGuid = Guid.NewGuid();
            var documentCategories = await this.RetrieveDocumentCategoriesAsync();
            var category = documentCategories.FirstOrDefault(e => e.Name.ToLower() == document.Category.ToLower()); //check Category
            if (category == null) return validationResult.Error("Document category not found");
            var productData = _productDataService.RetrieveAll<Data.Entities.Product>();
            var result = _mapper.MapToList<Product>(productData);
            var product = result.Single(p => p.Name.ToLower() == Product.ToLower());
            if (product == null) return validationResult.Error("product not found");
            // this categoryFileName ensures uniqueness of file in folder and is critical
            var categoryFileName = string.Format("{0}_{1}_{2}", document.Category, newGuid, document.FileName); //check Category
            var basePath = product.UncPath;
            // sjp retain compatibility with existing DocumentService
            var personnelDirectory = CreatePersonnelDirectory(basePath, document.PersonnelName, document.PersonnelId); //check PersonnelName
            var categoryDirectory = Path.Combine(personnelDirectory, document.Category); //check Category
            var filePath = Path.Combine(categoryDirectory, categoryFileName);

            var documentDetail = new Data.Entities.DocumentDetail
            {
                DocumentGUID = newGuid,
                ProductId = product.ProductId,
                CategoryId = category.DocumentCategoryId,
                PersonnelId = document.PersonnelId,
                Description = document.Description,
                FileName = document.FileName,
                ClientFileName = document.ClientFileName,
                CreatedDateUTC = DateTime.UtcNow,
                CreatedBy = document.CreatedBy,
                RequireApproval = document.RequireApproval,
                UncPath = basePath,
                RelativePath = filePath.Replace(basePath, string.Empty),
                DocumentBatchId = document.DocumentBatchId,
                DownloadedDateUtc = document.DownloadedDateUtc,
                EmailSentDateUtc = document.EmailSentDateUtc
            };

            Directory.CreateDirectory(categoryDirectory);

            if (document.Content != null) //check Content
            {
                File.WriteAllBytes(filePath, document.Content); //check Content
            }
            else if (!string.IsNullOrEmpty(document.ContentBase64)) //check ContentBase64
            {
                byte[] content = Convert.FromBase64String(document.ContentBase64); //check ContentBase64
                File.WriteAllBytes(filePath, content);
            }

            try
            {
                var entity = await _documentDataService.CreateGetAsync(documentDetail);
                validationResult.Entity = _mapper.Map<Document>(entity);
                validationResult.Succeeded = true;
            }
            catch (Exception ex)
            {
                validationResult.Succeeded = false;
            }
            return validationResult;
        }
        #endregion


        #region Retrieve
        public async Task<ValidationResult<Document[]>> RetrieveDocuments(int personnelId, Enum.DocumentCategory category)
        {
            var validationResult = new ValidationResult<Document[]>();
            try
            {

                var documents = await _documentDataService.RetrieveAsync<Data.Entities.DocumentDetail>(e => e.PersonnelId == personnelId.ToString() && e.CategoryId == (int)category);
                var result = _mapper.MapToList<Document>(documents).ToArray();
                validationResult.Succeeded = true;
                validationResult.Entity = result;
            }
            catch (Exception ex)
            {
                validationResult.Succeeded = false;
                validationResult.Errors = new List<string> { ex.InnerMessage() };
                validationResult.Exception = ex;
            }
            return validationResult;
        }

        public async Task<IEnumerable<DocumentCategory>> RetrieveDocumentCategoriesAsync()
        {
            try
            {
                var documentCategories = await _documentDataService.RetrieveAllAsync<Data.Entities.DocumentCategory>();
                return _mapper.MapToList<DocumentCategory>(documentCategories);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<ValidationResult<Document>> RetrieveDocumentByGuid(Guid documentGuid, string userId)
        {
            var validationResult = new ValidationResult<Document>();
            //  var workerId = await _workerBusinessService.RetrieveWorkerIdByUserId(userId);
            //  if (workerId == 0) return validationResult.Error("No worker found for logged in user");

            var document = await _documentDataService.RetrieveAsync<Data.Entities.DocumentDetail>(e => e.DocumentGUID == documentGuid);
            var result = _mapper.Map<IEnumerable<Document>>(document);
            return validationResult.Success(result.FirstOrDefault(), "");
        }
        #endregion

        #region Delete
        public async Task<bool> DeleteDocument(List<Guid> guid)
        {
            try
            {
                foreach (var item in guid)
                {
                    await _documentDataService.DeleteWhereAsync<Data.Entities.DocumentDetail>(e => e.DocumentGUID == item);
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        #endregion

        #region Helper
        private string GetBasePath(string productName)
        {
            var products = _productDataService.RetrieveAll<Data.Entities.Product>();
            var prod = products.FirstOrDefault(p => p.Name.ToLower() == productName.ToLower());
            if (prod == null)
                throw new Exception("Invalid product");
            return prod.UncPath;
        }

        private static string CleanFilename(string filename)
        {
            return Path.GetInvalidFileNameChars().Aggregate(filename, (current, chr) => current.Replace(chr, '_')).Replace(' ', '_');
        }

        private static string CreatePersonnelDirectory(string basePath, string personnelName, string personnelId)
        {
            var directoryName = Path.Combine(basePath, CleanFilename(String.Format("{0}_{1}", personnelName, personnelId)));
            Directory.CreateDirectory(directoryName);
            return directoryName;
        }

        private async Task DeleteDocuments(List<DocumentDetail> documentDetails)
        {
            var result = _mapper.MapToList<DocumentDetail>(documentDetails);
            foreach (var documentDetail in result)
            {

                await DeleteDocument(new List<Guid>() { documentDetail.DocumentGUID });
                var combinedPath = documentDetail.UncPath + documentDetail.RelativePath;
                if (File.Exists(combinedPath))
                    File.Delete(combinedPath);
            }
        }
        #endregion
    }
}
