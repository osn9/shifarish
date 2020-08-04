using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;

namespace SifarishView.Areas.Darta.Models
{
    public class JanmaDartaViewModel
    {
        public JanmaDartaViewModel()
        {
            JanmaDartaViewModelList = new List<JanmaDartaViewModel>();
        }
        public int NewbornId { get; set; }
        public int PanjiId { get; set; }
        [DisplayName("पूरा नाम थर")]
        public string NewbornNaam { get; set; }
        [DisplayName("पूरा नाम थर (In English) ")]
        public string NewbornName { get; set; }
        [DisplayName("जन्म मिति ")]
        public string JanmaMiti { get; set; }
        public string JanmaDate { get; set; }
        public DateTime borndate { get; set; }
        [DisplayName("शिशु जन्मेको ठाउँ")]
        public Nullable<int> JanmaSthaan { get; set; }
        [DisplayName("शिशु जन्मदा मद्दत गर्ने")]
        public Nullable<int> JanmadaMadatt { get; set; }
        [DisplayName("लिङ्ग")]
        public int Gender { get; set; }
        [DisplayName("जन्मेको किसिम")]
        public Nullable<int> JanmaKisim { get; set; }
        [DisplayName("जात/जाति")]
        public string JanmaJaatJati { get; set; }
        [DisplayName("प्रदेश")]
        public Nullable<int> JanmaPradesh { get; set; }
        [DisplayName("जिल्ला")]
        public Nullable<int> JanmaJilla { get; set; }
        [DisplayName("गा.पा./न.पा.")]
        public Nullable<int> JanmaPalika { get; set; }
        [DisplayName("वडा नं")]
        public Nullable<int> JanmaWardNo { get; set; }
        public string JanmaBidesh { get; set; }
        public string JanmaForeign { get; set; }
        public string BajekoNaam { get; set; }
        public string GrandFather { get; set; }
        [DisplayName("स्थायी ठेगाना")]
        public string PermanentAddress { get { return Utility.GetPalikaById(Convert.ToInt32(JanmaPalika)) + "-" + JanmaWardNo + ", " + Utility.GetDistrictById(Convert.ToInt32(JanmaJilla)) + ", " + Utility.GetStateById(Convert.ToInt32(JanmaPradesh)); } }
        public List<JanmaDartaViewModel> JanmaDartaViewModelList { get; set; }

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
        public int JanmaFaramDartaNo { get; set; }
        [DisplayName("जन्म फारम दर्ता नं")]
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

        //fatherdetail
        public int NewbornFatherId { get; set; }
        public int MapFatherNewbornId { get; set; }
        [DisplayName("बाबुको नाम थर")]
        public string FatherNaamThar { get; set; }
        public string FatherFullName { get; set; }
        public Nullable<int> FatherPermaState { get; set; }
        public Nullable<int> FatherPermaDistrict { get; set; }
        public Nullable<int> FatherPermaPalika { get; set; }
        public Nullable<int> FatherPermaWardNo { get; set; }
        public string FatherGaunTole { get; set; }
        public string FatherGharNo { get; set; }
        public Nullable<int> FatherSisuJanmidakoUmer { get; set; }
        public string FatherJanmaDesh { get; set; }
        public string FatherNagariktaLiyekoDesh { get; set; }
        public string FatherNagariktaPraPaNo { get; set; }
        public string FatherNagariktaIssueDate { get; set; }
        public Nullable<int> FatherNagariktaIsssueDistrict { get; set; }
        public string FatherPassportNo_Desh { get; set; }
        public Nullable<int> FatherShikshaSthar { get; set; }
        public Nullable<int> FatherPesha { get; set; }
        public string FatherDharma { get; set; }
        public string FatherMatriBhasa { get; set; }
        public Nullable<int> TotalChild { get; set; }
        public Nullable<int> TotalLiveChild { get; set; }
        public string VivahDartaNo { get; set; }
        public string VivahMiti { get; set; }
        public string VivahDate { get; set; }

        //motherdetail
        public int NewBornMotherId { get; set; }
        public int MapMotherNewbornId { get; set; }
        [DisplayName("आमाको नाम थर")]
        public string MotherNaamThar { get; set; }
        public string MotherFullName { get; set; }
        public Nullable<int> MotherPermaState { get; set; }
        public Nullable<int> MotherPermaDistrict { get; set; }
        public Nullable<int> MotherPermaPalika { get; set; }
        public Nullable<int> MotherPermaWardNo { get; set; }
        public string MotherGaunTole { get; set; }
        public string MotherGharNo { get; set; }
        public Nullable<int> MotherSisuJanmidakoUmer { get; set; }
        public string MotherJanmaDesh { get; set; }
        public string MotherNagariktaLiyekoDesh { get; set; }
        public string MotherNagariktaPraPaNo { get; set; }
        public string MotherNagariktaIssueDate { get; set; }
        public Nullable<int> MotherNagariktaIssueDistrict { get; set; }
        public string MotherPassportNo_Desh { get; set; }
        public Nullable<int> MotherShikshaSthar { get; set; }
        public Nullable<int> MotherPesha { get; set; }
        public string MotherDharma { get; set; }
        public string MotherMatriBhasa { get; set; }

        //informantdetail
        public int NewBornInformantId { get; set; }
        public int MapInformantNewbornId { get; set; }
        public string InfNaamThar { get; set; }
        public string InfFullName { get; set; }
        public int InfRelationToNewBorn { get; set; }
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
}