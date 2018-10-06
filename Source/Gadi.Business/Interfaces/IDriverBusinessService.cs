﻿using System.Collections.Generic;
using System.Threading.Tasks;
using Gadi.Common.Dto;
using Gadi.Business.Models;

namespace Gadi.Business.Interfaces
{
    public interface IDriverBusinessService
    {
        //Create
        Task<ValidationResult<Driver>> CreateDriver(Driver driver);

        //Update
        Task<ValidationResult<Driver>> UpdateDriver(Driver driver);

        //Retrieve
        Task<Driver> RetrieveDriver(int driverId);
        Task<PagedResult<Driver>> RetrieveDrivers(List<OrderBy> orderBy = null, Paging paging = null);
        Task<PagedResult<DriverGrid>> Search(string term, List<OrderBy> orderBy = null, Paging paging = null);
    }
}
