using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SifarishView.Areas.GharJagga.Models
{
    public class GharJaggaKarViewModel
    {
        public int id { get; set; }
        [Display(Name = "वडा नं.")]
        public Nullable<int> ward { get; set; }
        [Display(Name = "घर नं")]
        public string gharNo { get; set; }
        [Display(Name = " कित्ता नं.")]
        public string kittaNo { get; set; }
        [Display(Name = "घर जग्गा रहेको स्थान")]
        public string Address { get; set; }
        [Display(Name = " क्षेत्रफल (जग्गा)")]
        public string Area { get; set; }
        [Display(Name = "घर बनेको साल")]
        public string BuildDate { get; set; }
        [Display(Name = "लम्बाई ")]
        public string Length { get; set; }
        [Display(Name = "चौडाई ")]
        public string breadth { get; set; }
        [Display(Name = "उचाई (तल्लामा)")]
        public string Height { get; set; }
        [Display(Name = "घरको बनौट")]
        public string GharDesigin { get; set; }
        [Display(Name = "बाटोको÷मार्गको नाम")]
        public string Road { get; set; }
        [Display(Name = "बाटो")]
        public string roadType { get; set; }
        [Display(Name = "नाम")]
        public string NibedakName { get; set; }
        [Display(Name = "ठेगाना")]
        public string NibedakAddress { get; set; }
        [Display(Name = "फोन नं.")]
        public string phone { get; set; }
        [Display(Name = "मार्फत नाम")]
        public string marphatName { get; set; }
        [Display(Name = "संरचना")]
        public string Date { get; set; }
        [Display(Name = "संरचना")]
        public string dateAd { get; set; }
        [Display(Name = "संरचना")]
        public string PrintDate { get; set; }
        [Display(Name = "संरचना")]
        public string printDateAd { get; set; }
        public Nullable<System.DateTime> CreatedDae { get; set; }
        public Nullable<System.DateTime> deltedDate { get; set; }
        public Nullable<System.DateTime> updatedate { get; set; }
        public Nullable<int> updateBy { get; set; }
        public Nullable<int> createby { get; set; }
        public Nullable<int> deletedby { get; set; }
    }
    public class GhraJaggaKarFileViewModle
    {

        public int id { get; set; }
        public Nullable<int> GhraJaggaKarId { get; set; }
        [Display(Name = "कागजात")]
        public string FileName { get; set; }
        [Display(Name = "कागजात")]

        public string FilePath { get; set; }
        public Nullable<bool> Status { get; set; }
      //  public HttpPostedFileBase files { get; set; }
    }
}