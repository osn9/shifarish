using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace SifarishView.Areas.DartaSupplement.Models
{
    public class NabalakSifarisViewModel
    {
        public NabalakSifarisViewModel()
        {
            NabalakSifarisViewModelList = new List<NabalakSifarisViewModel>();
        }
        public int NabalakId { get; set; }
        [DisplayName("फारम दर्ता नं")]
        public int NabalakFaramNo { get; set; }
        [DisplayName("दर्ता नं")]
        public int? FaramNo { get; set; }
        [DisplayName("पूरा नाम थर")]
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

        public List<NabalakSifarisViewModel> NabalakSifarisViewModelList { get; set; }
        //relative
        public int NabalkRelativeInfoId { get; set; }
        public int MapNabalakId { get; set; }
        [DisplayName("बाबुको नाम")]
        public string BabukoNaamThar { get; set; }
        public string BabukoFullName { get; set; }
        [DisplayName("आमाको नाम")]
        public string AamakoNaamThar { get; set; }
        public string AamakoFullName { get; set; }
        public string SamrakshakNaamThar { get; set; }
        public string GuardianFullName { get; set; }
    }
}