using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Sifaris.Models
{
    public class MrityuDartaModel
    {
        public MrityuDartaModel()
        {
            MrityuDartaModelList = new List<MrityuDartaModel>();            
        }
        public int NewDeathId { get; set; }
        public int PanjiId { get; set; }
        [DisplayName("पूरा नाम थर")]
        public string NaamThar { get; set; }
        [DisplayName("पूरा नाम थर (In English) ")]
        public string FullName { get; set; }
         [DisplayName("लिङ्ग")]
        public Nullable<int> Gender { get; set; }
        [DisplayName("मृत्यु मिति")]
        public string MrityuMiti { get; set; }
        public string MrityuDate { get; set; }
        [DisplayName("उमेर")]
        public Nullable<int> Age { get; set; }
         [DisplayName("प्रदेश")]
        public Nullable<int> MrityuPradesh { get; set; }
        [DisplayName("जिल्ला")]
        public Nullable<int> MrityuJilla { get; set; }
        [DisplayName("गा.पा./न.पा.")]
        public Nullable<int> MrityuPalika { get; set; }
        [DisplayName("वडा नं")]
        public Nullable<int> MrityuWardNo { get; set; }
        public string MrityuGaunTole { get; set; }
        public string MrityuGharNo { get; set; }
        public Nullable<int> MrityuBhayekoSthaan { get; set; }
        [DisplayName("स्थायी ठेगाना")]
        public string PermanentAddress { get { return Utility.GetPalikaById(Convert.ToInt32(MrityuPalika)) + "-" + MrityuWardNo + ", " + Utility.GetDistrictById(Convert.ToInt32(MrityuJilla))+","+Utility.GetStateById(Convert.ToInt32(MrityuPradesh)); } }
        public List<MrityuDartaModel> MrityuDartaModelList { get; set; }
       
        //personaldetail
        public int NewDeathDetailsId { get; set; }
        public int MapPersonNewDeathId { get; set; }
        public Nullable<int> JanmaDartaNo { get; set; }
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
        public Nullable<int> JanmaWardNo { get; set; }
        public string JanmaGaunTole { get; set; }
        public string JanmaGharNo { get; set; }
        public string NagariktaPraPaNo { get; set; }
        public string NagariktaIsssueDate { get; set; }
        public Nullable<int> NagariktaIssueDistrict { get; set; }
        public string PassportNo_Desh { get; set; }
        public Nullable<int> ShikshaSthar { get; set; }
        public string MatriBhasa { get; set; }
        public string Dharma { get; set; }
        public string JaatJaati { get; set; }
        public string BajekoNaam { get; set; }
        public string Grandfather { get; set; }
        public string BabuNaam { get; set; }
        public string FatherName { get; set; }
        public string AamaNaam { get; set; }
        public string MotherName { get; set; }
        public bool MaritalStatus { get; set; }
        public string SpouseNaam { get; set; }
        public string SpouseName { get; set; }
        public string MrityuKaran { get; set; }

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
        public int MrityuFaramDartaNo { get; set; }
         [DisplayName("मृत्यु फारम दर्ता नं")]
        public int? FaramNo { get; set; }
        [DisplayName("फारम दर्ता मिति")]
        public string FaramDartaMiti { get; set; }
        public string FaramDartaDate { get; set; }
        public string PariwarLagatFaramNo { get; set; }
        public Nullable<int> FiscalYear { get; set; }
        public Nullable<int> WorkOffice { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }

        //informant
        public int NewDeathInformantId { get; set; }
        public int MapInformantNewdeathId { get; set; }
        public string InfNaamThar { get; set; }
        public string InfFullName { get; set; }
        public int InfRelationToNewDeath { get; set; }
        public Nullable<int> InfPradesh { get; set; }
        public Nullable<int> InfJilla { get; set; }
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
    
}