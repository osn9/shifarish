using SIFARIS.Areas.GharJagga.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Provider
{
    public class FiscalyearProvider
    {
        public bool Insert(FiscalyearViewModel model)
        {
            using (var con = new SifarishEntities())
            {
                if (model.FiscalId > 0)
                {
                   
                    var data = con.fiscal_year.Where(x => x.FiscalId == model.FiscalId).FirstOrDefault();
                    if (data != null)
                    {
                        data.Nanem = model.Nanem;
                        data.PreviousYear = model.PreviousYear;
                        data.EndDate = model.EndDate;
                        data.EndDateAd = model.EndDateAd;
                        data.StartDate = model.StartDate;
                        data.StartDateAd = model.StartDateAd;
                        data.CreatedBy = model.CreatedBy;
                        data.CreatedDate = model.CreatedDate;
                        data.DeletedBy = model.DeletedBy;
                        data.DeletedDate = model.DeletedDate;
                        data.UpdatedDate = model.UpdatedDate;
                        data.UpdatteBy = model.UpdatteBy;
                       
                        con.Entry(data).State = System.Data.Entity.EntityState.Modified;



                        // var a=  con.SaveChanges();
                    }
                }
                else
                {
                    fiscal_year cdata = new fiscal_year()
                    {
                        Nanem = model.Nanem,
                    PreviousYear = model.PreviousYear,
                    EndDate = model.EndDate,
                    EndDateAd = model.EndDateAd,
                    StartDate = model.StartDate,
                    StartDateAd = model.StartDateAd,
                    CreatedBy = model.CreatedBy,
                    CreatedDate = model.CreatedDate,
                    DeletedBy = model.DeletedBy,
                    DeletedDate = model.DeletedDate,
                    UpdatedDate = model.UpdatedDate,
                    UpdatteBy = model.UpdatteBy,

                   
                    };
                    con.fiscal_year.Add(cdata);
                   
                    
                    

                }
                int i = con.SaveChanges();
                if (i > 0)
                    return true;
                else
                    return false;
            }
        }
        public List<FiscalyearViewModel> GetAll()
        {
            using (var con = new SifarishEntities())
            {
                var result = con.fiscal_year
                               

                                .Select(x => new FiscalyearViewModel()
                                {
                                    FiscalId = x.FiscalId,
                                    Nanem = x.Nanem,
                PreviousYear = x.PreviousYear,
                EndDate = x.EndDate,
                EndDateAd = x.EndDateAd,
                StartDate = x.StartDate,
                StartDateAd = x.StartDateAd,
                CreatedBy = x.CreatedBy,
                CreatedDate = x.CreatedDate,
                DeletedBy = x.DeletedBy,
                DeletedDate = x.DeletedDate,
                UpdatedDate = x.UpdatedDate,
                UpdatteBy = x.UpdatteBy,


            }).ToList();
                return result;
            }
        }

        public FiscalyearViewModel GetById(int id)
        {
            using (var con = new SifarishEntities())
            {
                var result = con.fiscal_year

                                .Select(x => new FiscalyearViewModel()
                                {
                                    FiscalId=x.FiscalId,
                                    Nanem = x.Nanem,
                                    PreviousYear = x.PreviousYear,
                                    EndDate = x.EndDate,
                                    EndDateAd = x.EndDateAd,
                                    StartDate = x.StartDate,
                                    StartDateAd = x.StartDateAd,
                                    CreatedBy = x.CreatedBy,
                                    CreatedDate = x.CreatedDate,
                                    DeletedBy = x.DeletedBy,
                                    DeletedDate = x.DeletedDate,
                                    UpdatedDate = x.UpdatedDate,
                                    UpdatteBy = x.UpdatteBy,

                                }).Where(x => x.FiscalId == id).FirstOrDefault();
                return result;
            }
        }
    }
}