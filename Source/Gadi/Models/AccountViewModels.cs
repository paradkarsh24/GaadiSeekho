﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using Gadi.Business.Models;

namespace Gadi.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class ExternalLoginListViewModel
    {
        public string ReturnUrl { get; set; }
    }

    public class SendCodeViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
        public string ReturnUrl { get; set; }
        public bool RememberMe { get; set; }
    }

    public class VerifyCodeViewModel
    {
        [Required]
        public string Provider { get; set; }

        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }
        public string ReturnUrl { get; set; }

        [Display(Name = "Remember this browser?")]
        public bool RememberBrowser { get; set; }

        public bool RememberMe { get; set; }
    }

    public class ForgotViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class LoginViewModel
    {
        //[Required]
        [Display(Name = "Email")]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }

        [Required]
        [Display(Name = "UserName")]
        [Remote("IsValidUsername", "Validation", AdditionalFields = "UserName", ErrorMessage = "Enter valid email or mobile number.")]
        public string UserName { get; set; }
    }

    public class RegisterViewModel
    {
        public DrivingSchool DrivingSchool { get; set; }
        //[Required]
        [Display(Name = "Firstname")]
        [StringLength(100, ErrorMessage = "The Firstname field is required.")]
        public string FirstName { get; set; }

        //[Required]
        [Display(Name = "Lastname")]
        [StringLength(100, ErrorMessage = "The Lastname field is required.")]
        public string LastName { get; set; }

        //[Required]
        [Display(Name = "Pincode")]
        [StringLength(100, ErrorMessage = "The Pincode field is required.")]
        public string Pincode { get; set; }

        //[Required]
        [EmailAddress]
        [Display(Name = "Email")]
        [StringLength(256, ErrorMessage = "The Email field is required.")]
        [Remote("PersonnelAlreadyExists", "Validation", AdditionalFields = "MobileNumber,Email", ErrorMessage = "User already exists.")]
        public string Email { get; set; }

        [Required]
        [MaxLength(10)]
        [RegularExpression("^[0-9]*$", ErrorMessage = "Enter valid number.")]
        [Display(Name = "Mobile Number")]
        [Remote("PersonnelAlreadyExists", "Validation", AdditionalFields = "MobileNumber,Email", ErrorMessage = "User already exists.")]
        public string MobileNumber { get; set; }

        [Required]
        [MaxLength(6)]
        [RegularExpression("^[0-9]*$", ErrorMessage = "Enter valid OTP.")]
        [Display(Name = "OTP")]
        public string OTP { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Remote("CompareConfirmPassword", "Validation", AdditionalFields = "ConfirmPassword,Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        [Display(Name = "Driving School")]
        public bool IsDrivingSchool { get; set; }

        public string AspNetUserId { get; set; }

        public double? Latitude { get; set; }

        public double? Longitude { get; set; }
        public bool HasError { get; set; }
        public int PersonnelId { get; set; }
        public bool OtpCreated { get; set; }
    }

    public class ResetPasswordViewModel
    {
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [Display(Name = "Mobile Number")]
        public string MobileNumber { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Remote("CompareConfirmPassword", "Validation", AdditionalFields = "ConfirmPassword,Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        public string Code { get; set; }

        public string OTP { get; set; }

        public bool HasError { get; set; }
    }

    public class ForgotPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [Display(Name = "Mobile Number")]
        public string MobileNumber { get; set; }
    }
}
