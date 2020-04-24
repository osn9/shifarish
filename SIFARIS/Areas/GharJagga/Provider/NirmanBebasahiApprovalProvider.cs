using SIFARIS.Areas.GharJagga.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Provider
{
    public class NirmanBebasahiApprovalProvider
    {

        public bool Insert(NirmanBebasahiApprovalViewModel model)
        {
            using (var con = new SifarishEntities())
            {
                if (model.id > 0)
                {

                    var data = con.NirmanBebasahiApprovals.Where(x => x.id == model.id).FirstOrDefault();
                    if (data != null)
                    {
                        data.Name = model.Name;
                        data.Address = model.Address;

                        data.PostBoxNo = model.PostBoxNo;
                        data.Telephone = model.Telephone;
                        data.CompanyTypr = model.CompanyTypr;
                        data.CompanyPersonelEmail = model.CompanyPersonelEmail;
                        data.ComapanyPersonelName = model.ComapanyPersonelName;
                        data.CompanyPersonelAddress = model.CompanyPersonelAddress;
                        data.CompanyPersonelPostbosNo = model.CompanyPersonelPostbosNo;
                        data.CompanyPersonelTelephone = model.CompanyPersonelTelephone;
                        data.CompanyPersonelFax = model.CompanyPersonelFax;
                        data.RegisterationNo = model.RegisterationNo;
                        data.RegistrationDateAd = model.RegistrationDateAd;
                        data.RegistrarionDate = model.RegistrarionDate;
                        data.AdhirikataPujiEng = model.AdhirikataPujiEng;
                        data.AdhiriktaPuji = model.AdhiriktaPuji;
                        data.JariPugi = model.JariPugi;
                        data.JariPujiEng = model.JariPujiEng;
                        data.groups = model.groups;
                        data.Grade = model.Grade;
                        data.Technical = model.Technical;
                        data.NonTechnical = model.NonTechnical;
                        data.Others = model.Others;
                        data.status = model.status;
                        data.CreateDate = model.CreateDate;
                        data.Createdby = model.Createdby;
                        data.DeletedBy = model.DeletedBy;
                        data.DeletedDate = model.DeletedDate;
                        data.updateby = model.updateby;
                        data.UpdatedDate = model.UpdatedDate;
                        data.PrintDate = model.PrintDate;
                        data.PrintDateAd = model.PrintDateAd;

                        con.Entry(data).State = System.Data.Entity.EntityState.Modified;



                        // var a=  con.SaveChanges();
                    }
                }
                else
                {
                    NirmanBebasahiApproval cdata = new NirmanBebasahiApproval()
                    {
                        Name = model.Name,
                    Address = model.Address,

                    PostBoxNo = model.PostBoxNo,
                    Telephone = model.Telephone,
                    CompanyTypr = model.CompanyTypr,
                    CompanyPersonelEmail = model.CompanyPersonelEmail,
                    ComapanyPersonelName = model.ComapanyPersonelName,
                    CompanyPersonelAddress = model.CompanyPersonelAddress,
                    CompanyPersonelPostbosNo = model.CompanyPersonelPostbosNo,
                    CompanyPersonelTelephone = model.CompanyPersonelTelephone,
                    CompanyPersonelFax = model.CompanyPersonelFax,
                    RegisterationNo = model.RegisterationNo,
                    RegistrationDateAd = model.RegistrationDateAd,
                    RegistrarionDate = model.RegistrarionDate,
                    AdhirikataPujiEng = model.AdhirikataPujiEng,
                    AdhiriktaPuji = model.AdhiriktaPuji,
                        JariPugi = model.JariPugi,
                    JariPujiEng = model.JariPujiEng,
                    groups = model.groups,
                    Grade = model.Grade,
                    Technical = model.Technical,
                    NonTechnical = model.NonTechnical,
                    Others = model.Others,
                    status = model.status,
                    CreateDate = model.CreateDate,
                    Createdby = model.Createdby,
                    DeletedBy = model.DeletedBy,
                    DeletedDate = model.DeletedDate,
                    updateby = model.updateby,
                    UpdatedDate = model.UpdatedDate,
                    PrintDate = model.PrintDate,
                    PrintDateAd = model.PrintDateAd,

                };
                    con.NirmanBebasahiApprovals.Add(cdata);




                }
                int i = con.SaveChanges();
                if (i > 0)
                    return true;
                else
                    return false;
            }
        }
        public List<NirmanBebasahiApprovalViewModel> GetAll()
        {
            using (var con = new SifarishEntities())
            {
                var result = con.NirmanBebasahiApprovals


                                .Select(x => new NirmanBebasahiApprovalViewModel()
                                {
                                    id=x.id,
                                    Name = x.Name,
                                    Address = x.Address,

                                    PostBoxNo = x.PostBoxNo,
                                    Telephone = x.Telephone,
                                    CompanyTypr = x.CompanyTypr,
                                    CompanyPersonelEmail = x.CompanyPersonelEmail,
                                    ComapanyPersonelName = x.ComapanyPersonelName,
                                    CompanyPersonelAddress = x.CompanyPersonelAddress,
                                    CompanyPersonelPostbosNo = x.CompanyPersonelPostbosNo,
                                    CompanyPersonelTelephone = x.CompanyPersonelTelephone,
                                    CompanyPersonelFax = x.CompanyPersonelFax,
                                    RegisterationNo = x.RegisterationNo,
                                    RegistrationDateAd = x.RegistrationDateAd,
                                    RegistrarionDate = x.RegistrarionDate,
                                    AdhirikataPujiEng = x.AdhirikataPujiEng,
                                    AdhiriktaPuji = x.AdhiriktaPuji,
                                    JariPugi = x.JariPugi,
                                    JariPujiEng = x.JariPujiEng,
                                    groups = x.groups,
                                    Grade = x.Grade,
                                    Technical = x.Technical,
                                    NonTechnical = x.NonTechnical,
                                    Others = x.Others,
                                    status = x.status,
                                    CreateDate = x.CreateDate,
                                    Createdby = x.Createdby,
                                    DeletedBy = x.DeletedBy,
                                    DeletedDate = x.DeletedDate,
                                    updateby = x.updateby,
                                    UpdatedDate = x.UpdatedDate,
                                    PrintDate = x.PrintDate,
                                    PrintDateAd = x.PrintDateAd,

                                }).ToList();
                return result;
            }
        }

        public NirmanBebasahiApprovalViewModel GetById(int id)
        {
            using (var con = new SifarishEntities())
            {
                var result = con.NirmanBebasahiApprovals

                                .Select(x => new NirmanBebasahiApprovalViewModel()
                                {
                                    id = x.id,
                                    Name = x.Name,
                                    Address = x.Address,

                                    PostBoxNo = x.PostBoxNo,
                                    Telephone = x.Telephone,
                                    CompanyTypr = x.CompanyTypr,
                                    CompanyPersonelEmail = x.CompanyPersonelEmail,
                                    ComapanyPersonelName = x.ComapanyPersonelName,
                                    CompanyPersonelAddress = x.CompanyPersonelAddress,
                                    CompanyPersonelPostbosNo = x.CompanyPersonelPostbosNo,
                                    CompanyPersonelTelephone = x.CompanyPersonelTelephone,
                                    CompanyPersonelFax = x.CompanyPersonelFax,
                                    RegisterationNo = x.RegisterationNo,
                                    RegistrationDateAd = x.RegistrationDateAd,
                                    RegistrarionDate = x.RegistrarionDate,
                                    AdhirikataPujiEng = x.AdhirikataPujiEng,
                                    AdhiriktaPuji = x.AdhiriktaPuji,
                                    JariPugi = x.JariPugi,
                                    JariPujiEng = x.JariPujiEng,
                                    groups = x.groups,
                                    Grade = x.Grade,
                                    Technical = x.Technical,
                                    NonTechnical = x.NonTechnical,
                                    Others = x.Others,
                                    status = x.status,
                                    CreateDate = x.CreateDate,
                                    Createdby = x.Createdby,
                                    DeletedBy = x.DeletedBy,
                                    DeletedDate = x.DeletedDate,
                                    updateby = x.updateby,
                                    UpdatedDate = x.UpdatedDate,
                                    PrintDate = x.PrintDate,
                                    PrintDateAd = x.PrintDateAd,

                                }).Where(x => x.id == id).FirstOrDefault();
                return result;
            }
        }
    }
}