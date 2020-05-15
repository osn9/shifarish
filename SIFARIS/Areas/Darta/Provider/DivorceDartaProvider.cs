using SIFARIS.Areas.Darta.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.Darta.Provider
{
    public class DivorceDartaProvider
    {
        SifarishEntities ent = new SifarishEntities();
        public void Insert(DivorceDartaModel model)
        {
            var ActiveFiscalYearId = ent.tblFiscalYears.Where(x => x.IsActive == true).FirstOrDefault().FiscalYearId;
            //var currentloginworkOffice = Utility.GetCurrentLoginUserWorkOfficeId();
            var panjiId = 0;
            var objToSave = new tblPanjika()
            {
                PanjiState = model.PanjiState,
                PanjiDistrict = model.PanjiDistrict,
                PanjiPalika = model.PanjiPalika,
                PanjiWardNo = model.PanjiWardNo,
                PanjiNaamThar = model.PanjiName,
                PanjiFullName = model.PanjiName_Eng,
                Panji_INVId = model.Panji_INVId,
                DivorceDartaFaramNo = model.DivorceFaramDartaNo,
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
            objToSave.SifarisType = Utility.DivorceSifaris;
            ent.tblPanjikas.Add(objToSave);
            ent.SaveChanges();

            panjiId = objToSave.PanjikaId;
            var insertnew = new tblDivorceDarta()
            {
                DivorceId = model.DivorceId,
                PanjiId = panjiId,
                CourtType = model.CourtType,
                District = model.District,
                NirnayaNo = model.NirnayaNo,
                NinayaMiti = model.NinayaMiti,
                VivahDartaNo = model.VivahDartaNo,

            };
            ent.tblDivorceDartas.Add(insertnew);
            ent.SaveChanges();

            var divorceId = insertnew.DivorceId;
            var newrecordhusband = new tblDivorceeHusbandDetail()
            {
                DivorceId = divorceId,
                NaamThar=model.HusbandNaamThar,
                FullName=model.HusbandFullName,
                JanmaMiti=model.HusbandJanmaMiti,
                JanmaDartaNo=model.HusbandJanmaDartaNo,
                JanmaDesh=model.HusbandJanmaDesh,
                NagariktaPraPaNo=model.HusbandNagariktaPraPaNo,
                NagariktaIssueDate=model.HusbandNagariktaIssueDate,
                NagariktaIssueDistrict=model.HusbandNagariktaIssueDistrict,
                BideshPassport_Desh=model.HusbandBideshPassport_Desh,
                District=model.HusbandDistrict,
                Palika=model.HusbandPalika,
                WardNo=model.HusbandWardNo,
                JaatJati=model.HusbandJaatJati,
                ShikshaSthar=model.HusbandShikshaSthar,
                Dharma=model.HusbandDharma,
                MatriBhasa=model.HusbandMatriBhasa,
                BaajekoNaamThar=model.HusbandBaajekoNaamThar,
                BaajekoFullName=model.HusbandBaajekoFullName,
                BabukoNaamThar=model.HusbandBabukoNaamThar,
                BabukoFullName=model.HusbandBabukoFullName,
                AamakoNaamThar=model.HusbandAamakoNaamThar,
                AamakoFullName=model.HusbandAamakoFullName,
                VivahMiti=model.VivahMiti,
                VivahDate=Utility.GetRomanDate(model.VivahMiti).ToString(),
                TotalChildBorn=model.TotalChildBorn,
                TotalLiveChild=model.TotalLiveChild,
                ChildLivingWith=model.HusbandChildLivingWith,
                SonLivingWith=model.HusbandSonLivingWith,
                DaughterLivingWith=model.HusbandDaughterLivingWith

            };
            ent.tblDivorceeHusbandDetails.Add(newrecordhusband);
            var newrecordwife = new tblDivorceeWifeDetail()
            {
                DivorceId=divorceId,
                NaamThar = model.WifeNaamThar,
                FullName = model.WifeFullName,
                JanmaMiti = model.WifeJanmaMiti,
                JanmaDartaNo = model.WifeJanmaDartaNo,
                JanmaDesh = model.WifeJanmaDesh,
                NagariktaPraPaNo = model.WifeNagariktaPraPaNo,
                NagariktaIssueDate = model.WifeNagariktaIssueDate,
                NagariktaIssueDistrict = model.WifeNagariktaIssueDistrict,
                BideshPassport_Desh = model.WifeBideshPassport_Desh,
                District = model.WifeDistrict,
                Palika = model.WifePalika,
                WardNo = model.WifeWardNo,
                JaatJati = model.WifeJaatJati,
                ShikshaSthar = model.WifeShikshaSthar,
                Dharma = model.WifeDharma,
                MatriBhasa = model.WifeMatriBhasa,
                BaajekoNaamThar = model.WifeBaajekoNaamThar,
                BaajekoFullName = model.WifeBaajekoFullName,
                BabukoNaamThar = model.WifeBabukoNaamThar,
                BabukoFullName = model.WifeBabukoFullName,
                AamakoNaamThar = model.WifeAamakoNaamThar,
                AamakoFullName = model.WifeAamakoFullName,
                ChildLivingWith = model.WifeChildLivingWith,
                SonLivingWith = model.WifeSonLivingWith,
                DaughterLivingWith = model.WifeDaughterLivingWith
            };
            ent.tblDivorceeWifeDetails.Add(newrecordwife);
            var informant = new tblDivorceDartaInformant()
            {
                DivorceId = divorceId,
                InfNaamThar = model.InfNaamThar,
                InfFullName = model.InfFullName,
                InfRelationToDivorcee = model.InfRelationToDivorcee,
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
            ent.tblDivorceDartaInformants.Add(informant);
        }
        public DivorceDartaModel GetDivorceDartaRecords(int WorkOfficeId, int? DivorceId, int page, int pagesize)
        {
            //JanmaDartaModel model = new JanmaDartaModel();
            var activefiscalyear = Utility.GetCurrentFisicalYear();

            DivorceDartaModel data = (from divorce in ent.tblDivorceDartas
                                    join husband in ent.tblDivorceeHusbandDetails on divorce.DivorceId equals husband.DivorceId
                                    join wife in ent.tblDivorceeWifeDetails on divorce.DivorceId equals wife.DivorceId
                                     join panji in ent.tblPanjikas on divorce.PanjiId equals panji.PanjikaId
                                    join informant in ent.tblDivorceDartaInformants on divorce.DivorceId equals informant.DivorceId
                                    where divorce.DivorceId == DivorceId && panji.WorkOffice == WorkOfficeId && panji.FiscalYear == activefiscalyear
                                    select new DivorceDartaModel
                                    {
                                        //panjidetail
                                        PanjigarneId = panji.PanjikaId,
                                        PanjiState = panji.PanjiState,
                                        PanjiDistrict = panji.PanjiDistrict,
                                        PanjiPalika = panji.PanjiPalika,
                                        PanjiWardNo = panji.PanjiWardNo,
                                        PanjiName = panji.PanjiNaamThar,
                                        PanjiName_Eng = panji.PanjiFullName,
                                        Panji_INVId = panji.Panji_INVId,
                                        DivorceFaramDartaNo = (int)panji.JanmaDartaFaramNo,
                                        FaramDartaMiti = panji.FaramDartaMiti,
                                        PariwarLagatFaramNo = panji.PariwarLagatNo,
                                        FiscalYear = panji.FiscalYear,
                                        WorkOffice = panji.WorkOffice,
                                        //divorcedarta
                                        DivorceId = divorce.DivorceId,
                                        PanjiId = divorce.PanjiId,
                                        CourtType = divorce.CourtType,
                                        District = divorce.District,
                                        NirnayaNo = divorce.NirnayaNo,
                                        NinayaMiti = divorce.NinayaMiti,
                                        VivahDartaNo = divorce.VivahDartaNo,
                                        //husbanddetail
                                        DivorceeHusbandId=husband.DivorceeHusbandId,
                                        MapHusbandDivorceId = husband.DivorceId,
                                        HusbandNaamThar = husband.NaamThar,
                                        HusbandFullName = husband.FullName,
                                        HusbandJanmaMiti = husband.JanmaMiti,
                                        HusbandJanmaDartaNo = husband.JanmaDartaNo,
                                        HusbandJanmaDesh = husband.JanmaDesh,
                                        HusbandNagariktaPraPaNo = husband.NagariktaPraPaNo,
                                        HusbandNagariktaIssueDate = husband.NagariktaIssueDate,
                                        HusbandNagariktaIssueDistrict = husband.NagariktaIssueDistrict,
                                        HusbandBideshPassport_Desh = husband.BideshPassport_Desh,
                                        HusbandDistrict = husband.District,
                                        HusbandPalika = husband.Palika,
                                        HusbandWardNo = husband.WardNo,
                                        HusbandJaatJati = husband.JaatJati,
                                        HusbandShikshaSthar = husband.ShikshaSthar,
                                        HusbandDharma = husband.Dharma,
                                        HusbandMatriBhasa = husband.MatriBhasa,
                                        HusbandBaajekoNaamThar = husband.BaajekoNaamThar,
                                        HusbandBaajekoFullName = husband.BaajekoFullName,
                                        HusbandBabukoNaamThar = husband.BabukoNaamThar,
                                        HusbandBabukoFullName = husband.BabukoFullName,
                                        HusbandAamakoNaamThar = husband.AamakoNaamThar,
                                        HusbandAamakoFullName = husband.AamakoFullName,
                                        VivahMiti = husband.VivahMiti,
                                        TotalChildBorn = husband.TotalChildBorn,
                                        TotalLiveChild = husband.TotalLiveChild,
                                        HusbandChildLivingWith = husband.ChildLivingWith,
                                        HusbandSonLivingWith = husband.SonLivingWith,
                                        HusbandDaughterLivingWith = husband.DaughterLivingWith,

                                        //wifedetail
                                        DivorceeWifeId=wife.DivorceeWifeId,
                                        MapWifeDivorceId=wife.DivorceId,
                                        WifeNaamThar = wife.NaamThar,
                                        WifeFullName = wife.FullName,
                                        WifeJanmaMiti = wife.JanmaMiti,
                                        WifeJanmaDartaNo = wife.JanmaDartaNo,
                                        WifeJanmaDesh = wife.JanmaDesh,
                                        WifeNagariktaPraPaNo = wife.NagariktaPraPaNo,
                                        WifeNagariktaIssueDate = wife.NagariktaIssueDate,
                                        WifeNagariktaIssueDistrict = wife.NagariktaIssueDistrict,
                                        WifeBideshPassport_Desh = wife.BideshPassport_Desh,
                                        WifeDistrict = wife.District,
                                        WifePalika = wife.Palika,
                                        WifeWardNo = wife.WardNo,
                                        WifeJaatJati = wife.JaatJati,
                                        WifeShikshaSthar = wife.ShikshaSthar,
                                        WifeDharma = wife.Dharma,
                                        WifeMatriBhasa = wife.MatriBhasa,
                                        WifeBaajekoNaamThar = wife.BaajekoNaamThar,
                                        WifeBaajekoFullName = wife.BaajekoFullName,
                                        WifeBabukoNaamThar = wife.BabukoNaamThar,
                                        WifeBabukoFullName = wife.BabukoFullName,
                                        WifeAamakoNaamThar = wife.AamakoNaamThar,
                                        WifeAamakoFullName = wife.AamakoFullName,
                                        WifeChildLivingWith = wife.ChildLivingWith,
                                        WifeSonLivingWith = wife.SonLivingWith,
                                        WifeDaughterLivingWith = wife.DaughterLivingWith,
                                        //informantdetail
                                        DivorceInformantId = informant.DivorceInformantId,
                                        MapInformantDivorceId = informant.DivorceId,
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
                                        Miti = informant.Miti
                                    }).SingleOrDefault();

            return data;
        }
        public List<DivorceDartaModel> GetdivorceDartaRecordsList(int WorkOfficeId, int? divorceid, int page, int pagesize)
        {
            var model = new List<DivorceDartaModel>();
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            model = (from divorce in ent.tblDivorceDartas
                     join husband in ent.tblDivorceeHusbandDetails on divorce.DivorceId equals husband.DivorceId
                     join wife in ent.tblDivorceeWifeDetails on divorce.DivorceId equals wife.DivorceId
                     join panji in ent.tblPanjikas on divorce.PanjiId equals panji.PanjikaId
                     where panji.FiscalYear == activefiscalyear
                     select new DivorceDartaModel
                     {
                         DivorceId = divorce.DivorceId,
                         HusbandNaamThar=husband.NaamThar,
                         WifeNaamThar=wife.NaamThar,
                         DivorceFaramDartaNo = (int)panji.DivorceDartaFaramNo,
                         CourtType=divorce.CourtType,
                         District=divorce.District,
                         NinayaMiti=divorce.NinayaMiti
                     }).ToList();


            return model;
        }
        public List<DivorceDartaModel> GetSearchList(int? faramno, int? fiscalyear)
        {
            var model = new List<DivorceDartaModel>();
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            var activeyear = 0;
            if (fiscalyear != null)
            {
                activeyear = (int)fiscalyear;
            }
            else { activeyear = activefiscalyear; }
            model = (from divorce in ent.tblDivorceDartas
                     join husband in ent.tblDivorceeHusbandDetails on divorce.DivorceId equals husband.DivorceId
                     join wife in ent.tblDivorceeWifeDetails on divorce.DivorceId equals wife.DivorceId
                     join panji in ent.tblPanjikas on divorce.PanjiId equals panji.PanjikaId
                     where panji.FiscalYear == activeyear
                     select new DivorceDartaModel
                     {
                         DivorceId = divorce.DivorceId,
                         HusbandNaamThar = husband.NaamThar,
                         WifeNaamThar = wife.NaamThar,
                         DivorceFaramDartaNo = (int)panji.DivorceDartaFaramNo,
                         CourtType = divorce.CourtType,
                         District = divorce.District,
                         NinayaMiti = divorce.NinayaMiti
                     }).ToList();

            if (faramno != null)
            {
                model = model.Where(x => x.FaramNo == faramno).ToList();
            }

            return model;
        }
        public void Update(DivorceDartaModel model)
        {
            var updatedarta = ent.tblDivorceDartas.Where(x => x.DivorceId == model.DivorceId).SingleOrDefault();
            updatedarta.DivorceId = model.DivorceId;
            updatedarta.PanjiId = model.PanjiId;
            updatedarta.CourtType = model.CourtType;
            updatedarta.District = model.District;
            updatedarta.NirnayaNo = model.NirnayaNo;
            updatedarta.NinayaMiti = model.NinayaMiti;
            updatedarta.VivahDartaNo = model.VivahDartaNo;
            ent.Entry(updatedarta).State = System.Data.Entity.EntityState.Modified;

            var updatePanji = ent.tblPanjikas.Where(x => x.PanjikaId == updatedarta.PanjiId).SingleOrDefault();
            updatePanji.PanjiState = model.PanjiState;
            updatePanji.PanjiDistrict = model.PanjiDistrict;
            updatePanji.PanjiPalika = model.PanjiPalika;
            updatePanji.PanjiWardNo = model.PanjiWardNo;
            updatePanji.PanjiNaamThar = model.PanjiName;
            updatePanji.PanjiFullName = model.PanjiName_Eng;
            updatePanji.Panji_INVId = model.Panji_INVId;
            updatePanji.DivorceDartaFaramNo = model.DivorceFaramDartaNo;
            updatePanji.FaramDartaMiti = model.FaramDartaMiti;
            updatePanji.FaramDartaDate = Utility.GetRomanDate(model.FaramDartaMiti).ToString();
            updatePanji.PariwarLagatNo = model.PariwarLagatFaramNo;
            //updatePanji.UpdatedBy = Utility.GetCurrentLoginUser();
            updatePanji.UpdatedBy = 1;
            updatePanji.UpdatedDate = DateTime.Now.ToShortDateString().ToString();
            ent.Entry(updatePanji).State = System.Data.Entity.EntityState.Modified;

            var updatehusbanddetail = ent.tblDivorceeHusbandDetails.Where(x => x.DivorceId == updatedarta.DivorceId).SingleOrDefault();
            if (updatehusbanddetail != null)
            {
                updatehusbanddetail.DivorceId = model.DivorceId;
                updatehusbanddetail.NaamThar = model.HusbandNaamThar;
                updatehusbanddetail.FullName = model.HusbandFullName;
                updatehusbanddetail.JanmaMiti = model.HusbandJanmaMiti;
                updatehusbanddetail.JanmaDartaNo = model.HusbandJanmaDartaNo;
                updatehusbanddetail.JanmaDesh = model.HusbandJanmaDesh;
                updatehusbanddetail.NagariktaPraPaNo = model.HusbandNagariktaPraPaNo;
                updatehusbanddetail.NagariktaIssueDate = model.HusbandNagariktaIssueDate;
                updatehusbanddetail.NagariktaIssueDistrict = model.HusbandNagariktaIssueDistrict;
                updatehusbanddetail.BideshPassport_Desh = model.HusbandBideshPassport_Desh;
                updatehusbanddetail.District = model.HusbandDistrict;
                updatehusbanddetail.Palika = model.HusbandPalika;
                updatehusbanddetail.WardNo = model.HusbandWardNo;
                updatehusbanddetail.JaatJati = model.HusbandJaatJati;
                updatehusbanddetail.ShikshaSthar = model.HusbandShikshaSthar;
                updatehusbanddetail.Dharma = model.HusbandDharma;
                updatehusbanddetail.MatriBhasa = model.HusbandMatriBhasa;
                updatehusbanddetail.BaajekoNaamThar = model.HusbandBaajekoNaamThar;
                updatehusbanddetail.BaajekoFullName = model.HusbandBaajekoFullName;
                updatehusbanddetail.BabukoNaamThar = model.HusbandBabukoNaamThar;
                updatehusbanddetail.BabukoFullName = model.HusbandBabukoFullName;
                updatehusbanddetail.AamakoNaamThar = model.HusbandAamakoNaamThar;
                updatehusbanddetail.AamakoFullName = model.HusbandAamakoFullName;
                updatehusbanddetail.VivahMiti = model.VivahMiti;
                updatehusbanddetail.VivahDate = Utility.GetRomanDate(model.VivahMiti).ToString();
                updatehusbanddetail.TotalChildBorn = model.TotalChildBorn;
                updatehusbanddetail.TotalLiveChild = model.TotalLiveChild;
                updatehusbanddetail.ChildLivingWith = model.HusbandChildLivingWith;
                updatehusbanddetail.SonLivingWith = model.HusbandSonLivingWith;
                updatehusbanddetail.DaughterLivingWith = model.HusbandDaughterLivingWith;
                ent.Entry(updatehusbanddetail).State = System.Data.Entity.EntityState.Modified;
            }

            var updatewifedetail = ent.tblDivorceeWifeDetails.Where(x => x.DivorceId == updatedarta.DivorceId).SingleOrDefault();
            if (updatewifedetail != null)
            {
                updatewifedetail.DivorceId = model.DivorceId;
                updatewifedetail.NaamThar = model.WifeNaamThar;
                updatewifedetail.FullName = model.WifeFullName;
                updatewifedetail.JanmaMiti = model.WifeJanmaMiti;
                updatewifedetail.JanmaDartaNo = model.WifeJanmaDartaNo;
                updatewifedetail.JanmaDesh = model.WifeJanmaDesh;
                updatewifedetail.NagariktaPraPaNo = model.WifeNagariktaPraPaNo;
                updatewifedetail.NagariktaIssueDate = model.WifeNagariktaIssueDate;
                updatewifedetail.NagariktaIssueDistrict = model.WifeNagariktaIssueDistrict;
                updatewifedetail.BideshPassport_Desh = model.WifeBideshPassport_Desh;
                updatewifedetail.District = model.WifeDistrict;
                updatewifedetail.Palika = model.WifePalika;
                updatewifedetail.WardNo = model.WifeWardNo;
                updatewifedetail.JaatJati = model.WifeJaatJati;
                updatewifedetail.ShikshaSthar = model.WifeShikshaSthar;
                updatewifedetail.Dharma = model.WifeDharma;
                updatewifedetail.MatriBhasa = model.WifeMatriBhasa;
                updatewifedetail.BaajekoNaamThar = model.WifeBaajekoNaamThar;
                updatewifedetail.BaajekoFullName = model.WifeBaajekoFullName;
                updatewifedetail.BabukoNaamThar = model.WifeBabukoNaamThar;
                updatewifedetail.BabukoFullName = model.WifeBabukoFullName;
                updatewifedetail.AamakoNaamThar = model.WifeAamakoNaamThar;
                updatewifedetail.AamakoFullName = model.WifeAamakoFullName;
                updatewifedetail.ChildLivingWith = model.WifeChildLivingWith;
                updatewifedetail.SonLivingWith = model.WifeSonLivingWith;
                updatewifedetail.DaughterLivingWith = model.WifeDaughterLivingWith;
                ent.Entry(updatewifedetail).State = System.Data.Entity.EntityState.Modified;
            }

            var infdata = ent.tblDivorceDartaInformants.Where(x => x.DivorceId == updatedarta.DivorceId).SingleOrDefault();
            if (infdata != null)
            {
                infdata.DivorceInformantId = model.DivorceInformantId;
                infdata.DivorceId = model.DivorceId;
                infdata.InfNaamThar = model.InfNaamThar;
                infdata.InfFullName = model.InfFullName;
                infdata.InfState = model.InfState;
                infdata.InfDistrict = model.InfDistrict;
                infdata.InfPalika = model.InfPalika; infdata.InfWardNo = model.InfWardNo;
                infdata.InfGaunTole = model.InfGaunTole; infdata.InfGharNo = model.InfGharNo;
                infdata.InfNagariktaPraPaNo = model.InfNagariktaPraPaNo;
                infdata.InfNagariktaIssueDate = model.InfNagariktaIssueDate;
                infdata.InfNagariktaIssueDistrict = model.InfNagariktaIssueDistrict;
                infdata.InfPassportNo_Desh = model.InfPassportNo_Desh;
                infdata.Miti = model.Miti;
                ent.Entry(infdata).State = System.Data.Entity.EntityState.Modified;
            }

            ent.SaveChanges();
        }
    }
}