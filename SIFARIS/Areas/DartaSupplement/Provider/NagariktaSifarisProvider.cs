using SIFARIS.Areas.DartaSupplement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.DartaSupplement.Provider
{
    public class NagariktaSifarisProvider
    {
        SifarishEntities ent = new SifarishEntities();
        public void Insert(NagariktaSifarisModel model)
        {
            var ActiveFiscalYearId = ent.tblFiscalYears.Where(x => x.IsActive == true).FirstOrDefault().FiscalYearId;
            var objToSave = new tblNagariktaSifari()
            {
                NagariktaFaramNo = model.NagariktaFaramNo,
                NaamThar = model.NaamThar,
                FullName = model.FullName,
                Gender = model.Gender,
                JanmaMiti = model.JanmaMiti,
                JanmaDate = Utility.GetRomanDate(model.JanmaMiti).ToString(),
                JanmaPradesh = model.JanmaPradesh,
                JanmaJilla = model.JanmaJilla,
                JanmaPalika = model.JanmaPalika,
                JanmaWard = model.JanmaWard,
                PermaPradesh = model.PermaPradesh,
                PermaJilla = model.PermaJilla,
                PermaPalika = model.PermaPalika,
                PermaWard = model.PermaWard
            };
            objToSave.FiscalYear = ActiveFiscalYearId;
            //objToSave.WorkOffice = Utility.GetCurrentLoginUserWorkOfficeId();
            objToSave.WorkOffice = 1;
            //objToSave.CreatedBy = Utility.GetCurrentLoginUser();
            objToSave.CreatedBy = 1;
            objToSave.CreatedDate = DateTime.Now.ToShortDateString().ToString();
            ent.tblNagariktaSifaris.Add(objToSave);
            ent.SaveChanges();

            var rel = new tblNagariktaRelativeDetail()
            {
                NagariktaId = objToSave.NewNagariktaId,
                BabukoNaamThar = model.BabukoNaamThar,
                BabukoFullName = model.BabukoFullName,
                BabuNagariktaNo=model.BabuNagariktaNo,
                BabuNagariktaIssueDate=model.BabuNagariktaIssueDate,
                BabuNagariktaIssueDistrict=model.BabuNagariktaIssueDistrict,
                AamakoNaamThar = model.AamakoNaamThar,
                AamakoFullName = model.AamakoFullName,
                AamaNagariktaNo=model.AamaNagariktaNo,
                AamaNagariktaIssueDate=model.AamaNagariktaIssueDate,
                AamaNagariktaIssueDistrict=model.AamaNagariktaIssueDistrict,
                PatikoNaamThar=model.PatikoNaamThar,
                PatikoFullName=model.PatikoFullName,
                PatiNagariktaNo=model.PatiNagariktaNo,
                PatiNagariktaIssueDate=model.PatiNagariktaIssueDate,
                PatiNagariktaIssueDistrict=model.PatiNagariktaIssueDistrict
            };
            ent.tblNagariktaRelativeDetails.Add(rel);
            ent.SaveChanges();
        }
        public List<NagariktaSifarisModel> GetNagariktaRecordList(int WorkOfficeId, int? NagariktaId, int page, int pagesize)
        {
            var model = new List<NagariktaSifarisModel>();
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            model = (from nab in ent.tblNagariktaSifaris
                     join rel in ent.tblNagariktaRelativeDetails on nab.NewNagariktaId equals rel.NagariktaId
                     where nab.FiscalYear == activefiscalyear && nab.WorkOffice == WorkOfficeId
                     select new NagariktaSifarisModel
                     {
                         NewNagariktaId = nab.NewNagariktaId,
                         NagariktaFaramNo = nab.NagariktaFaramNo,
                         BabukoNaamThar = rel.BabukoNaamThar,
                         AamakoNaamThar = rel.AamakoNaamThar,
                         JanmaMiti=nab.JanmaMiti,
                         Gender=nab.Gender,
                         PermaPradesh = nab.PermaPradesh,
                         PermaJilla = nab.PermaJilla,
                         PermaPalika = nab.PermaPalika,
                         PermaWard = nab.PermaWard
                     }).ToList();
            return model;
        }
        public NagariktaSifarisModel GetNagariktaRecord(int WorkOfficeId, int? NagariktaId, int page, int pagesize)
        {
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            NagariktaSifarisModel model = (from nab in ent.tblNagariktaSifaris
                                           join rel in ent.tblNagariktaRelativeDetails on nab.NewNagariktaId equals rel.NagariktaId
                                           where nab.NewNagariktaId==NagariktaId && nab.FiscalYear == activefiscalyear && nab.WorkOffice == WorkOfficeId
                                           select new NagariktaSifarisModel
                                         {
                                             NewNagariktaId = nab.NewNagariktaId,
                                             NagariktaFaramNo = nab.NagariktaFaramNo,
                                             NaamThar = nab.NaamThar,
                                             FullName = nab.FullName,
                                             Gender = nab.Gender,
                                             JanmaMiti = nab.JanmaMiti,
                                             JanmaPradesh = nab.JanmaPradesh,
                                             JanmaJilla = nab.JanmaJilla,
                                             JanmaPalika = nab.JanmaPalika,
                                             JanmaWard = nab.JanmaWard,
                                             PermaPradesh = nab.PermaPradesh,
                                             PermaJilla = nab.PermaJilla,
                                             PermaPalika = nab.PermaPalika,
                                             PermaWard = nab.PermaWard,

                                             NagariktaRelativeInfoId = rel.NagariktaRelativeInfoId,
                                             NagariktaId = rel.NagariktaId,
                                             BabukoNaamThar = rel.BabukoNaamThar,
                                             BabukoFullName = rel.BabukoFullName,
                                               BabuNagariktaNo = rel.BabuNagariktaNo,
                                               BabuNagariktaIssueDate = rel.BabuNagariktaIssueDate,
                                               BabuNagariktaIssueDistrict = rel.BabuNagariktaIssueDistrict,
                                               AamakoNaamThar = rel.AamakoNaamThar,
                                               AamakoFullName = rel.AamakoFullName,
                                               AamaNagariktaNo = rel.AamaNagariktaNo,
                                               AamaNagariktaIssueDate = rel.AamaNagariktaIssueDate,
                                               AamaNagariktaIssueDistrict = rel.AamaNagariktaIssueDistrict,
                                               PatikoNaamThar = rel.PatikoNaamThar,
                                               PatikoFullName = rel.PatikoFullName,
                                               PatiNagariktaNo = rel.PatiNagariktaNo,
                                               PatiNagariktaIssueDate = rel.PatiNagariktaIssueDate,
                                               PatiNagariktaIssueDistrict = rel.PatiNagariktaIssueDistrict

                                           }).SingleOrDefault();
            return model;
        }
        public void Update(NagariktaSifarisModel model)
        {
            var updatesifaris = ent.tblNagariktaSifaris.Where(x => x.NewNagariktaId == model.NewNagariktaId).SingleOrDefault();
            updatesifaris.NewNagariktaId = model.NewNagariktaId;
            updatesifaris.NagariktaFaramNo = model.NagariktaFaramNo;
            updatesifaris.NaamThar = model.NaamThar;
            updatesifaris.FullName = model.FullName;
            updatesifaris.Gender = model.Gender;
            updatesifaris.JanmaMiti = model.JanmaMiti;
            updatesifaris.JanmaDate = Utility.GetRomanDate(model.JanmaMiti).ToString();
            updatesifaris.JanmaPradesh = model.JanmaPradesh;
            updatesifaris.JanmaJilla = model.JanmaJilla;
            updatesifaris.JanmaPalika = model.JanmaPalika;
            updatesifaris.JanmaWard = model.JanmaWard;
            updatesifaris.PermaPradesh = model.PermaPradesh;
            updatesifaris.PermaJilla = model.PermaJilla;
            updatesifaris.PermaPalika = model.PermaPalika;
            updatesifaris.PermaWard = model.PermaWard;
            //updatesifaris.UpdatedBy = Utility.GetCurrentLoginUser();
            updatesifaris.UpdatedBy = 1;
            updatesifaris.UpdatedDate = DateTime.Now.ToShortDateString().ToString();
            ent.Entry(updatesifaris).State = System.Data.Entity.EntityState.Modified;

            var updaterel = ent.tblNagariktaRelativeDetails.Where(x => x.NagariktaId == updatesifaris.NewNagariktaId).SingleOrDefault();
            updaterel.NagariktaRelativeInfoId = model.NagariktaRelativeInfoId;
            updaterel.NagariktaId = model.NagariktaId;
            updaterel.BabukoNaamThar = model.BabukoNaamThar;
            updaterel.BabukoFullName = model.BabukoFullName;
            updaterel.BabuNagariktaIssueDate = model.BabuNagariktaIssueDate;
            updaterel.BabuNagariktaIssueDistrict = model.BabuNagariktaIssueDistrict;
            updaterel.AamakoNaamThar = model.AamakoNaamThar;
            updaterel.AamakoFullName = model.AamakoFullName;
            updaterel.AamaNagariktaNo = model.AamaNagariktaNo;
            updaterel.AamaNagariktaIssueDate = model.AamaNagariktaIssueDate;
            updaterel.AamaNagariktaIssueDistrict = model.AamaNagariktaIssueDistrict;
            updaterel.PatikoNaamThar = model.PatikoNaamThar;
            updaterel.PatikoFullName = model.PatikoFullName;
            updaterel.PatiNagariktaNo = model.PatiNagariktaNo;
            updaterel.PatiNagariktaIssueDate = model.PatiNagariktaIssueDate;
            updaterel.PatiNagariktaIssueDistrict = model.PatiNagariktaIssueDistrict;
            ent.Entry(updaterel).State = System.Data.Entity.EntityState.Modified;
            ent.SaveChanges();
        }
    }
}