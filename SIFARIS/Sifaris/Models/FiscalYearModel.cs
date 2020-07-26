﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Sifaris.Models
{
    public class FiscalYearModel
    {
        public int FiscalYearId { get; set; }
        [DisplayName("आर्थिक वर्ष")]
        [Required(ErrorMessage = "Fiscal Year Is Required")]
        public string FiscalYear { get; set; }
        [DisplayName("सुरु मिति")]
        public string StartDateN { get; set; }
        public DateTime StartDate { get; set; }
        [DisplayName("अन्त्य मिति")]
        public string EndDateN { get; set; }
        public DateTime EndDate { get; set; }
        [DisplayName("आर्थिक वर्ष स्थिति")]
        public bool STATUS { get; set; }
        public List<FiscalYearModel> FiscalYearModelList { get; set; }
    }
}