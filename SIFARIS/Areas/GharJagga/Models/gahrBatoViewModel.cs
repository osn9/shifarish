using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Models
{
    public class gahrBatoViewModel
    {
        public int id { get; set; }
        public string munOrvdcName { get; set; }
        public Nullable<int> Ward { get; set; }
        public string Map_no { get; set; }
        public string KittaNo { get; set; }
        public string buyerName { get; set; }
        public string buyerFatherName { get; set; }
        public string SellerName { get; set; }
        public string SellerFatherName { get; set; }
        public string Date { get; set; }
        public Nullable<System.DateTime> DateAd { get; set; }
        public string PrintDate { get; set; }
        public Nullable<System.DateTime> PrintDateAd { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> DeletedDate { get; set; }
        public Nullable<System.DateTime> Updatedate { get; set; }
        public string updatedBy { get; set; }
        public string DeletedBy { get; set; }
        public string CreatedBy { get; set; }
    }
}