using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.SetUp.Models
{
    public class DistrictModel
    {
        public int DistrictId { get; set; }
        public Nullable<int> DistrictId_val { get; set; }
        public string DistrictName { get; set; }
        public Nullable<int> StateId_val { get; set; }
        public string DistrictName_Nep { get; set; }

    }
}