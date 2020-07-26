using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Sifaris.Models
{
    public class UserTypeModel
    {
        public int UserTypeId { get; set; }
        [DisplayName("कर्मचारी तह")]
        public int ScheduleId { get; set; }
        [DisplayName("कर्मचारी प्रकार")]
        public string Title { get; set; }
        public int? CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public string UpdateDate { get; set; }

        public List<UserTypeModel> UserTypeList { get; set; }
    }
}