using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SifarishView.Areas.GharJagga.Models
{
    public class NirmanBebasahiViewModel
    {
        public int nirmanbebasaiId { get; set; }
        [Display(Name = "नाम")]
        public string name { get; set; }
        [Display(Name = "ठेगाना")]
        public string address { get; set; }
        [Display(Name = "पोष्ट बक्स नं")]
        public string postboxNo { get; set; }
        [Display(Name = " टेलिफोन नं")]
        public string TelPhoneNo { get; set; }
        [Display(Name = "फ्याक्स नं")]
        public string FaxNo { get; set; }
        [Display(Name = "ईमेल")]
        public string Email { get; set; }
        [Display(Name = "कार्यालयका नाम")]
        public string KaralayaName { get; set; }
        [Display(Name = "कार्यालयका ठेगाना")]
        public string KaralayaAddress { get; set; }
        [Display(Name = "प्रमाण पत्र नंर")]
        public string PramanPatraNo { get; set; }
        [Display(Name = "दर्ता मिति")]
        public string RegisterdDate { get; set; }
        [Display(Name = "दर्ता मिति")]
        public Nullable<System.DateTime> RegisterDateAd { get; set; }
        [Display(Name = "इजाजत पत्र जारी भएको मिति")]
        public Nullable<System.DateTime> AprovalDateAd { get; set; }
        [Display(Name = " इजाजत पत्र नं ")]
        public Nullable<int> approvalNo { get; set; }
        [Display(Name = "इजाजत पत्र जारी भएको मिति")]
        public string ApprovealDate { get; set; }
        [Display(Name = "इजाजत पत्र जारी गर्ने कार्यालय")]
        public string ApprovalKaryalaya { get; set; }
        [Display(Name = " नविकरण मिति ")]
        public Nullable<System.DateTime> RenewalDatead { get; set; }
        [Display(Name = " नविकरण मिति ")]
        public string RenewalDate { get; set; }
        [Display(Name = "सदस्यता नं")]
        public string MembershipNo { get; set; }
        [Display(Name = "रकम")]
        public string Amount { get; set; }
        [Display(Name = "रकम")]
        public Nullable<decimal> AmountEng { get; set; }
        [Display(Name = "फर्मको नाम")]
        public string FormName { get; set; }
        [Display(Name = "ठेगाना")]
        public string FormAddress { get; set; }
        [Display(Name = "सञ्चालक÷प्रोप्राइटरको नाम")]
        public string SanchalakName { get; set; }
        [Display(Name = "मिति ")]
        public string Date { get; set; }
        [Display(Name = "मिति  ")]
        public Nullable<System.DateTime> DateAd { get; set; }
        [Display(Name = "प्रिन्ट मिति")]
        public Nullable<System.DateTime> PrintDateAd { get; set; }
        [Display(Name = "प्रिन्ट मिति")]
        public string PrintDate { get; set; }
        public Nullable<int> Createdby { get; set; }
        public Nullable<System.DateTime> CreateddDate { get; set; }
        public Nullable<System.DateTime> deletedDate { get; set; }
        public Nullable<int> Deletedby { get; set; }
        public Nullable<System.DateTime> updatedDate { get; set; }
        public Nullable<int> updatedBy { get; set; }
    }
}