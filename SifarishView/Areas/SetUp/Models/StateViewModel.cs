using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SifarishView.Areas.SetUp.Models
{
    public class StateViewModel
    {
        public int StateId { get; set; }
        public Nullable<int> StateId_val { get; set; }
        public string StateName { get; set; }
        public string StateName_Nep { get; set; }
    }
}