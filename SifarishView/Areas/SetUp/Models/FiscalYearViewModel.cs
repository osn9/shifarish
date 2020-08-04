using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace SifarishView.Areas.SetUp.Models
{
    public class FiscalYearViewModel
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
        public List<FiscalYearViewModel> FiscalYearViewModelList { get; set; }
    }
}