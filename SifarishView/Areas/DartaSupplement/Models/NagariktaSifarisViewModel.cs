using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;

namespace SifarishView.Areas.DartaSupplement.Models
{
    public class NagariktaSifarisViewModel
    {
        public NagariktaSifarisViewModel()
        {
            NagariktaSifarisViewModelList = new List<NagariktaSifarisViewModel>();
        }
        public int NewNagariktaId { get; set; }
        [DisplayName("फारम दर्ता नं")]
        public int NagariktaFaramNo { get; set; }
        [DisplayName("दर्ता नं")]
        public int? FaramNo { get; set; }
        [DisplayName("पूरा नाम थर ")]
        public string NaamThar { get; set; }
        [DisplayName("पूरा नाम थर (In English) ")]
        public string FullName { get; set; }
        [DisplayName("जन्म मिति ")]
        public string JanmaMiti { get; set; }
        public string JanmaDate { get; set; }
        [DisplayName("प्रदेश")]
        public Nullable<int> JanmaPradesh { get; set; }
        [DisplayName("जिल्ला")]
        public Nullable<int> JanmaJilla { get; set; }
        [DisplayName("गा.पा./न.पा.")]
        public Nullable<int> JanmaPalika { get; set; }
        [DisplayName("वडा नं")]
        public Nullable<int> JanmaWard { get; set; }
        [DisplayName("प्रदेश")]
        public Nullable<int> PermaPradesh { get; set; }
        [DisplayName("जिल्ला")]
        public Nullable<int> PermaJilla { get; set; }
        [DisplayName("गा.पा./न.पा.")]
        public Nullable<int> PermaPalika { get; set; }
        [DisplayName("वडा नं")]
        public Nullable<int> PermaWard { get; set; }
        [DisplayName("लिङ्ग")]
        public int Gender { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public Nullable<int> WorkOffice { get; set; }
        public Nullable<int> FiscalYear { get; set; }
        [DisplayName("स्थायी ठेगाना")]
        public string PermanentAddress { get { return Utility.GetPalikaById(Convert.ToInt32(PermaPalika)) + "-" + PermaWard + ", " + Utility.GetDistrictById(Convert.ToInt32(PermaJilla)) + ", " + Utility.GetStateById(Convert.ToInt32(PermaPradesh)); } }

        public List<NagariktaSifarisViewModel> NagariktaSifarisViewModelList { get; set; }
        //relatives
        public int NagariktaRelativeInfoId { get; set; }
        public int NagariktaId { get; set; }
        [DisplayName("बाबुको नाम")]
        public string BabukoNaamThar { get; set; }
        public string BabukoFullName { get; set; }
        public string BabuNagariktaNo { get; set; }
        public string BabuNagariktaIssueDate { get; set; }
        public Nullable<int> BabuNagariktaIssueDistrict { get; set; }
        [DisplayName("आमाको नाम")]
        public string AamakoNaamThar { get; set; }
        public string AamakoFullName { get; set; }
        public string AamaNagariktaNo { get; set; }
        public string AamaNagariktaIssueDate { get; set; }
        public Nullable<int> AamaNagariktaIssueDistrict { get; set; }
        public string PatikoNaamThar { get; set; }
        public string PatikoFullName { get; set; }
        public string PatiNagariktaNo { get; set; }
        public string PatiNagariktaIssueDate { get; set; }
        public Nullable<int> PatiNagariktaIssueDistrict { get; set; }
    }
}