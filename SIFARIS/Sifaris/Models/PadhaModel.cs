using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Sifaris.Models
{
    public class PadhaModel
    {
        public int PadhaId { get; set; }
        [DisplayName("पद")]
        public string PadhaName { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public string UpdateDate { get; set; }

        [DisplayName("श्रेणी")]
        public int ShreniId { get; set; }

        public List<PadhaModel> PadhaModelList { get; set; }
    }
}