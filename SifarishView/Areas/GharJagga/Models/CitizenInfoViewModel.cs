using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SifarishView.Areas.GharJagga.Models
{
    public class CitizenInfoViewModel
    {

        public int Id { get; set; }
       
        public Nullable<int> Citizen_id { get; set; }
        [Display(Name = "नागरिकता नम्बर")]
        public string Citizenship_No { get; set; }
        public Nullable<int> DeparmentId { get; set; }
        [Display(Name = "First Name")]
        public string CitizenName { get; set; }
        [Display(Name = "ठेगान ")]
        public string Address { get; set; }
        [Display(Name = "जिल्ला")]
        public Nullable<int> District_Id { get; set; }
        [Display(Name = "अञ्चल")]
        public Nullable<int> Zone_Id { get; set; }
        [Display(Name = "वार्ड")]
        public Nullable<int> Mun_Ward { get; set; }
        [Display(Name = "साववक वडा ")]
        public Nullable<int> Sabik_Ward { get; set; }
        [Display(Name = "घर जग्गा धनीको बुबा/पर्तको नाम, थर ")]
        public string Father_Husband_Name { get; set; }
        [Display(Name = "नागररकता ि.ं र जारी लमर्त")]
        public string GrandFatherName { get; set; }
        [Display(Name = "िागररकता ि.ं र जारी लमर्त")]
        public string CitizenShip_Date { get; set; }
        [Display(Name = "नागररकता प्रदाि गिे न्जल्ला ")]
        public Nullable<int> CitizinShip_Zone { get; set; }

        //GharInfo
        [Display(Name = "First Name")]
        public int Citizen_gharjaga_Id { get; set; }
        [Display(Name = "घरको संख्या ")]
        public Nullable<int> NumberOfHouse { get; set; }
        [Display(Name = "क्षेत्रत्रफल ")]
        public string Area { get; set; }
        [Display(Name = "ककत्ता ")]
        public string Kitta_No { get; set; }
        [Display(Name = "पुवि ")]
        public string East { get; set; }
        [Display(Name = "पन्चिम  ")]
        public string West { get; set; }
        [Display(Name = "उत्तर")]
        public string North { get; set; }
        [Display(Name = "दक्षिण ")]
        public string South { get; set; }
        //
        [Display(Name = "First Name")]
        public int jagaTarfa_id { get; set; }
        [Display(Name = "मुल सडक ")]
        public string MulSadak { get; set; }
        [Display(Name = "सहायक सडक")]
        public string sahayakSadaK { get; set; }
        [Display(Name = "कच्िी सडक")]
        public string KacchiSadak { get; set; }
        [Display(Name = " गोरेटो")]
        public string Goreto { get; set; }
        [Display(Name = "बाटो नभयेको ")]
        public string BatoNavaeko { get; set; }
        //
        [Display(Name = "First Name")]
        public int Karlayatarfa_id { get; set; }
        [Display(Name = "नाम")]
        public string Name { get; set; }
        [Display(Name = "ठेगान")]
        public string KAddress { get; set; }
        [Display(Name = "मिति ")]
        public string Date { get; set; }
        [Display(Name = "नाम,थर ")]
        public string KardartaFullName { get; set; }
        //public Nullable<int> citizen_ID { get; set; }
    }
}