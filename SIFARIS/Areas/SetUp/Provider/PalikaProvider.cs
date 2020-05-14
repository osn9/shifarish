using SIFARIS.Areas.SetUp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.SetUp.Provider
{
    public class PalikaProvider
    {
        SifarishEntities ent = new SifarishEntities();
        public LocalLevelModel GetPalikaRecords(int? id)
        {
            LocalLevelModel data = (from palika in ent.tblPalikas
                                    where palika.PalikaId_val==id
                                  select new LocalLevelModel
                                  {
                                     PalikaId=palika.PalikaId,
                                     PalikaId_val=palika.PalikaId_val,
                                     PalikaName=palika.PalikaName,
                                     PalikaName_Nep=palika.PalikaName_Nep,
                                     DistrictId=palika.DistrictId

                                  }).SingleOrDefault();

            return data;
        }
        public List<LocalLevelModel> GetPalikaList()
        {
            var model = new List<LocalLevelModel>();

            model = (from palika in ent.tblPalikas
                     select new LocalLevelModel
                     {
                         PalikaId = palika.PalikaId,
                         PalikaId_val = palika.PalikaId_val,
                         PalikaName = palika.PalikaName,
                         PalikaName_Nep = palika.PalikaName_Nep,
                         DistrictId = palika.DistrictId
                     }).ToList();

            return model;
        }
    }
}