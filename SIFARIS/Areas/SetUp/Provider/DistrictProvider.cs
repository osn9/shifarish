using SIFARIS.Areas.SetUp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.SetUp.Provider
{
    public class DistrictProvider
    {
        SifarishEntities ent = new SifarishEntities();
        public DistrictModel GetDistrictRecords(int ? id)
        {
            DistrictModel data = (from district in ent.tblDistricts
                                  where district.DistrictId_val==id
                                    select new DistrictModel
                                    {
                                       DistrictId=district.DistrictId,
                                       DistrictId_val=district.DistrictId_val,
                                       DistrictName=district.DistrictName,
                                       DistrictName_Nep=district.DistrictName_Nep,
                                       StateId_val=district.StateId_val,
                                                                           
                                    }).SingleOrDefault();

            return data;
        }
        public List<DistrictModel> GetDistrictList()
        {
            var model = new List<DistrictModel>();
   
            model = (from district in ent.tblDistricts
                     select new DistrictModel
                     {
                         DistrictId = district.DistrictId,
                         DistrictId_val = district.DistrictId_val,
                         DistrictName = district.DistrictName,
                         DistrictName_Nep = district.DistrictName_Nep,
                         StateId_val = district.StateId_val,
                     }).ToList();

            return model;
        }
        
    }
}