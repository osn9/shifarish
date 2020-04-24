﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Models
{
    public class NirmanBebasahiApprovalViewModel
    {
        public int id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string PostBoxNo { get; set; }
        public string Telephone { get; set; }
        public string CompanyTypr { get; set; }
        public string ComapanyPersonelName { get; set; }
        public string CompanyPersonelAddress { get; set; }
        public string CompanyPersonelPostbosNo { get; set; }
        public string CompanyPersonelTelephone { get; set; }
        public string CompanyPersonelFax { get; set; }
        public string CompanyPersonelEmail { get; set; }
        public string RegisterationNo { get; set; }
        public string RegistrarionDate { get; set; }
        public Nullable<System.DateTime> RegistrationDateAd { get; set; }
        public string AdhiriktaPuji { get; set; }
        public Nullable<decimal> AdhirikataPujiEng { get; set; }
        public string JariPugi { get; set; }
        public Nullable<decimal> JariPujiEng { get; set; }
        public string Grade { get; set; }
        public string groups { get; set; }
        public string Technical { get; set; }
        public string NonTechnical { get; set; }
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