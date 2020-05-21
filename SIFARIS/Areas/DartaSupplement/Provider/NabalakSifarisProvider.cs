using SIFARIS.Areas.DartaSupplement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.DartaSupplement.Provider
{
    public class NabalakSifarisProvider
    {
        SifarishEntities ent = new SifarishEntities();
        public void Insert(NabalakSifarisModel model)
        {
            var ActiveFiscalYearId = ent.tblFiscalYears.Where(x => x.IsActive == true).FirstOrDefault().FiscalYearId;
            var objToSave = new tblNabalakSifari()
            {
                NabalakFaramNo=model.NabalakFaramNo,
                NaamThar=model.NaamThar,
                FullName=model.FullName,
                Gender=model.Gender,
                JanmaMiti=model.JanmaMiti,
                JanmaDate=Utility.GetRomanDate(model.JanmaMiti).ToString(),
                JanmaPradesh=model.JanmaPradesh,
                JanmaJilla=model.JanmaJilla,
                JanmaPalika=model.JanmaPalika,
                JanmaWard=model.JanmaWard,
                PermaPradesh=model.PermaPradesh,
                PermaJilla=model.PermaJilla,
                PermaPalika=model.PermaPalika,
                PermaWard=model.PermaWard
            };
            objToSave.FiscalYear = ActiveFiscalYearId;
            //objToSave.WorkOffice = Utility.GetCurrentLoginUserWorkOfficeId();
            objToSave.WorkOffice = 1;
            //objToSave.CreatedBy = Utility.GetCurrentLoginUser();
            objToSave.CreatedBy = 1;
            objToSave.CreatedDate = DateTime.Now.ToShortDateString().ToString();
            ent.tblNabalakSifaris.Add(objToSave);
            ent.SaveChanges();

            var rel = new tblNabalakRelativeDetail()
            {
                NabalakId=objToSave.NabalakId,
                BabukoNaamThar=model.BabukoNaamThar,
                BabukoFullName=model.BabukoFullName,
                AamakoNaamThar=model.AamakoNaamThar,
                AamakoFullName=model.AamakoFullName,
                SamrakshakNaamThar=model.SamrakshakNaamThar,
                GuardianFullName=model.GuardianFullName
            };
            ent.tblNabalakRelativeDetails.Add(rel);
            ent.SaveChanges();
        }
        public List<NabalakSifarisModel> GetNabalakRecordList(int WorkOfficeId, int? NabalakId, int page, int pagesize)
        {
            var model = new List<NabalakSifarisModel>();
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            model = (from nab in ent.tblNabalakSifaris
                     join rel in ent.tblNabalakRelativeDetails on nab.NabalakId equals rel.NabalakId
                     where nab.FiscalYear==activefiscalyear && nab.WorkOffice==WorkOfficeId
                     select new NabalakSifarisModel
                     {
                         NabalakId=nab.NabalakId,
                         NabalakFaramNo=nab.NabalakFaramNo,
                         NaamThar=nab.NaamThar,
                         Gender=nab.Gender,
                         JanmaMiti=nab.JanmaMiti,
                         BabukoNaamThar=rel.BabukoNaamThar,
                         AamakoNaamThar=rel.AamakoNaamThar,
                         SamrakshakNaamThar=rel.SamrakshakNaamThar,
                         PermaPradesh=nab.PermaPradesh,PermaJilla=nab.PermaJilla,
                         PermaPalika=nab.PermaPalika,PermaWard=nab.PermaWard
                     }).ToList();
            return model;
        }
        public NabalakSifarisModel GetNabalakRecord(int WorkOfficeId, int? NabalakId, int page, int pagesize)
        {
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            NabalakSifarisModel model= (from nab in ent.tblNabalakSifaris
                                        join rel in ent.tblNabalakRelativeDetails on nab.NabalakId equals rel.NabalakId
                                        where nab.NabalakId==NabalakId && nab.FiscalYear == activefiscalyear && nab.WorkOffice == WorkOfficeId
                                        select new NabalakSifarisModel
                                        {
                                            NabalakId=nab.NabalakId,
                                            NabalakFaramNo=nab.NabalakFaramNo,
                                            NaamThar=nab.NaamThar,
                                            FullName=nab.FullName,
                                            Gender=nab.Gender,
                                            JanmaMiti=nab.JanmaMiti,
                                            JanmaPradesh=nab.JanmaPradesh,
                                            JanmaJilla=nab.JanmaJilla,
                                            JanmaPalika=nab.JanmaPalika,
                                            JanmaWard=nab.JanmaWard,
                                            PermaPradesh=nab.PermaPradesh,
                                            PermaJilla=nab.PermaJilla,
                                            PermaPalika=nab.PermaPalika,
                                            PermaWard=nab.PermaWard,

                                            NabalkRelativeInfoId=rel.NabalkRelativeInfoId,
                                            MapNabalakId=rel.NabalakId,
                                            BabukoNaamThar=rel.BabukoNaamThar,
                                            BabukoFullName=rel.BabukoFullName,
                                            AamakoNaamThar=rel.AamakoNaamThar,
                                            AamakoFullName=rel.AamakoFullName,
                                            SamrakshakNaamThar=rel.SamrakshakNaamThar,
                                            GuardianFullName=rel.GuardianFullName
                                        }).SingleOrDefault();
            return model;
        }
        public void Update(NabalakSifarisModel model)
        {
            var updatesifaris = ent.tblNabalakSifaris.Where(x => x.NabalakId == model.NabalakId).SingleOrDefault();
            updatesifaris.NabalakId = model.NabalakId;
            updatesifaris.NabalakFaramNo = model.NabalakFaramNo;
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

            var updaterel = ent.tblNabalakRelativeDetails.Where(x => x.NabalakId == updatesifaris.NabalakId).SingleOrDefault();
            updaterel.NabalkRelativeInfoId = model.NabalkRelativeInfoId;
            updaterel.NabalakId = model.NabalakId;
            updaterel.BabukoNaamThar = model.BabukoNaamThar;
            updaterel.BabukoFullName = model.BabukoFullName;
            updaterel.AamakoNaamThar = model.AamakoNaamThar;
            updaterel.AamakoFullName = model.AamakoFullName;
            updaterel.SamrakshakNaamThar = model.SamrakshakNaamThar;
            updaterel.GuardianFullName = model.GuardianFullName;
            ent.Entry(updaterel).State = System.Data.Entity.EntityState.Modified;
            ent.SaveChanges();
        }

    }
}