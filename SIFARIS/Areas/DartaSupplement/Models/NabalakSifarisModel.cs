using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.DartaSupplement.Models
{
    public class NabalakSifarisModel
    {
        public NabalakSifarisModel()
        {
            NabalakSifarisModelList = new List<NabalakSifarisModel>();
        }
        public int NabalakId { get; set; }
        public int NabalakFaramNo { get; set; }
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
        public List<NabalakSifarisModel> NabalakSifarisModelList { get; set; }
        //relative
        public int NabalkRelativeInfoId { get; set; }
        public int MapNabalakId { get; set; }
        public string BabukoNaamThar { get; set; }
        public string BabukoFullName { get; set; }
        public string AamakoNaamThar { get; set; }
        public string AamakoFullName { get; set; }
        public string SamrakshakNaamThar { get; set; }
        public string GuardianFullName { get; set; }
    }
}