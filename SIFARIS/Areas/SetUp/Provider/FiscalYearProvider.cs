using SIFARIS.Areas.SetUp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.SetUp.Provider
{
    public class FiscalYearProvider
    {
        public List<FiscalYearModel> PopulateRecords()
        {
            using (SifarishEntities ent = new SifarishEntities())
            {
                FiscalYearModel model = new FiscalYearModel();
                List<FiscalYearModel> ReslutList = ent.tblFiscalYears.Select(x => new FiscalYearModel()
                {
                    FiscalYearId = x.FiscalYearId,
                    FiscalYear = x.Title,

                    STATUS = x.IsActive,
                    StartDate = x.StartDate ?? DateTime.MinValue,
                    EndDate = x.EndDate ?? DateTime.MinValue


                }).ToList();
                return ReslutList;
            }
        }
        public bool EditFiscalYear(int id, FiscalYearModel model)
        {
            string Fysical = string.Empty;
            using (SifarishEntities ent = new SifarishEntities())
            {
                if (model.STATUS)
                {
                    var data = ent.tblFiscalYears.Where(x => x.IsActive == true).FirstOrDefault();
                    if (data != null)
                    {
                        data.IsActive = false;
                        ent.SaveChanges();
                    }
                }
                var obj = ent.tblFiscalYears.Where(x => x.FiscalYearId == id).SingleOrDefault();
                obj.Title = model.FiscalYear;
                obj.IsActive = model.STATUS;
                obj.StartDate = Utility.GetRomanDate(model.StartDateN).Value;
                obj.EndDate = Utility.GetRomanDate(model.EndDateN).Value;



                int i = ent.SaveChanges();
                if (i > 0)
                    return true;
                else
                    return false;
            }
        }

        public bool InsertFiscalYear(FiscalYearModel model)
        {
            string Fysical = string.Empty;
            using (SifarishEntities ent = new SifarishEntities())
            {
                if (model.STATUS)
                {
                    var data = ent.tblFiscalYears.Where(x => x.IsActive == true).FirstOrDefault();
                    if (data != null)
                    {
                        data.IsActive = false;
                        ent.SaveChanges();
                    }
                }
                var objInsertFiscalYear = new tblFiscalYear()
                {
                    Title = model.FiscalYear,
                    IsActive = model.STATUS,
                    StartDate = Utility.GetRomanDate(model.StartDateN).Value,
                    EndDate = Utility.GetRomanDate(model.EndDateN).Value
                };
                ent.tblFiscalYears.Add(objInsertFiscalYear);
                int i = ent.SaveChanges();
                if (i > 0)
                    return true;
                else
                    return false;
            }
        }



        public bool DeleteFiscalYear(int id)
        {
            using (SifarishEntities ent = new SifarishEntities())
            {
                var objDeleteFiscalYear = ent.tblFiscalYears.Where(x => x.FiscalYearId == id).SingleOrDefault();
                ent.tblFiscalYears.Remove(objDeleteFiscalYear);
                int i = ent.SaveChanges();
                if (i > 0)
                    return true;
                else
                    return false;
            }
        }
        public bool SetFiscalActive(int id)
        {
            using (SifarishEntities ent = new SifarishEntities())
            {

                try
                {
                    var fisicalYearList = ent.tblFiscalYears.ToList();
                    fisicalYearList.ForEach(x => x.IsActive = false);
                    fisicalYearList.First(x => x.FiscalYearId == id).IsActive = true;
                    ent.SaveChanges();
                    return true;
                }
                catch (Exception)
                {

                    return false;
                }
            }
        }
    }
}