using SIFARIS.Areas.DartaSupplement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.DartaSupplement.Provider
{
    public class NataPramanitSifarisProvider
    {
        SifarishEntities ent = new SifarishEntities();
        public void Insert(NataPramanitSifarisModel model)
        {
            var activeFiscalYearId = ent.tblFiscalYears.FirstOrDefault(x => x.IsActive).FiscalYearId;
            var objToSave = new tblNataPramanit()
            {
                NataPramanitFaramNo=model.NataPramanitFaramNo,
                NaamThar = model.NaamThar,
                FullName = model.FullName,
                Gender = model.Gender,
                PermaState=model.PermaState,
                PermaDistrict=model.PermaDistrict,
                PermaPalika = model.PermaPalika,
                PermaWard = model.PermaWard,
                NagariktaPraPaNo=model.NagariktaPraPaNo,
                NagariktaIssueDate=model.NagariktaIssueDate,
                NagariktaIssueDistrict=model.NagariktaIssueDistrict
            };
            objToSave.FiscalYear = activeFiscalYearId;
            //objToSave.WorkOffice = Utility.GetCurrentLoginUserWorkOfficeId();
            objToSave.WorkOffice = 1;
            //objToSave.CreatedBy = Utility.GetCurrentLoginUser();
            objToSave.CreatedBy = 1;
            objToSave.CreatedDate = DateTime.Now.ToShortDateString().ToString();
            ent.tblNataPramanits.Add(objToSave);
            ent.SaveChanges();
            
            foreach (var item in model.NataPramanitPersonalDetailModelList)
            {
                var objtosavedetails = new tblNataPersonalDetail()
                {
                    NataId = objToSave.NewNataId,
                    NaamThar = item.NaamThar,
                    FullName = item.FullName,
                    RelatonTo = item.RelatonTo
                };
                ent.tblNataPersonalDetails.Add(objtosavedetails);
                ent.SaveChanges();
                model.NewNataId = objtosavedetails.NataId;
            }
           
        }
        public List<NataPramanitSifarisModel> GetNataPramanitRecordsList(int WorkOfficeId, int? NataId, int page, int Pagesize)
        {
            var collection = new List<tblNataPramanit>();
            if (NataId != null)
            {
                collection = ent.tblNataPramanits.Where(x => x.WorkOffice == WorkOfficeId && x.NewNataId == NataId).OrderByDescending(x => x.NewNataId).ToList();
            }
            else
            {
                collection = ent.tblNataPramanits.Where(x => x.WorkOffice == WorkOfficeId).OrderByDescending(x => x.NewNataId).Skip((page - 1) * Pagesize).Take(Pagesize).ToList();
            }
            var model = new List<NataPramanitSifarisModel>();
            foreach (var item in collection)
            {
                var data = new NataPramanitSifarisModel()
                {
                   NataPramanitFaramNo = item.NataPramanitFaramNo,
                NaamThar = item.NaamThar,
                FullName = item.FullName,
                Gender = item.Gender,
                PermaState = item.PermaState,
                PermaDistrict = item.PermaDistrict,
                PermaPalika = item.PermaPalika,
                PermaWard = item.PermaWard,
                NagariktaPraPaNo = item.NagariktaPraPaNo,
                NagariktaIssueDate = item.NagariktaIssueDate,
                NagariktaIssueDistrict = item.NagariktaIssueDistrict,
            };

                if (item.tblNataPersonalDetails.Any())
                {
                    foreach (var personalItem in item.tblNataPersonalDetails)
                    {
                        NataPramanitPersonalDetailModel person = new NataPramanitPersonalDetailModel();
                        person.NataId = personalItem.NataId;
                        person.NaamThar = personalItem.NaamThar;
                        person.FullName = personalItem.FullName;
                        person.RelatonTo = personalItem.RelatonTo;

                        data.NataPramanitPersonalDetailModelList.Add(person);
                    }
                }
                model.Add(data);
            }
            return model;
        }
       
        public void Update(NataPramanitSifarisModel model)
        {
            //details
            var objtoedit = ent.tblNataPramanits.Where(x => x.NewNataId == model.NewNataId).FirstOrDefault();
            objtoedit.NataPramanitFaramNo = model.NataPramanitFaramNo;
            objtoedit.NaamThar = model.NaamThar;
            objtoedit.FullName = model.FullName;
            objtoedit.Gender = model.Gender;
            objtoedit.PermaState = model.PermaState;
            objtoedit.PermaDistrict = model.PermaDistrict;
            objtoedit.PermaPalika = model.PermaPalika;
            objtoedit.PermaWard = model.PermaWard;
            objtoedit.NagariktaPraPaNo = model.NagariktaPraPaNo;
            objtoedit.NagariktaIssueDate = model.NagariktaIssueDate;
            objtoedit.NagariktaIssueDistrict = model.NagariktaIssueDistrict;
            //objtoedit.UpdatedBy = Utility.GetCurrentLoginUser();
            objtoedit.UpdatedBy = 1;
            objtoedit.UpdatedDate = DateTime.Now.ToShortDateString().ToString();
            ent.Entry(objtoedit).State = System.Data.Entity.EntityState.Modified;
           
            // multi personaldetails
            var personid = model.NataPramanitPersonalDetailModelList.Select(y => y.NataPersonId).ToList();
            var itemfromdb = ent.tblNataPersonalDetails.Where(x => x.NataId == model.NewNataId && (!personid.Contains(x.NataPersonId))).Select(x => x.NataPersonId).ToList();
            if (itemfromdb.Count > 0)
            {
                foreach (var item in itemfromdb)
                {
                    var itemToDelete = ent.tblNataPersonalDetails.Find(item);
                    ent.tblNataPersonalDetails.Remove(itemToDelete);
                }
            }

            foreach (var item in model.NataPramanitPersonalDetailModelList)
            {
                var objToEditItem = ent.tblNataPersonalDetails.Where(x => x.NataPersonId == item.NataPersonId).FirstOrDefault();
                if (objToEditItem != null)
                {
                    objToEditItem.NataId = model.NewNataId;
                    objToEditItem.NaamThar = item.NaamThar;
                    objToEditItem.FullName = item.FullName;
                    objToEditItem.RelatonTo = item.RelatonTo;
                    ent.Entry(objToEditItem).State = System.Data.Entity.EntityState.Modified;
                }
                else
                {
                    var objTosaveItems = new tblNataPersonalDetail()
                    {
                        NataId = model.NewNataId,
                        NaamThar = item.NaamThar,
                        FullName = item.FullName,
                        RelatonTo = item.RelatonTo
                    };
                    ent.tblNataPersonalDetails.Add(objTosaveItems);
                }
            }
            ent.SaveChanges();

        }
        public NataPramanitSifarisModel PopulateNataPramanitRecords(int WorkOfficeId, int? NataId)
        {
            NataPramanitSifarisModel result = (from nata in ent.tblNataPramanits
                                           where nata.NewNataId == NataId && nata.WorkOffice == WorkOfficeId
                                           select new NataPramanitSifarisModel
                                           {
                                               NataPramanitFaramNo = nata.NataPramanitFaramNo,
                                               NaamThar = nata.NaamThar,
                                               FullName = nata.FullName,
                                               Gender = nata.Gender,
                                               PermaState = nata.PermaState,
                                               PermaDistrict = nata.PermaDistrict,
                                               PermaPalika = nata.PermaPalika,
                                               PermaWard = nata.PermaWard,
                                               NagariktaPraPaNo = nata.NagariktaPraPaNo,
                                               NagariktaIssueDate = nata.NagariktaIssueDate,
                                               NagariktaIssueDistrict = nata.NagariktaIssueDistrict
                                           }).SingleOrDefault();
            //retrieving lists of personal details           
            var personlist = new List<NataPramanitPersonalDetailModel>();
            personlist = ent.tblNataPersonalDetails.Where(x => x.NataId == NataId).Select(x => new NataPramanitPersonalDetailModel
            {
                NataPersonId=x.NataPersonId,
                NataId=x.NataId,
                NaamThar = x.NaamThar,
                FullName = x.FullName,
                RelatonTo = x.RelatonTo
            }).ToList();
            result.NataPramanitPersonalDetailModelList = personlist;
            return result;
        }
    }
}