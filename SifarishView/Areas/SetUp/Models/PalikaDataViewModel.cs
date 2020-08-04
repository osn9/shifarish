using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SifarishView.Areas.SetUp.Models
{
    public class PalikaDataViewModel
    {
        public int PalikaId { get; set; }
        public int PalikaId_val { get; set; }
        public Nullable<int> DistrictId { get; set; }
        public string PalikaName { get; set; }
        public string PalikaName_Nep { get; set; }
    }
}