using SIFARIS.Areas.GharJagga.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Provider
{
    public class GharBatoProvider
    {

        public bool Insert(gahrBatoViewModel model)
        {
            using (var con = new SifarishEntities())
            {
                if (model.id > 0)
                {

                    var data = con.gharBatoes.Where(x => x.id == model.id).FirstOrDefault();
                    if (data != null)
                    {
                        data.munOrvdcName = model.munOrvdcName;
                        data.Ward = model.Ward;
                        data.KittaNo = model.KittaNo;
                        data.buyerFatherName = model.buyerFatherName;
                        data.buyerName = model.buyerName;
                        data.SellerFatherName = model.SellerFatherName;
                        data.SellerName = model.SellerName;
                        data.Date = model.Date;
                        data.DateAd = model.DateAd;
                        data.PrintDate = model.PrintDate;
                        data.PrintDateAd = model.PrintDateAd;
                        data.CreatedDate = model.CreatedDate;
                        data.CreatedBy = model.CreatedBy;
                        data.DeletedBy = model.DeletedBy;
                        data.DeletedDate = model.DeletedDate;
                        con.Entry(data).State = System.Data.Entity.EntityState.Modified;
                    }
                }
                else
                {
                    gharBato cdata = new gharBato()
                    {
                        munOrvdcName = model.munOrvdcName,
                    Ward = model.Ward,
                    KittaNo = model.KittaNo,
                    buyerFatherName = model.buyerFatherName,
                    buyerName = model.buyerName,
                    SellerFatherName = model.SellerFatherName,
                    SellerName = model.SellerName,
                    Date = model.Date,
                    DateAd = model.DateAd,
                    PrintDate = model.PrintDate,
                    PrintDateAd = model.PrintDateAd,
                    CreatedDate = model.CreatedDate,
                    CreatedBy = model.CreatedBy,
                    DeletedBy = model.DeletedBy,
                    DeletedDate = model.DeletedDate,

                };
                    con.gharBatoes.Add(cdata);




                }
                int i = con.SaveChanges();
                if (i > 0)
                    return true;
                else
                    return false;
            }
        }
        public List<gahrBatoViewModel> GetAll()
        {
            using (var con = new SifarishEntities())
            {
                var result = con.gharBatoes


                                .Select(x => new gahrBatoViewModel()
                                {
                                    id = x.id,
                                    munOrvdcName = x.munOrvdcName,
                                    Ward = x.Ward,
                                    KittaNo = x.KittaNo,
                                    buyerFatherName = x.buyerFatherName,
                                    buyerName = x.buyerName,
                                    SellerFatherName = x.SellerFatherName,
                                    SellerName = x.SellerName,
                                    Date = x.Date,
                                    DateAd = x.DateAd,
                                    PrintDate = x.PrintDate,
                                    PrintDateAd = x.PrintDateAd,
                                    CreatedDate = x.CreatedDate,
                                    CreatedBy = x.CreatedBy,
                                    DeletedBy = x.DeletedBy,
                                    DeletedDate = x.DeletedDate,

                                }).ToList();
                return result;
            }
        }

        public gahrBatoViewModel GetById(int id)
        {
            using (var con = new SifarishEntities())
            {
                var result = con.gharBatoes

                                .Select(x => new gahrBatoViewModel()
                                {
                                    id = x.id,
                                    munOrvdcName = x.munOrvdcName,
                                    Ward = x.Ward,
                                    KittaNo = x.KittaNo,
                                    buyerFatherName = x.buyerFatherName,
                                    buyerName = x.buyerName,
                                    SellerFatherName = x.SellerFatherName,
                                    SellerName = x.SellerName,
                                    Date = x.Date,
                                    DateAd = x.DateAd,
                                    PrintDate = x.PrintDate,
                                    PrintDateAd = x.PrintDateAd,
                                    CreatedDate = x.CreatedDate,
                                    CreatedBy = x.CreatedBy,
                                    DeletedBy = x.DeletedBy,
                                    DeletedDate = x.DeletedDate,

                                }).Where(x => x.id == id).FirstOrDefault();
                return result;
            }
        }
    }
}