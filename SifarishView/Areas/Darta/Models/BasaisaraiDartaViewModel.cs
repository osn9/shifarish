using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace SifarishView.Areas.Darta.Models
{
    public class BasaisaraiDartaViewModel
    {
        public BasaisaraiDartaViewModel()
        {
            BasaisaraiDartaViewModelList = new List<BasaisaraiDartaViewModel>();
            BasaisaraiPersonalDetailsViewModelList = new List<BasaisaraiPersonalDetailsViewModel>();
        }
        public int NewMigrationId { get; set; }
        public int PanjiId { get; set; }
        [DisplayName("घरमुलीको नाम थर")]
        public string GharMuliNaamThar { get; set; }
        public string GharMuliFullName { get; set; }
        [DisplayName("सरि आएको दर्ता नं.")]
        public string BasaisaraiAayekoDartaNo { get; set; }
        [DisplayName("प्रदेश")]
        public Nullable<int> BasaisaraiAayekoPradesh { get; set; }
        [DisplayName("जिल्ला")]
        public Nullable<int> BasaisaraiAayekoJilla { get; set; }
        [DisplayName("गा.पा./न.पा.")]
        public Nullable<int> BasaisaraiAayekoPalika { get; set; }
        [DisplayName("वडा नं")]
        public Nullable<int> BasaisaraiAayekoWardNo { get; set; }
        [DisplayName("घर नं")]
        public string BasaisaraiAayekoGharNo { get; set; }
        [DisplayName("गाउँ/टोल")]
        public string BasaisaraiAayekoGaunTole { get; set; }
        public string BasaisaraiAayekoMiti { get; set; }
        public string BasaisaraiAayekoDate { get; set; }
        public Nullable<int> BasaisaraiAayekoKaran { get; set; }
        [DisplayName("सरी आएको ठेगाना")]
        public string AaunePermanentAddress { get { return Utility.GetPalikaById(Convert.ToInt32(BasaisaraiAayekoPalika)) + "-" + BasaisaraiAayekoWardNo + ", " + Utility.GetDistrictById(Convert.ToInt32(BasaisaraiAayekoJilla)) + ", " + Utility.GetStateById(Convert.ToInt32(BasaisaraiAayekoPradesh)); } }
        [DisplayName("प्रदेश")]
        public Nullable<int> BasaisaraiJanePradesh { get; set; }
        [DisplayName("जिल्ला")]
        public Nullable<int> BasaisaraiJaneJilla { get; set; }
        [DisplayName("गा.पा./न.पा.")]
        public Nullable<int> BasaisaraiJanePalika { get; set; }
        [DisplayName("वडा नं")]
        public Nullable<int> BasaisaraiJaneWardNo { get; set; }
        [DisplayName("घर नं")]
        public string BasaisaraiJaneGharNo { get; set; }
        [DisplayName("गाउँ/टोल")]
        public string BasaisaraiJaneGaunTole { get; set; }
        [DisplayName("सरी जाने ठेगाना")]
        public string JanePermanentAddress { get { return Utility.GetPalikaById(Convert.ToInt32(BasaisaraiJanePalika)) + "-" + BasaisaraiJaneWardNo + ", " + Utility.GetDistrictById(Convert.ToInt32(BasaisaraiJaneJilla)) + ", " + Utility.GetStateById(Convert.ToInt32(BasaisaraiJanePradesh)); } }
        public List<BasaisaraiDartaViewModel> BasaisaraiDartaViewModelList { get; set; }
        public List<BasaisaraiPersonalDetailsViewModel> BasaisaraiPersonalDetailsViewModelList { get; set; }
        //panjika
        public int PanjigarneId { get; set; }
        [DisplayName("प्रदेश")]
        public Nullable<int> PanjiState { get; set; }
        [DisplayName("जिल्ला")]
        public Nullable<int> PanjiDistrict { get; set; }
        [DisplayName("गा.पा./न.पा.")]
        public Nullable<int> PanjiPalika { get; set; }
        [DisplayName("वडा नं")]
        public Nullable<int> PanjiWardNo { get; set; }
        public string PanjiName { get; set; }
        public string PanjiName_Eng { get; set; }
        [DisplayName("कर्मचारी सङ्केत नं")]
        public int Panji_INVId { get; set; }
        [DisplayName("फारम दर्ता नं")]
        public int BasaisaraiFaramDartaNo { get; set; }
        [DisplayName("बसाई सराई फारम दर्ता नं")]
        public int? FaramNo { get; set; }
        [DisplayName("फारम दर्ता मिति")]
        public string FaramDartaMiti { get; set; }
        public string FaramaDartaDate { get; set; }
        public string PariwarLagatFaramNo { get; set; }
        public Nullable<int> FiscalYear { get; set; }
        public Nullable<int> WorkOffice { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        //informant
        public int NewMigrationInformantId { get; set; }
        public int MapInformantNewMigrationId { get; set; }
        public string InfNaamThar { get; set; }
        public string InfFullName { get; set; }
        public Nullable<int> InfState { get; set; }
        public Nullable<int> InfDistrict { get; set; }
        public Nullable<int> InfPalika { get; set; }
        public Nullable<int> InfWardNo { get; set; }
        public string InfGaunTole { get; set; }
        public string InfGharNo { get; set; }
        public string InfNagariktaPraPaNo { get; set; }
        public string InfNagariktaIssueDate { get; set; }
        public Nullable<int> InfNagariktaIssueDistrict { get; set; }
        public string InfPassportNo_Desh { get; set; }
        public string Miti { get; set; }
    }
    public class BasaisaraiPersonalDetailsViewModel
    {
        public int BasaisaraiDetailsId { get; set; }
        public int MapPersonNewMigrationId { get; set; }
        public Nullable<int> JanmaDartaNo { get; set; }
        public string NaamThar { get; set; }
        public string FullName { get; set; }
        public string JanmaMiti { get; set; }
        public string JanmaDate { get; set; }
        public Nullable<int> JanmaPradesh { get; set; }
        public Nullable<int> JanmaJilla { get; set; }
        public Nullable<int> JanmaPalika { get; set; }
        public Nullable<int> JanmaWardNo { get; set; }
        public Nullable<int> Gender { get; set; }
        public string NagariktaPraPaNo { get; set; }
        public string NagaritaIssueDate { get; set; }
        public Nullable<int> NagariktaIssueDistrict { get; set; }
        public string AnyRecords { get; set; }
        public Nullable<int> RelationTo { get; set; }
    }

}