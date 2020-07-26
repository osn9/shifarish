using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Sifaris.Models
{
    public class ShreniModel
    {
        public int ShreniId { get; set; }
        [DisplayName("श्रेणी तह")]
        public int ShreniScheduleId { get; set; }
        [DisplayName("श्रेणी")]
        public string ShreniName { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }
        public int? UpdatedBy { get; set; }


        public string UpdateDate { get; set; }
        
        public List<ShreniModel> ShreniList { get; set; }
       
    }
}