﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Gadi.Business.Models;

namespace Gadi.Models
{
    public class DrivingSchoolViewModel:BaseViewModel
    {
        public DrivingSchool DrivingSchool { get; set; }
        public DrivingSchoolGrid DrivingSchoolGrid { get; set; }
        public List<DrivingSchoolCarGrid> DrivingSchoolCarGrid { get; set; }
        public List<DrivingSchoolRatingAndReview> DrivingSchoolRatingAndReviewList { get; set; }
    }
}