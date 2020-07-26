using Sifaris.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sifaris.Providers
{
    public class MrityuDartaProvider
    {
        SifarisEntities ent = new SifarisEntities();
        public void Insert(MrityuDartaModel model)
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
                MrityuDartaFaramNo = model.MrityuFaramDartaNo,
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
            objToSave.SifarisType = Utility.MrityuSifaris;
            ent.tblPanjikas.Add(objToSave);
            ent.SaveChanges();

            panjiId = objToSave.PanjikaId;
            var newrecord = new tblMrityuDarta()
            {
                PanjiId=panjiId,
                NaamThar=model.NaamThar,
                FullName=model.FullName,
                Gender=model.Gender,
                MrityuMiti=model.MrityuMiti,
                MrityuDate=Utility.GetRomanDate(model.MrityuMiti).ToString(),
                Age=model.Age,
                MrityuPradesh=model.MrityuPradesh,
                MrityuJilla=model.MrityuJilla,MrityuPalika=model.MrityuPalika,
                MrityuWardNo=model.MrityuWardNo,
                MrityuGaunTole=model.MrityuGaunTole,
                MrityuGharNo=model.MrityuGharNo,
                MrityuBhayekoSthaan=model.MrityuBhayekoSthaan
            };
            ent.tblMrityuDartas.Add(newrecord);
            ent.SaveChanges();

            var newdeathId = newrecord.NewDeathId;
           
                    var persondetail = new tblMrityuDartaPersonalDetail(){
                        NewDeathId = newdeathId,
                    JanmaDartaNo = model.JanmaDartaNo,
                    JanmaMiti = model.JanmaMiti,
                    JanmaDate = Utility.GetRomanDate(model.JanmaMiti).ToString(),
                    JanmaPradesh = model.JanmaPradesh,
                    JanmaJilla = model.JanmaJilla,
                    JanmaPalika = model.JanmaPalika,
                    JanmaWardNo = model.JanmaWardNo,
                    JanmaGaunTole = model.JanmaGaunTole,
                    JanmaGharNo = model.JanmaGharNo,
                    NagariktaPraPaNo = model.NagariktaPraPaNo,
                    NagariktaIsssueDate = model.NagariktaIsssueDate,
                    NagariktaIssueDistrict = model.NagariktaIssueDistrict,
                    PassportNo_Desh = model.PassportNo_Desh,
                    ShikshaSthar = model.ShikshaSthar,
                    MatriBhasa = model.MatriBhasa,
                    Dharma = model.Dharma,
                    JaatJaati = model.JaatJaati,
                    BajekoNaam = model.BajekoNaam,
                    Grandfather = model.Grandfather,
                    BabuNaam = model.BabuNaam,
                    FatherName = model.FatherName,
                    AamaNaam = model.AamaNaam,
                    MotherName = model.MotherName,
                    MaritalStatus = model.MaritalStatus,
                    SpouseNaam = model.SpouseNaam,
                    SpouseName = model.SpouseName,
                    MrityuKaran = model.MrityuKaran,
                    };
                    ent.tblMrityuDartaPersonalDetails.Add(persondetail);
                
           
                    var informant = new tblMrityuDartaInformant(){
                    NewdeathId = newdeathId,
                    InfNaamThar = model.InfNaamThar,
                    InfFullName = model.InfFullName,
                    InfRelationToNewDeath = model.InfRelationToNewDeath,
                    InfPradesh = model.InfPradesh,
                    InfJilla = model.InfJilla,
                    InfPalika = model.InfPalika, InfWardNo = model.InfWardNo,
                    InfGaunTole = model.InfGaunTole, InfGharNo = model.InfGharNo,
                    InfNagariktaPraPaNo = model.InfNagariktaPraPaNo,
                    InfNagariktaIssueDate = model.InfNagariktaIssueDate,
                    InfNagariktaIssueDistrict = model.InfNagariktaIssueDistrict,
                    InfPassportNo_Desh = model.InfPassportNo_Desh,
                    Miti = model.Miti
                    };
                    ent.tblMrityuDartaInformants.Add(informant);
                ent.SaveChanges();
            
        }
        public MrityuDartaModel GetMrityuDartaRecords(int WorkOfficeId,int?NewdeathId,int page,int pagesize)
        {
            
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            MrityuDartaModel model = (from newdeath in ent.tblMrityuDartas
                                      join person in ent.tblMrityuDartaPersonalDetails on newdeath.NewDeathId equals person.NewDeathId
                                      join panji in ent.tblPanjikas on newdeath.PanjiId equals panji.PanjikaId
                                      join informant in ent.tblMrityuDartaInformants on newdeath.NewDeathId equals informant.NewdeathId
                                      where newdeath.NewDeathId == NewdeathId && panji.FiscalYear==activefiscalyear && panji.WorkOffice==WorkOfficeId
                                      select new MrityuDartaModel
                                      {
                                          //panji
                                          PanjigarneId=panji.PanjikaId,
                                          PanjiState = panji.PanjiState,
                                          PanjiDistrict = panji.PanjiDistrict,
                                          PanjiPalika = panji.PanjiPalika,
                                          PanjiWardNo = panji.PanjiWardNo,
                                          PanjiName = panji.PanjiNaamThar,
                                          PanjiName_Eng = panji.PanjiFullName,
                                          Panji_INVId = panji.Panji_INVId,
                                          MrityuFaramDartaNo =(int) panji.MrityuDartaFaramNo,
                                          FaramDartaMiti = panji.FaramDartaMiti,
                                          PariwarLagatFaramNo = panji.PariwarLagatNo,
                                          FiscalYear=panji.FiscalYear,
                                          WorkOffice=panji.WorkOffice,
                                          //details
                                          NewDeathId = newdeath.NewDeathId,
                                          PanjiId=newdeath.PanjiId,
                                          NaamThar=newdeath.NaamThar,
                                          FullName = newdeath.FullName,
                                          Gender = newdeath.Gender,
                                          MrityuMiti = newdeath.MrityuMiti,
                                          Age = newdeath.Age,
                                          MrityuPradesh = newdeath.MrityuPradesh,
                                          MrityuJilla = newdeath.MrityuJilla,
                                          MrityuPalika = newdeath.MrityuPalika,
                                          MrityuWardNo = newdeath.MrityuWardNo,
                                          MrityuGaunTole = newdeath.MrityuGaunTole,
                                          MrityuGharNo = newdeath.MrityuGharNo,
                                          MrityuBhayekoSthaan = newdeath.MrityuBhayekoSthaan,

                                          
                                          //personaldetails
                                          NewDeathDetailsId=person.NewDeathDetailsId,
                        MapPersonNewDeathId =person.NewDeathId,
                        JanmaDartaNo = person.JanmaDartaNo,
                        JanmaMiti = person.JanmaMiti,
                        JanmaPradesh = person.JanmaPradesh,
                        JanmaJilla = person.JanmaJilla,
                        JanmaPalika = person.JanmaPalika,
                        JanmaWardNo = person.JanmaWardNo,
                        JanmaGaunTole = person.JanmaGaunTole,
                        JanmaGharNo = person.JanmaGharNo,
                        NagariktaPraPaNo = person.NagariktaPraPaNo,
                        NagariktaIsssueDate = person.NagariktaIsssueDate,
                        NagariktaIssueDistrict = person.NagariktaIssueDistrict,
                        PassportNo_Desh = person.PassportNo_Desh,
                        ShikshaSthar = person.ShikshaSthar,
                        MatriBhasa = person.MatriBhasa,
                        Dharma = person.Dharma,
                        JaatJaati = person.JaatJaati,
                        BajekoNaam = person.BajekoNaam,
                        Grandfather = person.Grandfather,
                        BabuNaam = person.BabuNaam,
                        FatherName = person.FatherName,
                        AamaNaam = person.AamaNaam,
                        MotherName = person.MotherName,
                        MaritalStatus = (bool)person.MaritalStatus,
                        SpouseNaam = person.SpouseNaam,
                        SpouseName = person.SpouseName,
                        MrityuKaran = person.MrityuKaran,

            //informant
                        NewDeathInformantId = informant.NewDeathInformantId,
                        MapInformantNewdeathId = informant.NewdeathId,
                        InfNaamThar = informant.InfNaamThar,
                        InfFullName = informant.InfFullName,
                        InfRelationToNewDeath = informant.InfRelationToNewDeath,
                        InfPradesh = informant.InfPradesh,
                        InfJilla = informant.InfJilla,
                        InfPalika = informant.InfPalika, InfWardNo = informant.InfWardNo,
                        InfGaunTole = informant.InfGaunTole, InfGharNo = informant.InfGharNo,
                        InfNagariktaPraPaNo = informant.InfNagariktaPraPaNo,
                        InfNagariktaIssueDate = informant.InfNagariktaIssueDate,
                        InfNagariktaIssueDistrict = informant.InfNagariktaIssueDistrict,
                        InfPassportNo_Desh = informant.InfPassportNo_Desh,
                        Miti = informant.Miti
                        }).SingleOrDefault();
                     
            return model;
        }
        public List<MrityuDartaModel> GetMrityuDartaRecordsList(int WarehouseId, int? NewdeathId, int page, int pagesize)
        {
            
            var model=new List<MrityuDartaModel>();
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            model = (from newdeath in ent.tblMrityuDartas
                     join person in ent.tblMrityuDartaPersonalDetails on newdeath.NewDeathId equals person.NewDeathId
                     join panji in ent.tblPanjikas on newdeath.PanjiId equals panji.PanjikaId
                     where panji.FiscalYear==activefiscalyear
                     select new MrityuDartaModel { 
                     NewDeathId=newdeath.NewDeathId,
                     NaamThar=newdeath.NaamThar,
                     MrityuMiti=newdeath.MrityuMiti,
                     JanmaMiti=person.JanmaMiti,
                     MrityuFaramDartaNo=(int)panji.MrityuDartaFaramNo
                     }).ToList();
            return model;
        }
        public void Update(MrityuDartaModel model)
        {
            var updatedarta = ent.tblMrityuDartas.Where(x => x.NewDeathId == model.NewDeathId).SingleOrDefault();
            updatedarta.NewDeathId=model.NewDeathId;  
                updatedarta.PanjiId=model.PanjiId;
                updatedarta.NaamThar=model.NaamThar;
                updatedarta.FullName=model.FullName;
                updatedarta.Gender=model.Gender;
                updatedarta.MrityuMiti=model.MrityuMiti;
                updatedarta.MrityuDate = Utility.GetRomanDate(model.MrityuMiti).ToString();
                updatedarta.Age=model.Age;
                updatedarta.MrityuPradesh=model.MrityuPradesh;
                updatedarta.MrityuJilla = model.MrityuJilla; updatedarta.MrityuPalika = model.MrityuPalika;
                updatedarta.MrityuWardNo=model.MrityuWardNo;
                updatedarta.MrityuGaunTole=model.MrityuGaunTole;
                updatedarta.MrityuGharNo=model.MrityuGharNo;
                updatedarta.MrityuBhayekoSthaan=model.MrityuBhayekoSthaan;
                ent.Entry(updatedarta).State = System.Data.Entity.EntityState.Modified;

                var updatePanji = ent.tblPanjikas.Where(x => x.PanjikaId == updatedarta.PanjiId).SingleOrDefault();
                updatePanji.PanjiState = model.PanjiState;
                updatePanji.PanjiDistrict = model.PanjiDistrict;
                updatePanji.PanjiPalika = model.PanjiPalika;
                updatePanji.PanjiWardNo = model.PanjiWardNo;
                updatePanji.PanjiNaamThar = model.PanjiName;
                updatePanji.PanjiFullName = model.PanjiName_Eng;
                updatePanji.Panji_INVId = model.Panji_INVId;
                updatePanji.MrityuDartaFaramNo = model.MrityuFaramDartaNo;
                updatePanji.FaramDartaMiti = model.FaramDartaMiti;
                updatePanji.FaramDartaDate = Utility.GetRomanDate(model.FaramDartaDate).ToString();
                updatePanji.PariwarLagatNo = model.PariwarLagatFaramNo;
                //updatePanji.UpdatedBy = Utility.GetCurrentLoginUser();
                updatePanji.UpdatedBy = 1;
                updatePanji.UpdatedDate = DateTime.Now.ToShortDateString().ToString();
                ent.Entry(updatePanji).State = System.Data.Entity.EntityState.Modified;
               
                    var updatedartadetail = ent.tblMrityuDartaPersonalDetails.Where(x => x.NewDeathId == updatedarta.NewDeathId).SingleOrDefault();
                    if (updatedartadetail!=null)
                    {
                    updatedartadetail.NewDeathId = model.NewDeathId;
                    updatedartadetail.JanmaDartaNo = model.JanmaDartaNo;
                    updatedartadetail.JanmaMiti = model.JanmaMiti;
                    updatedartadetail.JanmaDate = Utility.GetRomanDate(model.JanmaMiti).ToString();
                    updatedartadetail.JanmaPradesh = model.JanmaPradesh;
                    updatedartadetail.JanmaJilla = model.JanmaJilla;
                    updatedartadetail.JanmaPalika = model.JanmaPalika;
                    updatedartadetail.JanmaWardNo = model.JanmaWardNo;
                    updatedartadetail.JanmaGaunTole = model.JanmaGaunTole;
                    updatedartadetail.JanmaGharNo = model.JanmaGharNo;
                    updatedartadetail.NagariktaPraPaNo = model.NagariktaPraPaNo;
                    updatedartadetail.NagariktaIsssueDate = model.NagariktaIsssueDate;
                    updatedartadetail.NagariktaIssueDistrict = model.NagariktaIssueDistrict;
                    updatedartadetail.PassportNo_Desh = model.PassportNo_Desh;
                    updatedartadetail.ShikshaSthar = model.ShikshaSthar;
                    updatedartadetail.MatriBhasa = model.MatriBhasa;
                    updatedartadetail.Dharma = model.Dharma;
                    updatedartadetail.JaatJaati = model.JaatJaati;
                    updatedartadetail.BajekoNaam = model.BajekoNaam;
                    updatedartadetail.Grandfather = model.Grandfather;
                    updatedartadetail.BabuNaam = model.BabuNaam;
                    updatedartadetail.FatherName = model.FatherName;
                    updatedartadetail.AamaNaam = model.AamaNaam;
                    updatedartadetail.MotherName = model.MotherName;
                    updatedartadetail.MaritalStatus = model.MaritalStatus;
                    updatedartadetail.SpouseNaam = model.SpouseNaam;
                    updatedartadetail.SpouseName = model.SpouseName;
                    updatedartadetail.MrityuKaran = model.MrityuKaran;
                    ent.Entry(updatedartadetail).State = System.Data.Entity.EntityState.Modified;
                    }

                 var infdata = ent.tblMrityuDartaInformants.Where(x => x.NewdeathId == updatedarta.NewDeathId).SingleOrDefault();
                    if (infdata != null)
                    {
                        infdata.NewDeathInformantId = model.NewDeathInformantId;
                        infdata.NewdeathId = model.NewDeathId;
                        infdata.InfNaamThar = model.InfNaamThar;
                        infdata.InfFullName = model.InfFullName;
                        infdata.InfRelationToNewDeath = model.InfRelationToNewDeath;
                        infdata.InfPradesh = model.InfPradesh;
                        infdata.InfJilla = model.InfJilla;
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
        public List<MrityuDartaModel> GetSearchList(int? faramno, int? fiscalyear)
        {
            var model = new List<MrityuDartaModel>();
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            var activeyear = 0;
            if (fiscalyear != null)
            {
                activeyear = (int)fiscalyear;
            }
            else { activeyear = activefiscalyear; }
            model = (from newdeath in ent.tblMrityuDartas
                     join person in ent.tblMrityuDartaPersonalDetails on newdeath.NewDeathId equals person.NewDeathId
                     join panji in ent.tblPanjikas on newdeath.PanjiId equals panji.PanjikaId
                     where panji.FiscalYear == activefiscalyear
                     select new MrityuDartaModel
                     {
                         NewDeathId = newdeath.NewDeathId,
                         NaamThar = newdeath.NaamThar,
                         MrityuMiti = newdeath.MrityuMiti,
                         JanmaMiti = person.JanmaMiti,
                         FaramNo=panji.MrityuDartaFaramNo,

                     }).ToList();

            if (faramno != null)
            {
                model = model.Where(x => x.FaramNo == faramno).ToList();
            }

            return model;
        }
    }
}