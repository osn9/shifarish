using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.DartaSupplement.Models
{
    public class NataPramanitSifarisModel
    {
        public NataPramanitSifarisModel()
        {
            NataPramanitSifarisModelList = new List<NataPramanitSifarisModel>();
            NataPramanitPersonalDetailModelList = new List<NataPramanitPersonalDetailModel>();
        }
        public int NewNataId { get; set; }
        public string NaamThar { get; set; }
        public string FullName { get; set; }
        public int Gender { get; set; }
        public Nullable<int> PermaState { get; set; }
        public Nullable<int> PermaDistrict { get; set; }
        public Nullable<int> PermaPalika { get; set; }
        public Nullable<int> PermaWard { get; set; }
        public string NagariktaPraPaNo { get; set; }
        public string NagariktaIssueDate { get; set; }
        public Nullable<int> NagariktaIssueDistrict { get; set; }
        public int NataPramanitFaramNo { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public Nullable<int> WorkOffice { get; set; }
        public Nullable<int> FiscalYear { get; set; }
        public List<NataPramanitSifarisModel> NataPramanitSifarisModelList { get; set; }
        public List<NataPramanitPersonalDetailModel> NataPramanitPersonalDetailModelList { get; set; }
    }
    public class NataPramanitPersonalDetailModel
    {
        public int NataPersonId { get; set; }
        public int NataId { get; set; }
        public string NaamThar { get; set; }
        public string FullName { get; set; }
        public Nullable<int> RelatonTo { get; set; }

    }
}