using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Models
{
    public class GharJaggaKarViewModel
    {
        public int id { get; set; }
        public Nullable<int> ward { get; set; }
        public string gharNo { get; set; }
        public string kittaNo { get; set; }
        public string Address { get; set; }
        public string Area { get; set; }
        public string BuildDate { get; set; }
        public string Length { get; set; }
        public string breadth { get; set; }
        public string Height { get; set; }
        public string GharDesigin { get; set; }
        public string Road { get; set; }
        public string roadType { get; set; }
        public string NibedakName { get; set; }
        public string NibedakAddress { get; set; }
        public string phone { get; set; }
        public string marphatName { get; set; }
        public string Date { get; set; }
        public string dateAd { get; set; }
        public string PrintDate { get; set; }
        public string printDateAd { get; set; }
        public Nullable<System.DateTime> CreatedDae { get; set; }
        public Nullable<System.DateTime> deltedDate { get; set; }
        public Nullable<System.DateTime> updatedate { get; set; }
        public Nullable<int> updateBy { get; set; }
        public Nullable<int> createby { get; set; }
        public Nullable<int> deletedby { get; set; }
    }
}