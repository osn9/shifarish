using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Models
{
    public class NirmanBebasahiViewModel
    {
        public int nirmanbebasaiId { get; set; }
        public string name { get; set; }
        public string address { get; set; }
        public string postboxNo { get; set; }
        public string TelPhoneNo { get; set; }
        public string FaxNo { get; set; }
        public string Email { get; set; }
        public string KaralayaName { get; set; }
        public string KaralayaAddress { get; set; }
        public string PramanPatraNo { get; set; }
        public string RegisterdDate { get; set; }
        public Nullable<System.DateTime> RegisterDateAd { get; set; }
        public Nullable<System.DateTime> AprovalDateAd { get; set; }
        public string ApprovealDate { get; set; }
        public string ApprovalKaryalaya { get; set; }
        public Nullable<System.DateTime> RenewalDatead { get; set; }
        public Nullable<int> approvalNo { get; set; }
        public string RenewalDate { get; set; }
        public string MembershipNo { get; set; }
        public string Amount { get; set; }
        public Nullable<decimal> AmountEng { get; set; }
        public string FormName { get; set; }
        public string FormAddress { get; set; }
        public string SanchalakName { get; set; }
        public string Date { get; set; }
        public Nullable<System.DateTime> DateAd { get; set; }
        public Nullable<System.DateTime> PrintDateAd { get; set; }
        public string PrintDate { get; set; }
        public Nullable<int> Createdby { get; set; }
        public Nullable<System.DateTime> CreateddDate { get; set; }
        public Nullable<System.DateTime> deletedDate { get; set; }
        public Nullable<int> Deletedby { get; set; }
        public Nullable<System.DateTime> updatedDate { get; set; }
        public Nullable<int> updatedBy { get; set; }
    }
}