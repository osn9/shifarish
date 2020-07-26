using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Sifaris.Models
{
    public class VivahDartaModel
    {
        public VivahDartaModel()
        {
            VivahDartaModelList=new List<VivahDartaModel>();
           
        }

        public int NewMarriageId { get; set; }
        public int PanjiId { get; set; }
        public Nullable<int> VivahKisim { get; set; }
        public string VivahBhayekoMiti { get; set; }
        public string VivahBhayekoDate { get; set; }
        [DisplayName("प्रदेश")]
        public Nullable<int> VivahPradesh { get; set; }
         [DisplayName("जिल्ला")]
        public Nullable<int> VivahJilla { get; set; }
        [DisplayName("गा.पा./न.पा.")]
        public Nullable<int> VivahPalika { get; set; }
        [DisplayName("वडा नं")]
        public Nullable<int> VivahWardNo { get; set; }
        public string VivahGaunTole { get; set; }
        public string VivahGharNo { get; set; }
        public string VivahBidesh { get; set; }
        public string VivahForeign { get; set; }
        public List<VivahDartaModel> VivahDartaModelList { get; set; }
        
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
        public int VivahFaramDartaNo { get; set; }
        [DisplayName("विवाह फारम दर्ता नं")]
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
        //bride
        public int NewMarriageBrideDetailsId { get; set; }
        public int MapBrideNewMarriageId { get; set; }
        public string BrideNaamThar { get; set; }
        public string BrideFullName { get; set; }
        public string BrideJanmaMiti { get; set; }
        public string BrideJaatJati { get; set; }
        public bool BrideMaritalStatus { get; set; }
        public Nullable<int> BrideShikshaSthar { get; set; }
        public Nullable<int> BridePesha { get; set; }
        public string BrideDharma { get; set; }
        public string BrideMatriBhasa { get; set; }
        public Nullable<int> BridePermaState { get; set; }
        public Nullable<int> BridePermaDistrict { get; set; }
        public Nullable<int> BridePermaPalika { get; set; }
        public Nullable<int> BridePermaWardNo { get; set; }
        public string BrideGaunTole { get; set; }
        public string BrideGharNo { get; set; }
        public string BrideJanmaDesh { get; set; }
        public string BrideNagariktaLiyekoDesh { get; set; }
        public string BrideNagariktaPraPaNo { get; set; }
        public string BrideNagariktaIssueDate { get; set; }
        public Nullable<int> BrideNagariktaIsssueDistrict { get; set; }
        public string BridePassportNo_Desh { get; set; }
        public string BrideBideshThegana { get; set; }
        public string BrideForeignThegana { get; set; }
        public string BrideBajekoNaam { get; set; }
        public string BrideGrandfather { get; set; }
        public string BrideBabukoNaam { get; set; }
        public string BrideFatherName { get; set; }
        public string BrideAamakoNaam { get; set; }
        public string BrideMotherName { get; set; }
        public int? BrideVivahGardaAge { get; set; }
        //groom
        public int NewMarriageGroomDetailsId { get; set; }
        public int MapGroomNewMarriageId { get; set; }
        public string GroomNaamThar { get; set; }
        public string GroomFullName { get; set; }
        public string GroomJanmaMiti { get; set; }
        public string GroomJaatJati { get; set; }
        public bool GroomMaritalStatus { get; set; }
        public Nullable<int> GroomShikshaSthar { get; set; }
        public Nullable<int> GroomPesha { get; set; }
        public string GroomDharma { get; set; }
        public string GroomMatriBhasa { get; set; }
        public Nullable<int> GroomPermaState { get; set; }
        public Nullable<int> GroomPermaDistrict { get; set; }
        public Nullable<int> GroomPermaPalika { get; set; }
        public Nullable<int> GroomPermaWardNo { get; set; }
        public string GroomGaunTole { get; set; }
        public string GroomGharNo { get; set; }
        public string GroomJanmaDesh { get; set; }
        public string GroomNagariktaLiyekoDesh { get; set; }
        public string GroomNagariktaPraPaNo { get; set; }
        public string GroomNagariktaIssueDate { get; set; }
        public Nullable<int> GroomNagariktaIsssueDistrict { get; set; }
        public string GroomPassportNo_Desh { get; set; }
        public string GroomBideshThegana { get; set; }
        public string GroomForeignThegana { get; set; }
        public string GroomBajekoNaam { get; set; }
        public string GroomGrandfather { get; set; }
        public string GroomBabukoNaam { get; set; }
        public string GroomFatherName { get; set; }
        public string GroomAamakoNaam { get; set; }
        public string GroomMotherName { get; set; }
        public int? GroomVivahGardaAge { get; set; }
        //informant
        public int NewMarriageInformantId { get; set; }
        public Nullable<int> MapInformantNewMarriageId { get; set; }
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
    
}