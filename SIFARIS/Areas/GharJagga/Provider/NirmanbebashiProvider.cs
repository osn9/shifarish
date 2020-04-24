using SIFARIS.Areas.GharJagga.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Provider
{
    public class NirmanbebashiProvider
    {
        public bool Insert(NirmanBebasahiViewModel model)
        {
            using (var con = new SifarishEntities())
            {
                if (model.nirmanbebasaiId > 0)
                {

                    var data = con.NirmanBebasahis.Where(x => x.nirmanbebasaiId == model.nirmanbebasaiId).FirstOrDefault();
                    if (data != null)
                    {
                        data.name = model.name;
                        data.address = model.address;
                      
                        data.postboxNo = model.postboxNo;
                        data.TelPhoneNo = model.TelPhoneNo;
                        data.FaxNo = model.FaxNo;
                        data.Email = model.Email;
                        data.KaralayaName = model.KaralayaName;
                        data.KaralayaAddress = model.KaralayaAddress;
                        data.PramanPatraNo = model.PramanPatraNo;
                        data.AprovalDateAd = model.AprovalDateAd;
                        data.ApprovealDate = model.ApprovealDate;
                        data.ApprovalKaryalaya = model.ApprovalKaryalaya;
                        data.MembershipNo = model.MembershipNo;
                        data.RegisterdDate = model.RegisterdDate;
                        data.RegisterDateAd = model.RegisterDateAd;
                        data.RenewalDate = model.RenewalDate;
                        data.RenewalDatead = model.RenewalDatead;
                        data.approvalNo = model.approvalNo;
                        data.Amount = model.Amount;
                        data.AmountEng = model.AmountEng;
                        data.FormAddress = model.FormAddress;
                        data.FormName = model.FormName;
                        data.SanchalakName = model.SanchalakName;
                        data.Date = model.Date;
                        data.DateAd = model.DateAd;
                        data.PrintDate = model.PrintDate;
                        data.PrintDateAd = model.PrintDateAd;

                        con.Entry(data).State = System.Data.Entity.EntityState.Modified;



                        // var a=  con.SaveChanges();
                    }
                }
                else
                {
                    NirmanBebasahi cdata = new NirmanBebasahi()
                    {
                        name = model.name,
                    address = model.address,
                   
                    postboxNo = model.postboxNo,
                    TelPhoneNo = model.TelPhoneNo,
                    FaxNo = model.FaxNo,
                    Email = model.Email,
                    KaralayaName = model.KaralayaName,
                    KaralayaAddress = model.KaralayaAddress,
                    PramanPatraNo = model.PramanPatraNo,
                    AprovalDateAd = model.AprovalDateAd,
                    ApprovealDate = model.ApprovealDate,
                    ApprovalKaryalaya = model.ApprovalKaryalaya,
                    MembershipNo = model.MembershipNo,
                    RegisterdDate = model.RegisterdDate,
                    RegisterDateAd = model.RegisterDateAd,
                        RenewalDate = model.RenewalDate,
                    RenewalDatead = model.RenewalDatead,
                    approvalNo = model.approvalNo,
                    Amount = model.Amount,
                    AmountEng = model.AmountEng,
                    FormAddress = model.FormAddress,
                    FormName = model.FormName,
                    SanchalakName = model.SanchalakName,
                    Date = model.Date,
                    DateAd = model.DateAd,
                        PrintDate = model.PrintDate,
                    PrintDateAd = model.PrintDateAd

                };
                    con.NirmanBebasahis.Add(cdata);




                }
                int i = con.SaveChanges();
                if (i > 0)
                    return true;
                else
                    return false;
            }
        }
        public List<NirmanBebasahiViewModel> GetAll()
        {
            using (var con = new SifarishEntities())
            {
                var result = con.NirmanBebasahis


                                .Select(x => new NirmanBebasahiViewModel()
                                {
                                    nirmanbebasaiId = x.nirmanbebasaiId,
                                    name = x.name,
                                    address = x.address,

                                    postboxNo = x.postboxNo,
                                    TelPhoneNo = x.TelPhoneNo,
                                    FaxNo = x.FaxNo,
                                    Email = x.Email,
                                    KaralayaName = x.KaralayaName,
                                    KaralayaAddress = x.KaralayaAddress,
                                    PramanPatraNo = x.PramanPatraNo,
                                    AprovalDateAd = x.AprovalDateAd,
                                    ApprovealDate = x.ApprovealDate,
                                    ApprovalKaryalaya = x.ApprovalKaryalaya,
                                    MembershipNo = x.MembershipNo,
                                    RegisterdDate = x.RegisterdDate,
                                    RegisterDateAd = x.RegisterDateAd,
                                    RenewalDate = x.RenewalDate,
                                    RenewalDatead = x.RenewalDatead,
                                    approvalNo = x.approvalNo,
                                    Amount = x.Amount,
                                    AmountEng = x.AmountEng,
                                    FormAddress = x.FormAddress,
                                    FormName = x.FormName,
                                    SanchalakName = x.SanchalakName,
                                    Date = x.Date,
                                    DateAd = x.DateAd,
                                    PrintDate = x.PrintDate,
                                    PrintDateAd = x.PrintDateAd

                                }).ToList();
                return result;
            }
        }

        public NirmanBebasahiViewModel GetById(int id)
        {
            using (var con = new SifarishEntities())
            {
                var result = con.NirmanBebasahis

                                .Select(x => new NirmanBebasahiViewModel()
                                {
                                    nirmanbebasaiId = x.nirmanbebasaiId,
                                    name = x.name,
                                    address = x.address,

                                    postboxNo = x.postboxNo,
                                    TelPhoneNo = x.TelPhoneNo,
                                    FaxNo = x.FaxNo,
                                    Email = x.Email,
                                    KaralayaName = x.KaralayaName,
                                    KaralayaAddress = x.KaralayaAddress,
                                    PramanPatraNo = x.PramanPatraNo,
                                    AprovalDateAd = x.AprovalDateAd,
                                    ApprovealDate = x.ApprovealDate,
                                    ApprovalKaryalaya = x.ApprovalKaryalaya,
                                    MembershipNo = x.MembershipNo,
                                    RegisterdDate = x.RegisterdDate,
                                    RegisterDateAd = x.RegisterDateAd,
                                    RenewalDate = x.RenewalDate,
                                    RenewalDatead = x.RenewalDatead,
                                    approvalNo = x.approvalNo,
                                    Amount = x.Amount,
                                    AmountEng = x.AmountEng,
                                    FormAddress = x.FormAddress,
                                    FormName = x.FormName,
                                    SanchalakName = x.SanchalakName,
                                    Date = x.Date,
                                    DateAd = x.DateAd,
                                    PrintDate = x.PrintDate,
                                    PrintDateAd = x.PrintDateAd

                                }).Where(x => x.nirmanbebasaiId == id).FirstOrDefault();
                return result;
            }
        }
    }
}