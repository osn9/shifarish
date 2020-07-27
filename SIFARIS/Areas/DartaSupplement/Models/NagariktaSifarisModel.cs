using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.DartaSupplement.Models
{
    public class NagariktaSifarisModel
    {
        public NagariktaSifarisModel()
        {
            NagariktaSifarisModelList = new List<NagariktaSifarisModel>();
        }
        public int NewNagariktaId { get; set; }
        public int NagariktaFaramNo { get; set; }
        public string NaamThar { get; set; }
        public string FullName { get; set; }
        public string JanmaMiti { get; set; }
        public string JanmaDate { get; set; }
        public Nullable<int> JanmaPradesh { get; set; }
        public Nullable<int> JanmaJilla { get; set; }
        public Nullable<int> JanmaPalika { get; set; }
        public Nullable<int> JanmaWard { get; set; }
        public Nullable<int> PermaPradesh { get; set; }
        public Nullable<int> PermaJilla { get; set; }
        public Nullable<int> PermaPalika { get; set; }
        public Nullable<int> PermaWard { get; set; }
        public int Gender { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public Nullable<int> WorkOffice { get; set; }
        public Nullable<int> FiscalYear { get; set; }
        public List<NagariktaSifarisModel> NagariktaSifarisModelList { get; set; }
        //relatives
        public int NagariktaRelativeInfoId { get; set; }
        public int NagariktaId { get; set; }
        public string BabukoNaamThar { get; set; }
        public string BabukoFullName { get; set; }
        public string BabuNagariktaNo { get; set; }
        public string BabuNagariktaIssueDate { get; set; }
        public Nullable<int> BabuNagariktaIssueDistrict { get; set; }
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