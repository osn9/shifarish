using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SifarishView.Areas.GharJagga.Models
{
    public class GharBatoViewModel
    {

        public int id { get; set; }
        [Display(Name = "नगरपालिका(साविक गा.वि.स)" )]
        public string munOrvdcName { get; set; }
        [Display(Name = "िडा नं.")]

        public Nullable<int> Ward { get; set; }
        [Display(Name = "नक्सा नं.  ")]

        public string Map_no { get; set; }
        [Display(Name = "ककत्ता नं. ")]
        
        public string KittaNo { get; set; }
        [Display(Name = "नाम, थर:  ")]

        public string buyerName { get; set; }
        [Display(Name = "पति/बावुको नाम")]

        public string buyerFatherName { get; set; }
        [Display(Name = "नाम, थर:")]

        public string SellerName { get; set; }
        [Display(Name = "पति/बावुको नाम")]

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