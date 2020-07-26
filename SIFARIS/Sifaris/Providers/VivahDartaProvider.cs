using Sifaris.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sifaris.Providers
{
    public class VivahDartaProvider
    {
        SifarisEntities ent = new SifarisEntities();
        public void Insert(VivahDartaModel model)
        {
            var ActiveFiscalYearId = ent.tblFiscalYears.Where(x => x.IsActive == true).FirstOrDefault().FiscalYearId;
            //var currentloginworkOffice = Utility.GetCurrentLoginUserWorkOfficeId();
            int panjiId = 0;
            var objToSave = new tblPanjika()
            {
                PanjiState = model.PanjiState,
                PanjiDistrict = model.PanjiDistrict,
                PanjiPalika = model.PanjiPalika,
                PanjiWardNo = model.PanjiWardNo,
                PanjiNaamThar = model.PanjiName,
                PanjiFullName = model.PanjiName_Eng,
                Panji_INVId = model.Panji_INVId,
                VivahDartaFaramNo = model.VivahFaramDartaNo,
                FaramDartaMiti = model.FaramDartaMiti,
                FaramDartaDate = Utility.GetRomanDate(model.FaramDartaMiti).ToString(),
                PariwarLagatNo = model.PariwarLagatFaramNo  
            };
            objToSave.FiscalYear = ActiveFiscalYearId;
            //objToSave.WorkOffice = currentloginworkOffice;
            objToSave.WorkOffice = 1;
            //objToSave.CreatedBy = Utility.GetCurrentLoginUser();
            objToSave.CreatedBy = 1;
            objToSave.CreatedDate = DateTime.Now.ToShortDateString().ToString();
            objToSave.SifarisType = Utility.VivahSifaris;
            ent.tblPanjikas.Add(objToSave);
            ent.SaveChanges();

            panjiId = objToSave.PanjikaId;
            var newrecord = new tblVivahDarta()
            {
                PanjiId=panjiId,
                VivahKisim=model.VivahKisim,
                VivahBhayekoMiti=model.VivahBhayekoMiti,
                VivahBhayekoDate=Utility.GetRomanDate(model.VivahBhayekoMiti).ToString(),
                VivahPradesh=model.VivahPradesh,
                VivahJilla=model.VivahJilla,
                VivahPalika=model.VivahPalika,
                VivahWardNo=model.VivahWardNo,
                VivahGaunTole=model.VivahGaunTole,
                VivahGharNo=model.VivahGharNo,
                VivahBidesh=model.VivahBidesh,
                VivahForeign=model.VivahForeign

            };
            ent.tblVivahDartas.Add(newrecord);
            ent.SaveChanges();

            var newmarriageid = newrecord.NewMarriageId;
            var groomrecord = new tblVivahGroomDetail()
            {
                NewMarriageId=newmarriageid,
                NaamThar=model.GroomNaamThar,
                FullName=model.GroomFullName,
                JanmaMiti=model.GroomJanmaMiti,
                JaatJati=model.GroomJaatJati,
                MaritalStatus=model.GroomMaritalStatus,
                ShikshaSthar=model.GroomShikshaSthar,
                Pesha=model.GroomPesha,
                Dharma=model.GroomDharma,
                MatriBhasa=model.GroomMatriBhasa,
                PermaState=model.GroomPermaState,
                PermaDistrict=model.GroomPermaDistrict,
                PermaPalika=model.GroomPermaPalika,
                PermaWardNo=model.GroomPermaWardNo,
                GaunTole=model.GroomGaunTole,
                GharNo=model.GroomGharNo,
                JanmaDesh=model.GroomJanmaDesh,
                NagariktaLiyekoDesh=model.GroomNagariktaLiyekoDesh,
                NagariktaPraPaNo=model.GroomNagariktaPraPaNo,
                NagariktaIssueDate=model.GroomNagariktaIssueDate,
                NagariktaIsssueDistrict=model.GroomNagariktaIsssueDistrict,
                PassportNo_Desh=model.GroomPassportNo_Desh,
                BideshThegana=model.GroomBideshThegana,
                ForeignThegana=model.GroomForeignThegana,
                BajekoNaam=model.GroomBajekoNaam,
                Grandfather=model.GroomGrandfather,
                BabukoNaam=model.GroomBabukoNaam,
                FatherName=model.GroomFatherName,
                AamakoNaam=model.GroomAamakoNaam,
                MotherName=model.GroomMotherName,
                VivahGardaAge=model.GroomVivahGardaAge
            };
            ent.tblVivahGroomDetails.Add(groomrecord);
            
            var briderecord = new tblVivahBrideDetail()
            {
                NewMarriageId=newmarriageid,
                NaamThar = model.BrideNaamThar,
                FullName = model.BrideFullName,
                JanmaMiti = model.BrideJanmaMiti,
                JaatJati = model.BrideJaatJati,
                MaritalStatus = model.BrideMaritalStatus,
                ShikshaSthar = model.BrideShikshaSthar,
                Pesha = model.BridePesha,
                Dharma = model.BrideDharma,
                MatriBhasa = model.BrideMatriBhasa,
                PermaState = model.BridePermaState,
                PermaDistrict = model.BridePermaDistrict,
                PermaPalika = model.BridePermaPalika,
                PermaWardNo = model.BridePermaWardNo,
                GaunTole = model.BrideGaunTole,
                GharNo = model.BrideGharNo,
                JanmaDesh = model.BrideJanmaDesh,
                NagariktaLiyekoDesh = model.BrideNagariktaLiyekoDesh,
                NagariktaPraPaNo = model.BrideNagariktaPraPaNo,
                NagariktaIssueDate = model.BrideNagariktaIssueDate,
                NagariktaIsssueDistrict = model.BrideNagariktaIsssueDistrict,
                PassportNo_Desh = model.BridePassportNo_Desh,
                BideshThegana = model.BrideBideshThegana,
                ForeignThegana = model.BrideForeignThegana,
                BajekoNaam = model.BrideBajekoNaam,
                Grandfather = model.BrideGrandfather,
                BabukoNaam = model.BrideBabukoNaam,
                FatherName = model.BrideFatherName,
                AamakoNaam = model.BrideAamakoNaam,
                MotherName = model.BrideMotherName,
                VivahGardaAge=model.BrideVivahGardaAge
            };
            ent.tblVivahBrideDetails.Add(briderecord);
            
            var informant = new tblVivahDartaInformant()
            {
                NewMarriageId=newmarriageid,
                InfNaamThar = model.InfNaamThar,
                InfFullName = model.InfFullName,
                InfState = model.InfState,
                InfDistrict = model.InfDistrict,
                InfPalika = model.InfPalika,
                InfWardNo = model.InfWardNo,
                InfGaunTole = model.InfGaunTole,
                InfGharNo = model.InfGharNo,
                InfNagariktaPraPaNo = model.InfNagariktaPraPaNo,
                InfNagariktaIssueDate = model.InfNagariktaIssueDate,
                InfNagariktaIssueDistrict = model.InfNagariktaIssueDistrict,
                InfPassportNo_Desh = model.InfPassportNo_Desh,
                Miti = model.Miti,
            };
            ent.tblVivahDartaInformants.Add(informant);
            ent.SaveChanges();
        }
        public VivahDartaModel GetVivahDartaRecords(int WorkOfficeId, int? NewmarriageId, int page, int pagesize)
        {
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            VivahDartaModel model = (from newmarriage in ent.tblVivahDartas
                                     join groom in ent.tblVivahGroomDetails on newmarriage.NewMarriageId equals groom.NewMarriageId
                                     join bride in ent.tblVivahBrideDetails on newmarriage.NewMarriageId equals bride.NewMarriageId
                                     join panji in ent.tblPanjikas on newmarriage.PanjiId equals panji.PanjikaId
                                     join informant in ent.tblVivahDartaInformants on newmarriage.NewMarriageId equals informant.NewMarriageId
                                     where newmarriage.NewMarriageId == NewmarriageId && panji.WorkOffice==WorkOfficeId && panji.FiscalYear == activefiscalyear
                                     select new VivahDartaModel
                                     {
                                         //panjika
                                         PanjigarneId=panji.PanjikaId,
                                         PanjiState = panji.PanjiState,
                PanjiDistrict = panji.PanjiDistrict,
                PanjiPalika = panji.PanjiPalika,
                PanjiWardNo = panji.PanjiWardNo,
                PanjiName = panji.PanjiNaamThar,
                PanjiName_Eng = panji.PanjiFullName,
                Panji_INVId = panji.Panji_INVId,
                VivahFaramDartaNo =(int) panji.VivahDartaFaramNo,
                FaramDartaMiti = panji.FaramDartaMiti,
                PariwarLagatFaramNo = panji.PariwarLagatNo,
 
                //darta
                PanjiId=newmarriage.PanjiId,
                                         VivahKisim = newmarriage.VivahKisim,
                                         VivahBhayekoMiti = newmarriage.VivahBhayekoMiti,
                                         VivahPradesh = newmarriage.VivahPradesh,
                                         VivahJilla = newmarriage.VivahJilla,
                                         VivahPalika = newmarriage.VivahPalika,
                                         VivahWardNo = newmarriage.VivahWardNo,
                                         VivahGaunTole = newmarriage.VivahGaunTole,
                                         VivahGharNo = newmarriage.VivahGharNo,
                                         VivahBidesh = newmarriage.VivahBidesh,
                                         VivahForeign = newmarriage.VivahForeign,

                                         //groom detail
                                         NewMarriageGroomDetailsId=groom.NewMarriageGroomDetailsId,
                                        MapGroomNewMarriageId=groom.NewMarriageId,
                GroomNaamThar=groom.NaamThar,
                GroomFullName=groom.FullName,
                GroomJanmaMiti=groom.JanmaMiti,
                GroomJaatJati=groom.JaatJati,
                GroomMaritalStatus=(bool)groom.MaritalStatus,
                GroomShikshaSthar=groom.ShikshaSthar,
                GroomPesha=groom.Pesha,
                GroomDharma=groom.Dharma,
                GroomMatriBhasa=groom.MatriBhasa,
                GroomPermaState=groom.PermaState,
                GroomPermaDistrict=groom.PermaDistrict,
                GroomPermaPalika=groom.PermaPalika,
                GroomPermaWardNo=groom.PermaWardNo,
                GroomGaunTole=groom.GaunTole,
                GroomGharNo=groom.GharNo,
                GroomJanmaDesh=groom.JanmaDesh,
                GroomNagariktaLiyekoDesh=groom.NagariktaLiyekoDesh,
                GroomNagariktaPraPaNo=groom.NagariktaPraPaNo,
                GroomNagariktaIssueDate=groom.NagariktaIssueDate,
                GroomNagariktaIsssueDistrict=groom.NagariktaIsssueDistrict,
                GroomPassportNo_Desh=groom.PassportNo_Desh,
                GroomBideshThegana=groom.BideshThegana,
                GroomForeignThegana=groom.ForeignThegana,
                GroomBajekoNaam=groom.BajekoNaam,
                GroomGrandfather=groom.Grandfather,
                GroomBabukoNaam=groom.BabukoNaam,
                GroomFatherName=groom.FatherName,
                GroomAamakoNaam=groom.AamakoNaam,
                GroomMotherName=groom.MotherName,
                GroomVivahGardaAge=groom.VivahGardaAge,
                //bride details
                NewMarriageBrideDetailsId=bride.NewMarriageBrideDetailsId,
                MapBrideNewMarriageId=bride.NewMarriageId,
                BrideNaamThar=bride.NaamThar,
                BrideFullName=bride.FullName,
                BrideJanmaMiti=bride.JanmaMiti,
                BrideJaatJati=bride.JaatJati,
                BrideMaritalStatus=(bool)bride.MaritalStatus,
                BrideShikshaSthar=bride.ShikshaSthar,
                BridePesha=bride.Pesha,
                BrideDharma=bride.Dharma,
                BrideMatriBhasa=bride.MatriBhasa,
                BridePermaState=bride.PermaState,
                BridePermaDistrict=bride.PermaDistrict,
                BridePermaPalika=bride.PermaPalika,
                BridePermaWardNo=bride.PermaWardNo,
                BrideGaunTole=bride.GaunTole,
                BrideGharNo=bride.GharNo,
                BrideJanmaDesh=bride.JanmaDesh,
                BrideNagariktaLiyekoDesh=bride.NagariktaLiyekoDesh,
                BrideNagariktaPraPaNo=bride.NagariktaPraPaNo,
                BrideNagariktaIssueDate=bride.NagariktaIssueDate,
                BrideNagariktaIsssueDistrict=bride.NagariktaIsssueDistrict,
                BridePassportNo_Desh=bride.PassportNo_Desh,
                BrideBideshThegana=bride.BideshThegana,
                BrideForeignThegana=bride.ForeignThegana,
                BrideBajekoNaam=bride.BajekoNaam,
                BrideGrandfather=bride.Grandfather,
                BrideBabukoNaam=bride.BabukoNaam,
                BrideFatherName=bride.FatherName,
                BrideAamakoNaam=bride.AamakoNaam,
                BrideMotherName=bride.MotherName,
                BrideVivahGardaAge=bride.VivahGardaAge,
                //informant
                NewMarriageInformantId=informant.NewMarriageInformantId,
                MapInformantNewMarriageId=informant.NewMarriageId,
                InfNaamThar = informant.InfNaamThar,
                InfFullName = informant.InfFullName,
                InfState = informant.InfState,
                InfDistrict = informant.InfDistrict,
                InfPalika = informant.InfPalika,
                InfWardNo = informant.InfWardNo,
                InfGaunTole = informant.InfGaunTole,
                InfGharNo = informant.InfGharNo,
                InfNagariktaPraPaNo = informant.InfNagariktaPraPaNo,
                InfNagariktaIssueDate = informant.InfNagariktaIssueDate,
                InfNagariktaIssueDistrict = informant.InfNagariktaIssueDistrict,
                InfPassportNo_Desh = informant.InfPassportNo_Desh,
                Miti = informant.Miti,
                }).SingleOrDefault();
            return model;
        }
        public List<VivahDartaModel> GetVivahDartaRecordsList(int WorkOfficeId, int? NewdeathId, int page, int pagesize)
        {
            List<VivahDartaModel> model = new List<VivahDartaModel>();
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            model = (from newmarriage in ent.tblVivahDartas
                     join groom in ent.tblVivahGroomDetails on newmarriage.NewMarriageId equals groom.NewMarriageId
                     join bride in ent.tblVivahBrideDetails on newmarriage.NewMarriageId equals bride.NewMarriageId
                     join panji in ent.tblPanjikas on newmarriage.PanjiId equals panji.PanjikaId
                     where panji.FiscalYear == activefiscalyear
                     select new VivahDartaModel
                     {
                         NewMarriageId = newmarriage.NewMarriageId,
                         GroomNaamThar=groom.NaamThar,
                         BrideNaamThar=bride.NaamThar,
                         VivahBhayekoMiti=newmarriage.VivahBhayekoMiti,
                         VivahFaramDartaNo=(int) panji.VivahDartaFaramNo
                     }).ToList();
            
            return model;
        }
        public void Update(VivahDartaModel model)
        {
            var updatedarta = ent.tblVivahDartas.Where(x => x.NewMarriageId == model.NewMarriageId).SingleOrDefault();
            updatedarta.NewMarriageId=model.NewMarriageId;
            updatedarta.PanjiId=model.PanjiId;
            updatedarta.VivahKisim=model.VivahKisim;
            updatedarta.VivahBhayekoMiti=model.VivahBhayekoMiti;
            updatedarta.VivahBhayekoDate=Utility.GetRomanDate(model.VivahBhayekoMiti).ToString();
            updatedarta.VivahPradesh=model.VivahPradesh;
            updatedarta.VivahJilla=model.VivahJilla;
            updatedarta.VivahPalika=model.VivahPalika;
            updatedarta.VivahWardNo=model.VivahWardNo;
            updatedarta.VivahGaunTole=model.VivahGaunTole;
            updatedarta.VivahGharNo=model.VivahGharNo;
            updatedarta.VivahBidesh=model.VivahBidesh;
            updatedarta.VivahForeign = model.VivahForeign;
            ent.Entry(updatedarta).State = System.Data.Entity.EntityState.Modified;

            var updatePanji = ent.tblPanjikas.Where(x => x.PanjikaId == updatedarta.PanjiId).SingleOrDefault();
            updatePanji.PanjiState = model.PanjiState;
            updatePanji.PanjiDistrict = model.PanjiDistrict;
            updatePanji.PanjiPalika = model.PanjiPalika;
            updatePanji.PanjiWardNo = model.PanjiWardNo;
            updatePanji.PanjiNaamThar = model.PanjiName;
            updatePanji.PanjiFullName = model.PanjiName_Eng;
            updatePanji.Panji_INVId = model.Panji_INVId;
            updatePanji.VivahDartaFaramNo = model.VivahFaramDartaNo;
            updatePanji.FaramDartaMiti = model.FaramDartaMiti;
            updatePanji.FaramDartaDate = Utility.GetRomanDate(model.FaramDartaMiti).ToString();
            updatePanji.PariwarLagatNo = model.PariwarLagatFaramNo;
            //updatePanji.UpdatedBy = Utility.GetCurrentLoginUser();
            updatePanji.UpdatedBy = 1;
            updatePanji.UpdatedDate = DateTime.Now.ToShortDateString().ToString();
            ent.Entry(updatePanji).State = System.Data.Entity.EntityState.Modified;

            var updategroomdetail = ent.tblVivahGroomDetails.Where(x => x.NewMarriageId == updatedarta.NewMarriageId).SingleOrDefault();
           updategroomdetail.NewMarriageId=model.NewMarriageId;
           updategroomdetail.NaamThar=model.GroomNaamThar;
           updategroomdetail.FullName=model.GroomFullName;
           updategroomdetail.JanmaMiti=model.GroomJanmaMiti;
           updategroomdetail.JaatJati=model.GroomJaatJati;
           updategroomdetail.MaritalStatus=model.GroomMaritalStatus;
           updategroomdetail.ShikshaSthar=model.GroomShikshaSthar;
           updategroomdetail.Pesha=model.GroomPesha;
           updategroomdetail.Dharma=model.GroomDharma;
           updategroomdetail.MatriBhasa=model.GroomMatriBhasa;
           updategroomdetail.PermaState=model.GroomPermaState;
           updategroomdetail.PermaDistrict=model.GroomPermaDistrict;
           updategroomdetail.PermaPalika=model.GroomPermaPalika;
           updategroomdetail.PermaWardNo=model.GroomPermaWardNo;
           updategroomdetail.GaunTole=model.GroomGaunTole;
           updategroomdetail.GharNo=model.GroomGharNo;
           updategroomdetail.JanmaDesh=model.GroomJanmaDesh;
           updategroomdetail.NagariktaLiyekoDesh=model.GroomNagariktaLiyekoDesh;
           updategroomdetail.NagariktaPraPaNo=model.GroomNagariktaPraPaNo;
           updategroomdetail.NagariktaIssueDate=model.GroomNagariktaIssueDate;
           updategroomdetail.NagariktaIsssueDistrict=model.GroomNagariktaIsssueDistrict;
           updategroomdetail.PassportNo_Desh=model.GroomPassportNo_Desh;
           updategroomdetail.BideshThegana=model.GroomBideshThegana;
           updategroomdetail.ForeignThegana=model.GroomForeignThegana;
           updategroomdetail.BajekoNaam=model.GroomBajekoNaam;
           updategroomdetail.Grandfather=model.GroomGrandfather;
           updategroomdetail.BabukoNaam=model.GroomBabukoNaam;
           updategroomdetail.FatherName=model.GroomFatherName;
           updategroomdetail.AamakoNaam=model.GroomAamakoNaam;
           updategroomdetail.MotherName = model.GroomMotherName;
           updategroomdetail.VivahGardaAge = model.GroomVivahGardaAge;
            ent.Entry(updategroomdetail).State = System.Data.Entity.EntityState.Modified;

           var updatebridedetail = ent.tblVivahBrideDetails.Where(x => x.NewMarriageId == updatedarta.NewMarriageId).SingleOrDefault();
            updatebridedetail.NewMarriageId=model.NewMarriageId;
            updatebridedetail.NaamThar = model.BrideNaamThar;
            updatebridedetail.FullName = model.BrideFullName;
            updatebridedetail.JanmaMiti = model.BrideJanmaMiti;
            updatebridedetail.JaatJati = model.BrideJaatJati;
            updatebridedetail.MaritalStatus = model.BrideMaritalStatus;
            updatebridedetail.ShikshaSthar = model.BrideShikshaSthar;
            updatebridedetail.Pesha = model.BridePesha;
            updatebridedetail.Dharma = model.BrideDharma;
            updatebridedetail.MatriBhasa = model.BrideMatriBhasa;
            updatebridedetail.PermaState = model.BridePermaState;
            updatebridedetail.PermaDistrict = model.BridePermaDistrict;
            updatebridedetail.PermaPalika = model.BridePermaPalika;
            updatebridedetail.PermaWardNo = model.BridePermaWardNo;
            updatebridedetail.GaunTole = model.BrideGaunTole;
            updatebridedetail.GharNo = model.BrideGharNo;
            updatebridedetail.JanmaDesh = model.BrideJanmaDesh;
            updatebridedetail.NagariktaLiyekoDesh = model.BrideNagariktaLiyekoDesh;
            updatebridedetail.NagariktaPraPaNo = model.BrideNagariktaPraPaNo;
            updatebridedetail.NagariktaIssueDate = model.BrideNagariktaIssueDate;
            updatebridedetail.NagariktaIsssueDistrict = model.BrideNagariktaIsssueDistrict;
            updatebridedetail.PassportNo_Desh = model.BridePassportNo_Desh;
            updatebridedetail.BideshThegana = model.BrideBideshThegana;
            updatebridedetail.ForeignThegana = model.BrideForeignThegana;
            updatebridedetail.BajekoNaam = model.BrideBajekoNaam;
            updatebridedetail.Grandfather = model.BrideGrandfather;
            updatebridedetail.BabukoNaam = model.BrideBabukoNaam;
            updatebridedetail.FatherName = model.BrideFatherName;
            updatebridedetail.AamakoNaam = model.BrideAamakoNaam;
            updatebridedetail.MotherName = model.BrideMotherName;
            updatebridedetail.VivahGardaAge = model.BrideVivahGardaAge;
            ent.Entry(updatebridedetail).State = System.Data.Entity.EntityState.Modified;

            var updateinformant = ent.tblVivahDartaInformants.Where(x => x.NewMarriageId == updatedarta.NewMarriageId).SingleOrDefault();
            if (updateinformant!=null)
            {
                updateinformant.NewMarriageId=model.NewMarriageId;
                updateinformant.InfNaamThar = model.InfNaamThar;
                updateinformant.InfFullName = model.InfFullName;
                updateinformant.InfState = model.InfState;
                updateinformant.InfDistrict = model.InfDistrict;
                updateinformant.InfPalika = model.InfPalika;
                updateinformant.InfWardNo = model.InfWardNo;
                updateinformant.InfGaunTole = model.InfGaunTole;
                updateinformant.InfGharNo = model.InfGharNo;
                updateinformant.InfNagariktaPraPaNo = model.InfNagariktaPraPaNo;
                updateinformant.InfNagariktaIssueDate = model.InfNagariktaIssueDate;
                updateinformant.InfNagariktaIssueDistrict = model.InfNagariktaIssueDistrict;
                updateinformant.InfPassportNo_Desh = model.InfPassportNo_Desh;
                updateinformant.Miti = model.Miti;
                ent.Entry(updateinformant).State = System.Data.Entity.EntityState.Modified;
            }            
            else
            {
                var newinfrecord = new tblVivahDartaInformant
                {
                NewMarriageId=model.NewMarriageId,
                InfNaamThar = model.InfNaamThar,
                InfFullName = model.InfFullName,
                InfState = model.InfState,
                InfDistrict = model.InfDistrict,
                InfPalika = model.InfPalika,
                InfWardNo = model.InfWardNo,
                InfGaunTole = model.InfGaunTole,
                InfGharNo = model.InfGharNo,
                InfNagariktaPraPaNo = model.InfNagariktaPraPaNo,
                InfNagariktaIssueDate = model.InfNagariktaIssueDate,
                InfNagariktaIssueDistrict = model.InfNagariktaIssueDistrict,
                InfPassportNo_Desh = model.InfPassportNo_Desh,
                Miti = model.Miti,
                };
                ent.tblVivahDartaInformants.Add(newinfrecord);
                ent.SaveChanges();
            }
        }
        public List<VivahDartaModel> GetSearchList(int? faramno, int? fiscalyear)
        {
            var model = new List<VivahDartaModel>();
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            var activeyear = 0;
            if (fiscalyear != null)
            {
                activeyear = (int)fiscalyear;
            }
            else { activeyear = activefiscalyear; }
            model = (from newmarriage in ent.tblVivahDartas
                     join groom in ent.tblVivahGroomDetails on newmarriage.NewMarriageId equals groom.NewMarriageId
                     join bride in ent.tblVivahBrideDetails on newmarriage.NewMarriageId equals bride.NewMarriageId
                     join panji in ent.tblPanjikas on newmarriage.PanjiId equals panji.PanjikaId
                     where panji.FiscalYear == activefiscalyear
                     select new VivahDartaModel
                     {
                         NewMarriageId = newmarriage.NewMarriageId,
                         GroomNaamThar = groom.NaamThar,
                         BrideNaamThar = bride.NaamThar,
                         VivahBhayekoMiti = newmarriage.VivahBhayekoMiti,
                         FaramNo=panji.VivahDartaFaramNo
                     }).ToList();

            if (faramno != null)
            {
                model = model.Where(x => x.FaramNo == faramno).ToList();
            }

            return model;
        }
    }
}