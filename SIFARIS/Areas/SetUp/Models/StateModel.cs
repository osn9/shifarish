using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.SetUp.Models
{
    public class StateModel
    {
        public int StateId { get; set; }
        public Nullable<int> StateId_val { get; set; }
        public string StateName { get; set; }
        public string StateName_Nep { get; set; }
    }
}