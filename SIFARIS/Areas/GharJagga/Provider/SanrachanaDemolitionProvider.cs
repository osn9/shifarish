using SIFARIS.Areas.GharJagga.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Provider
{
    public class SanrachanaDemolitionProvider
    {
        public bool Insert(SanrachanaDemolitionViewModel model)
        {
            using (var con = new SifarishEntities())
            {
                if (model.id > 0)
                {

                    var data = con.Demolitions.Where(x => x.id == model.id).FirstOrDefault();
                    if (data != null)
                    {
                        data.Name = model.Name;
                        data.Address = model.Address;
                        data.Type = model.Type;
                        data.Phone = model.Phone;
                        data.Reason = model.Reason;
                        data.SuchakName = model.SuchakName;
                        data.SuchakPhone = model.SuchakPhone;
                        data.Relation = model.Relation;
                        data.Date = model.Date;
                        data.DateAd = model.DateAd;
                        data.PrindDate = model.PrindDate;
                        data.PrintDateAd = model.PrintDateAd;
                        data.CreatedBy = model.CreatedBy;
                        data.DeletedBy = model.DeletedBy;
                        data.DeletedDate = model.DeletedDate;
                      

                        con.Entry(data).State = System.Data.Entity.EntityState.Modified;



                        // var a=  con.SaveChanges();
                    }
                }
                else
                {
                    Demolition cdata = new Demolition()
                    {
                        Name = model.Name,
                        Type=model.Type,
                    Address = model.Address,

                    Phone = model.Phone,
                    Reason = model.Reason,
                    SuchakName = model.SuchakName,
                    SuchakPhone = model.SuchakPhone,
                    Relation = model.Relation,
                    Date = model.Date,
                    DateAd = model.DateAd,
                    PrindDate = model.PrindDate,
                    PrintDateAd = model.PrintDateAd,
                        CreatedBy = model.CreatedBy,
                    DeletedBy = model.DeletedBy,
                    DeletedDate = model.DeletedDate,

                };
                    con.Demolitions.Add(cdata);




                }
                int i = con.SaveChanges();
                if (i > 0)
                    return true;
                else
                    return false;
            }
        }
        public List<SanrachanaDemolitionViewModel> GetAll()
        {
            using (var con = new SifarishEntities())
            {
                var result = con.Demolitions


                                .Select(x => new SanrachanaDemolitionViewModel()
                                {
                                    Name = x.Name,
                                    Type = x.Type,
                                    Address = x.Address,
                                    id = x.id,

                                    Phone = x.Phone,
                                    Reason = x.Reason,
                                    SuchakName = x.SuchakName,
                                    SuchakPhone = x.SuchakPhone,
                                    Relation = x.Relation,
                                    Date = x.Date,
                                    DateAd = x.DateAd,
                                    PrindDate = x.PrindDate,
                                    PrintDateAd = x.PrintDateAd,
                                    CreatedBy = x.CreatedBy,
                                    DeletedBy = x.DeletedBy,
                                    DeletedDate = x.DeletedDate,

                                }).ToList();
                return result;
            }
        }

        public SanrachanaDemolitionViewModel GetById(int id)
        {
            using (var con = new SifarishEntities())
            {
                var result = con.Demolitions

                                .Select(x => new SanrachanaDemolitionViewModel()
                                {
                                    id=x.id,
                                    Name = x.Name,
                                    Type = x.Type,
                                    Address = x.Address,

                                    Phone = x.Phone,
                                    Reason = x.Reason,
                                    SuchakName = x.SuchakName,
                                    SuchakPhone = x.SuchakPhone,
                                    Relation = x.Relation,
                                    Date = x.Date,
                                    DateAd = x.DateAd,
                                    PrindDate = x.PrindDate,
                                    PrintDateAd = x.PrintDateAd,
                                    CreatedBy = x.CreatedBy,
                                    DeletedBy = x.DeletedBy,

                                }).Where(x => x.id == id).FirstOrDefault();
                return result;
            }
        }
    }
}