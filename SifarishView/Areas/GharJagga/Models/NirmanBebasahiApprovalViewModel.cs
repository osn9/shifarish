using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SifarishView.Areas.GharJagga.Models
{
    public class NirmanBebasahiApprovalViewModel
    {
        public int id { get; set; }
        [Display(Name = "नाम")]
        public string Name { get; set; }
        [Display(Name = "ठेगाना")]
        public string Address { get; set; }
        [Display(Name = "पोष्ट बक्स नं")]
        public string PostBoxNo { get; set; }
        [Display(Name = " टेलिफोन नं")]
        public string Telephone { get; set; }
        [Display(Name = "कम्पनीको प्रकृति ")]

        public string CompanyTypr { get; set; }
        [Display(Name = "नामथर ")]

        public string ComapanyPersonelName { get; set; }
        [Display(Name = "ठेगाना ")]

        public string CompanyPersonelAddress { get; set; }
        [Display(Name = "पोष्ट बक्स नं ")]

        public string CompanyPersonelPostbosNo { get; set; }
        [Display(Name = "नामथर ")]

        public string CompanyPersonelTelephone { get; set; }
        [Display(Name = "फ्याक्स नं ")]

        public string CompanyPersonelFax { get; set; }

        [Display(Name = "ईमेल")]
        public string CompanyPersonelEmail { get; set; }
        [Display(Name = " दर्ता नं")]
        public string RegisterationNo { get; set; }
        [Display(Name = "दर्ता मिति ")]
        public string RegistrarionDate { get; set; }
        public Nullable<System.DateTime> RegistrationDateAd { get; set; }
        [Display(Name = "अधिकृत पूँजी")]
        public string AdhiriktaPuji { get; set; }
        [Display(Name = "अधिकृत पूँजी ")]
        public Nullable<decimal> AdhirikataPujiEng { get; set; }
        [Display(Name = "जारी पूँजी ")]
        public string JariPugi { get; set; }
        [Display(Name = "जारी पूँजी")]
        public Nullable<decimal> JariPujiEng { get; set; }
        [Display(Name = "ईजाजत पत्र लिन चाहेको बर्ग ")]

        public string Grade { get; set; }
        [Display(Name = "सामुहिकरण हुन चाहेको समूह ")]
        public string groups { get; set; }
        [Display(Name = "प्राविधिक")]
        public string Technical { get; set; }
        [Display(Name = "अप्राविधिक ")]
        public string NonTechnical { get; set; }
        [Display(Name = "अन्य ")]
        public string Others { get; set; }
        public string PrintDate { get; set; }
        public Nullable<System.DateTime> PrintDateAd { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public Nullable<bool> status { get; set; }
        public string CreateDate { get; set; }
        public Nullable<int> Createdby { get; set; }
        public Nullable<System.DateTime> DeletedDate { get; set; }
        public Nullable<int> DeletedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public Nullable<int> updateby { get; set; }
    }
}