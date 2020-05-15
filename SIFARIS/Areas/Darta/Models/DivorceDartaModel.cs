using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.Darta.Models
{
    public class DivorceDartaModel
    {
        public DivorceDartaModel()
        {
            DivorceDartaModelList = new List<DivorceDartaModel>();
        }
        public int DivorceId { get; set; }
        public int PanjiId { get; set; }
        public Nullable<int> CourtType { get; set; }
        public Nullable<int> District { get; set; }
        public string NirnayaNo { get; set; }
        public string NinayaMiti { get; set; }
        public string VivahDartaNo { get; set; }
        public List<DivorceDartaModel> DivorceDartaModelList { get; set; }
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
        public int DivorceFaramDartaNo { get; set; }
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
        //divorcee husband
        public int DivorceeHusbandId { get; set; }
        public int MapHusbandDivorceId { get; set; }
        public string HusbandNaamThar { get; set; }
        public string HusbandFullName { get; set; }
        public string HusbandJanmaMiti { get; set; }
        public string HusbandJanmaDartaNo { get; set; }
        public string HusbandJanmaDesh { get; set; }
        public string HusbandNagariktaPraPaNo { get; set; }
        public string HusbandNagariktaIssueDate { get; set; }
        public Nullable<int> HusbandNagariktaIssueDistrict { get; set; }
        public string HusbandBideshPassport_Desh { get; set; }
        public Nullable<int> HusbandDistrict { get; set; }
        public Nullable<int> HusbandPalika { get; set; }
        public Nullable<int> HusbandWardNo { get; set; }
        public string HusbandJaatJati { get; set; }
        public Nullable<int> HusbandShikshaSthar { get; set; }
        public string HusbandDharma { get; set; }
        public string HusbandMatriBhasa { get; set; }
        public string HusbandBaajekoNaamThar { get; set; }
        public string HusbandBaajekoFullName { get; set; }
        public string HusbandBabukoNaamThar { get; set; }
        public string HusbandBabukoFullName { get; set; }
        public string HusbandAamakoNaamThar { get; set; }
        public string HusbandAamakoFullName { get; set; }
        public string VivahMiti { get; set; }
        public string VivahDate { get; set; }
        public Nullable<int> TotalChildBorn { get; set; }
        public Nullable<int> TotalLiveChild { get; set; }
        public Nullable<int> HusbandChildLivingWith { get; set; }
        public Nullable<int> HusbandSonLivingWith { get; set; }
        public Nullable<int> HusbandDaughterLivingWith { get; set; }
        //divorcee wife
        public int DivorceeWifeId { get; set; }
        public int MapWifeDivorceId { get; set; }
        public string WifeNaamThar { get; set; }
        public string WifeFullName { get; set; }
        public string WifeJanmaMiti { get; set; }
        public string WifeJanmaDartaNo { get; set; }
        public string WifeJanmaDesh { get; set; }
        public string WifeNagariktaPraPaNo { get; set; }
        public string WifeNagariktaIssueDate { get; set; }
        public Nullable<int> WifeNagariktaIssueDistrict { get; set; }
        public string WifeBideshPassport_Desh { get; set; }
        public Nullable<int> WifeDistrict { get; set; }
        public Nullable<int> WifePalika { get; set; }
        public Nullable<int> WifeWardNo { get; set; }
        public string WifeJaatJati { get; set; }
        public Nullable<int> WifeShikshaSthar { get; set; }
        public string WifeDharma { get; set; }
        public string WifeMatriBhasa { get; set; }
        public string WifeBaajekoNaamThar { get; set; }
        public string WifeBaajekoFullName { get; set; }
        public string WifeBabukoNaamThar { get; set; }
        public string WifeBabukoFullName { get; set; }
        public string WifeAamakoNaamThar { get; set; }
        public string WifeAamakoFullName { get; set; }
        public Nullable<int> WifeChildLivingWith { get; set; }
        public Nullable<int> WifeSonLivingWith { get; set; }
        public Nullable<int> WifeDaughterLivingWith { get; set; }
        //divorcee informant
        public int DivorceInformantId { get; set; }
        public int MapInformantDivorceId { get; set; }
        public string InfNaamThar { get; set; }
        public string InfFullName { get; set; }
        public Nullable<int> InfRelationToDivorcee { get; set; }
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