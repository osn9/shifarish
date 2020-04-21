using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Models
{
    public class FiscalyearViewModel
    {
        public int FiscalId { get; set; }
        public string Nanem { get; set; }
        public string StartDate { get; set; }
        public Nullable<System.DateTime> StartDateAd { get; set; }
        public string EndDate { get; set; }
        public Nullable<System.DateTime> EndDateAd { get; set; }
        public Nullable<int> PreviousYear { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> DeletedDate { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public Nullable<int> UpdatteBy { get; set; }
        public Nullable<int> DeletedBy { get; set; }
        public Nullable<int> CreatedBy { get; set; }
    }
}