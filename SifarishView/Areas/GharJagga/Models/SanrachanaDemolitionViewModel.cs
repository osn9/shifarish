using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SifarishView.Areas.GharJagga.Models
{
    public class SanrachanaDemolitionViewModel
    {
        public int id { get; set; }
        [Display(Name = "संरचना")]
        public string Type { get; set; }
        [Display(Name = "घर वा संरचनाको धनीको नाम")]

        public string Name { get; set; }
        [Display(Name = "संरचना रहेको ठेगाना")]
        public string Address { get; set; }
        [Display(Name = "घर वा संरचनाको धनीको संपर्क नं.")]
        public string Phone { get; set; }
        [Display(Name = "संरचना भत्काउनु पर्ने अन्य कुनै कारण भए")]
        public string Reason { get; set; }
        [Display(Name = "नाम, थर")]
        public string SuchakName { get; set; }
        [Display(Name = "घरधनी संगको नाता ः")]
        public string Relation { get; set; }
        [Display(Name = "सम्पर्क फोन नं")]
        public string SuchakPhone { get; set; }
        [Display(Name = "मिति")]
        public string Date { get; set; }
        [Display(Name = "संरचना")]
        public Nullable<System.DateTime> DateAd { get; set; }
        [Display(Name = "मिति")]
        public string PrindDate { get; set; }
        public Nullable<System.DateTime> PrintDateAd { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> DeletedDate { get; set; }
        public Nullable<int> DeletedBy { get; set; }
        public Nullable<System.DateTime> Updateddate { get; set; }
        public Nullable<int> updatedBy { get; set; }
        public Nullable<bool> Status { get; set; }

    }
}