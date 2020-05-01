using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Models
{
    public class SanrachanaDemolitionViewModel
    {
        public int id { get; set; }
    
        public string Type { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Reason { get; set; }
        public string SuchakName { get; set; }
        public string Relation { get; set; }
        public string SuchakPhone { get; set; }
        public string Date { get; set; }
        public Nullable<System.DateTime> DateAd { get; set; }
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