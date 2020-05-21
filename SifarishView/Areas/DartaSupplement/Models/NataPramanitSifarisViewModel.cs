using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace SifarishView.Areas.DartaSupplement.Models
{
    public class NataPramanitSifarisViewModel
    {
        public NataPramanitSifarisViewModel()
        {
            NataPramanitSifarisViewModelList = new List<NataPramanitSifarisViewModel>();
            NataPramanitPersonalDetailViewModelList = new List<NataPramanitPersonalDetailViewModel>();
        }
        public int NewNataId { get; set; }
        [DisplayName("पूरा नाम थर ")]
        public string NaamThar { get; set; }
        [DisplayName("पूरा नाम थर (In English) ")]
        public string FullName { get; set; }
        [DisplayName("लिङ्ग")]
        public int Gender { get; set; }
        [DisplayName("प्रदेश")]
        public Nullable<int> PermaState { get; set; }
        [DisplayName("जिल्ला")]
        public Nullable<int> PermaDistrict { get; set; }
        [DisplayName("गा.पा./न.पा.")]
        public Nullable<int> PermaPalika { get; set; }
        [DisplayName("वडा नं")]
        public Nullable<int> PermaWard { get; set; }
        [DisplayName("ना.प्र.प.नं.")]
        public string NagariktaPraPaNo { get; set; }
        public string NagariktaIssueDate { get; set; }
        public Nullable<int> NagariktaIssueDistrict { get; set; }
        [DisplayName("फारम नं.")]
        public int NataPramanitFaramNo { get; set; }
        [DisplayName("फारम दर्ता नं")]
        public int? FaramNo { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public Nullable<int> WorkOffice { get; set; }
        public Nullable<int> FiscalYear { get; set; }
        [DisplayName("स्थायी ठेगाना")]
        public string PermanentAddress { get { return Utility.GetPalikaById(Convert.ToInt32(PermaPalika)) + "-" + PermaWard + ", " + Utility.GetDistrictById(Convert.ToInt32(PermaDistrict)) + ", " + Utility.GetStateById(Convert.ToInt32(PermaState)); } }

        public List<NataPramanitSifarisViewModel> NataPramanitSifarisViewModelList { get; set; }
        public List<NataPramanitPersonalDetailViewModel> NataPramanitPersonalDetailViewModelList { get; set; }
    }
    public class NataPramanitPersonalDetailViewModel
    {
        public int NataPersonId { get; set; }
        public int NataId { get; set; }
        public string NaamThar { get; set; }
        public string FullName { get; set; }
        public Nullable<int> RelatonTo { get; set; }

    }
}
