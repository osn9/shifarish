using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SIFARIS.Areas.Darta.Models;

namespace SIFARIS.Areas.Darta.Provider
{
    public class BasaisaraiDartaProvider
    {
        SifarishEntities ent = new SifarishEntities();
        public int Insert(BasaisaraiDartaModel model)
        {
            var activeFiscalYearId = ent.tblFiscalYears.FirstOrDefault(x => x.IsActive).FiscalYearId;
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
                MigrationDartaFaramNo = model.BasaisaraiFaramDartaNo,
                FaramDartaMiti = model.FaramDartaMiti,
                FaramDartaDate = Utility.GetRomanDate(model.FaramDartaMiti).ToString(),
                PariwarLagatNo = model.PariwarLagatFaramNo
            };
            objToSave.FiscalYear = activeFiscalYearId;
            //objToSave.WorkOffice = currentloginworkOffice;
            objToSave.WorkOffice = 1;
            //objToSave.CreatedBy = Utility.GetCurrentLoginUser();
            objToSave.CreatedBy = 1;
            objToSave.CreatedDate = DateTime.Now.ToShortDateString().ToString();
            objToSave.SifarisType = Utility.BasaisaraiSifaris;
            ent.tblPanjikas.Add(objToSave);
            ent.SaveChanges();

            panjiId = objToSave.PanjikaId;
            var newrecord = new tblBasaisaraiDarta()
            {
                PanjiId = panjiId,
                GharMuliNaamThar = model.GharMuliNaamThar,
                GharMuliFullName = model.GharMuliFullName,
                BasaisaraiAayekoDartaNo = model.BasaisaraiAayekoDartaNo,
                BasaisaraiAayekoPradesh = model.BasaisaraiAayekoPradesh,
                BasaisaraiAayekoJilla = model.BasaisaraiAayekoJilla,
                BasaisaraiAayekoPalika = model.BasaisaraiAayekoPalika,
                BasaisaraiAayekoWardNo = model.BasaisaraiAayekoWardNo,
                BasaisaraiAayekoGharNo = model.BasaisaraiAayekoGharNo,
                BasaisaraiAayekoGaunTole = model.BasaisaraiAayekoGaunTole,
                BasaisaraiAayekoMiti = model.BasaisaraiAayekoMiti,
                BasaisaraiAayekoDate = Utility.GetRomanDate(model.BasaisaraiAayekoMiti).ToString(),
                BasaisaraiAayekoKaran = model.BasaisaraiAayekoKaran,

                BasaisaraiJanePradesh = model.BasaisaraiJanePradesh,
                BasaisaraiJaneJilla = model.BasaisaraiJaneJilla,
                BasaisaraiJanePalika = model.BasaisaraiJanePalika,
                BasaisaraiJaneWardNo = model.BasaisaraiJaneWardNo,
                BasaisaraiJaneGharNo = model.BasaisaraiJaneGharNo,
                BasaisaraiJaneGaunTole = model.BasaisaraiJaneGaunTole
            };
            ent.tblBasaisaraiDartas.Add(newrecord);
            ent.SaveChanges();
            var newmigrantid = newrecord.NewMigrationId;
            foreach (var item in model.BasaisaraiPersonalDetailsModelList)
            {
                var objtosavedetails = new tblBasaisaraiPersonalDetail()
                {
                    NewMigrationId = newmigrantid,
                    JanmaDartaNo = item.JanmaDartaNo,
                    NaamThar = item.NaamThar,
                    FullName = item.FullName,
                    JanmaMiti = item.JanmaMiti,
                    JanmaDate = Utility.GetRomanDate(item.JanmaMiti).ToString(),
                    JanmaPradesh = item.JanmaPradesh,
                    JanmaJilla = item.JanmaJilla,
                    JanmaPalika = item.JanmaPalika,
                    JanmaWardNo = item.JanmaWardNo,
                    Gender = item.Gender,
                    NagariktaPraPaNo = item.NagariktaPraPaNo,
                    NagaritaIssueDate = item.NagaritaIssueDate,
                    NagariktaIssueDistrict = item.NagariktaIssueDistrict,
                    AnyRecords = item.AnyRecords,
                    RelationTo = item.RelationTo
                };
                ent.tblBasaisaraiPersonalDetails.Add(objtosavedetails);
                ent.SaveChanges();
                model.NewMigrationId = objtosavedetails.NewMigrationId;
            }
            var informant = new tblBasaisaraiDartaInformant()
            {
                NewMigrationId = newmigrantid,
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
            ent.tblBasaisaraiDartaInformants.Add(informant);
            ent.SaveChanges();

            return newrecord.NewMigrationId;
        }
        public List<BasaisaraiDartaModel> GetBasaisaaraiDartaRecordsList(int WorkOfficeId, int? NewMigrationId, int page, int Pagesize)
        {
            var collection = new List<tblBasaisaraiDarta>();
            if (NewMigrationId != null)
            {
                collection = ent.tblBasaisaraiDartas.Where(x => x.tblPanjika.WorkOffice == WorkOfficeId && x.NewMigrationId == NewMigrationId).OrderByDescending(x => x.NewMigrationId).ToList();
            }
            else
            {
                collection = ent.tblBasaisaraiDartas.Where(x => x.tblPanjika.WorkOffice == WorkOfficeId).OrderByDescending(x => x.NewMigrationId).Skip((page - 1) * Pagesize).Take(Pagesize).ToList();
            }
            var model = new List<BasaisaraiDartaModel>();
            foreach (var item in collection)
            {
                var data = new BasaisaraiDartaModel()
                {
                    NewMigrationId = item.NewMigrationId,
                    PanjiId = item.PanjiId,
                    GharMuliNaamThar = item.GharMuliNaamThar,
                    GharMuliFullName = item.GharMuliFullName,
                    BasaisaraiAayekoDartaNo = item.BasaisaraiAayekoDartaNo,
                    BasaisaraiAayekoPradesh = item.BasaisaraiAayekoPradesh,
                    BasaisaraiAayekoJilla = item.BasaisaraiAayekoJilla,
                    BasaisaraiAayekoPalika = item.BasaisaraiAayekoPalika,
                    BasaisaraiAayekoWardNo = item.BasaisaraiAayekoWardNo,
                    BasaisaraiAayekoGharNo = item.BasaisaraiAayekoGharNo,
                    BasaisaraiAayekoGaunTole = item.BasaisaraiAayekoGaunTole,
                    BasaisaraiAayekoMiti = item.BasaisaraiAayekoMiti,
                    BasaisaraiAayekoDate = Utility.GetRomanDate(item.BasaisaraiAayekoMiti).ToString(),
                    BasaisaraiAayekoKaran = item.BasaisaraiAayekoKaran,

                    BasaisaraiJanePradesh = item.BasaisaraiJanePradesh,
                    BasaisaraiJaneJilla = item.BasaisaraiJaneJilla,
                    BasaisaraiJanePalika = item.BasaisaraiJanePalika,
                    BasaisaraiJaneWardNo = item.BasaisaraiJaneWardNo,
                    BasaisaraiJaneGharNo = item.BasaisaraiJaneGharNo,
                    BasaisaraiJaneGaunTole = item.BasaisaraiJaneGaunTole,

                    PanjigarneId = item.tblPanjika.PanjikaId,
                    PanjiState = item.tblPanjika.PanjiState,
                    PanjiDistrict = item.tblPanjika.PanjiDistrict,
                    PanjiPalika = item.tblPanjika.PanjiPalika,
                    PanjiWardNo = item.tblPanjika.PanjiWardNo,
                    PanjiName = item.tblPanjika.PanjiNaamThar,
                    PanjiName_Eng = item.tblPanjika.PanjiFullName,
                    Panji_INVId = item.tblPanjika.Panji_INVId,
                    BasaisaraiFaramDartaNo = (int)item.tblPanjika.MigrationDartaFaramNo,
                    FaramDartaMiti = item.tblPanjika.FaramDartaMiti,
                    FaramaDartaDate = Utility.GetRomanDate(item.tblPanjika.FaramDartaMiti).ToString(),
                    PariwarLagatFaramNo = item.tblPanjika.PariwarLagatNo,
                };

                if (item.tblBasaisaraiPersonalDetails.Any())
                {
                    foreach (var personalItem in item.tblBasaisaraiPersonalDetails)
                    {
                        BasaisaraiPersonalDetailsModel person = new BasaisaraiPersonalDetailsModel();
                        person.MapPersonNewMigrationId = personalItem.NewMigrationId;
                        person.JanmaDartaNo = personalItem.JanmaDartaNo;
                        person.NaamThar = personalItem.NaamThar;
                        person.FullName = personalItem.FullName;
                        person.JanmaMiti = personalItem.JanmaMiti;
                        person.JanmaDate = Utility.GetRomanDate(personalItem.JanmaMiti).ToString();
                        person.JanmaPradesh = personalItem.JanmaPradesh;
                        person.JanmaJilla = personalItem.JanmaJilla;
                        person.JanmaPalika = personalItem.JanmaPalika;
                        person.JanmaWardNo = personalItem.JanmaWardNo;
                        person.Gender = personalItem.Gender;
                        person.NagariktaPraPaNo = personalItem.NagariktaPraPaNo;
                        person.NagaritaIssueDate = personalItem.NagaritaIssueDate;
                        person.NagariktaIssueDistrict = personalItem.NagariktaIssueDistrict;
                        person.AnyRecords = personalItem.AnyRecords;
                        person.RelationTo = personalItem.RelationTo;

                        data.BasaisaraiPersonalDetailsModelList.Add(person);
                    }
                }
                model.Add(data);
            }
            return model;
        }
        public BasaisaraiDartaModel GetBasaisaraiDartaRecords(int WorkOfficeId, int? NewMigrationId, int page, int Pagesize)
        {
            BasaisaraiDartaModel model = new BasaisaraiDartaModel();
            var fiscalyearid = Utility.GetCurrentFisicalYear();
            var qlist = ent.tblBasaisaraiDartas.Where(x => x.tblPanjika.FiscalYear == fiscalyearid);
            var collection = new List<tblBasaisaraiDarta>();
            model.BasaisaraiDartaModelList = new List<BasaisaraiDartaModel>();
            if (NewMigrationId != null)
            {
                collection = ent.tblBasaisaraiDartas.Where(x => x.tblPanjika.WorkOffice == WorkOfficeId && x.NewMigrationId == NewMigrationId).OrderByDescending(x => x.NewMigrationId).ToList();
            }
            else
            {
                if (page > 0)
                {
                    collection = qlist.OrderByDescending(x => x.NewMigrationId).Skip((page - 1) * Pagesize).Take(Pagesize).ToList();
                }
                else
                {
                    collection = qlist.OrderByDescending(x => x.NewMigrationId).ToList();
                }
            }
            foreach (var item in collection)
            {
                var data = new BasaisaraiDartaModel()
                {
                    NewMigrationId = item.NewMigrationId,
                    GharMuliNaamThar = item.GharMuliNaamThar,
                    GharMuliFullName = item.GharMuliFullName,
                    BasaisaraiAayekoDartaNo = item.BasaisaraiAayekoDartaNo,
                    BasaisaraiAayekoPradesh = item.BasaisaraiAayekoPradesh,
                    BasaisaraiAayekoJilla = item.BasaisaraiAayekoJilla,
                    BasaisaraiAayekoPalika = item.BasaisaraiAayekoPalika,
                    BasaisaraiAayekoWardNo = item.BasaisaraiAayekoWardNo,
                    BasaisaraiAayekoGharNo = item.BasaisaraiAayekoGharNo,
                    BasaisaraiAayekoGaunTole = item.BasaisaraiAayekoGaunTole,
                    BasaisaraiAayekoMiti = item.BasaisaraiAayekoMiti,
                    BasaisaraiAayekoDate = Utility.GetRomanDate(item.BasaisaraiAayekoMiti).ToString(),
                    BasaisaraiAayekoKaran = item.BasaisaraiAayekoKaran,

                    BasaisaraiJanePradesh = item.BasaisaraiJanePradesh,
                    BasaisaraiJaneJilla = item.BasaisaraiJaneJilla,
                    BasaisaraiJanePalika = item.BasaisaraiJanePalika,
                    BasaisaraiJaneWardNo = item.BasaisaraiJaneWardNo,
                    BasaisaraiJaneGharNo = item.BasaisaraiJaneGharNo,
                    BasaisaraiJaneGaunTole = item.BasaisaraiJaneGaunTole,

                    PanjigarneId = item.tblPanjika.PanjikaId,
                    PanjiState = item.tblPanjika.PanjiState,
                    PanjiDistrict = item.tblPanjika.PanjiDistrict,
                    PanjiPalika = item.tblPanjika.PanjiPalika,
                    PanjiWardNo = item.tblPanjika.PanjiWardNo,
                    PanjiName = item.tblPanjika.PanjiNaamThar,
                    PanjiName_Eng = item.tblPanjika.PanjiFullName,
                    Panji_INVId = item.tblPanjika.Panji_INVId,
                    BasaisaraiFaramDartaNo = (int)item.tblPanjika.MigrationDartaFaramNo,
                    FaramDartaMiti = item.tblPanjika.FaramDartaMiti,
                    FaramaDartaDate = Utility.GetRomanDate(item.tblPanjika.FaramDartaMiti).ToString(),
                    PariwarLagatFaramNo = item.tblPanjika.PariwarLagatNo,
                };
                if (item.tblBasaisaraiPersonalDetails.Any())
                {
                    foreach (var personalItem in item.tblBasaisaraiPersonalDetails)
                    {
                        BasaisaraiPersonalDetailsModel person = new BasaisaraiPersonalDetailsModel();
                        person.MapPersonNewMigrationId = personalItem.NewMigrationId;
                        person.JanmaDartaNo = personalItem.JanmaDartaNo;
                        person.NaamThar = personalItem.NaamThar;
                        person.FullName = personalItem.FullName;
                        person.JanmaMiti = personalItem.JanmaMiti;
                        person.JanmaDate = Utility.GetRomanDate(personalItem.JanmaMiti).ToString();
                        person.JanmaPradesh = personalItem.JanmaPradesh;
                        person.JanmaJilla = personalItem.JanmaJilla;
                        person.JanmaPalika = personalItem.JanmaPalika;
                        person.JanmaWardNo = personalItem.JanmaWardNo;
                        person.Gender = personalItem.Gender;
                        person.NagariktaPraPaNo = personalItem.NagariktaPraPaNo;
                        person.NagaritaIssueDate = personalItem.NagaritaIssueDate;
                        person.NagariktaIssueDistrict = personalItem.NagariktaIssueDistrict;
                        person.AnyRecords = personalItem.AnyRecords;
                        person.RelationTo = personalItem.RelationTo;

                        data.BasaisaraiPersonalDetailsModelList.Add(person);
                    }
                }
                model.BasaisaraiDartaModelList.Add(data);
            }
            return model;

        }
        public int Update(BasaisaraiDartaModel model)
        {
            //details
            var objtoedit = ent.tblBasaisaraiDartas.Where(x => x.NewMigrationId == model.NewMigrationId).FirstOrDefault();
            objtoedit.PanjiId = model.PanjiId;
            objtoedit.GharMuliNaamThar = model.GharMuliNaamThar;
            objtoedit.GharMuliFullName = model.GharMuliFullName;
            objtoedit.BasaisaraiAayekoDartaNo = model.BasaisaraiAayekoDartaNo;
            objtoedit.BasaisaraiAayekoPradesh = model.BasaisaraiAayekoPradesh;
            objtoedit.BasaisaraiAayekoJilla = model.BasaisaraiAayekoJilla;
            objtoedit.BasaisaraiAayekoPalika = model.BasaisaraiAayekoPalika;
            objtoedit.BasaisaraiAayekoWardNo = model.BasaisaraiAayekoWardNo;
            objtoedit.BasaisaraiAayekoGharNo = model.BasaisaraiAayekoGharNo;
            objtoedit.BasaisaraiAayekoGaunTole = model.BasaisaraiAayekoGaunTole;
            objtoedit.BasaisaraiAayekoMiti = model.BasaisaraiAayekoMiti;
            objtoedit.BasaisaraiAayekoDate = Utility.GetRomanDate(model.BasaisaraiAayekoMiti).ToString();
            objtoedit.BasaisaraiAayekoKaran = model.BasaisaraiAayekoKaran;

            objtoedit.BasaisaraiJanePradesh = model.BasaisaraiJanePradesh;
            objtoedit.BasaisaraiJaneJilla = model.BasaisaraiJaneJilla;
            objtoedit.BasaisaraiJanePalika = model.BasaisaraiJanePalika;
            objtoedit.BasaisaraiJaneWardNo = model.BasaisaraiJaneWardNo;
            objtoedit.BasaisaraiJaneGharNo = model.BasaisaraiJaneGharNo;
            objtoedit.BasaisaraiJaneGaunTole = model.BasaisaraiJaneGaunTole;
            ent.Entry(objtoedit).State = System.Data.Entity.EntityState.Modified;
            //panji
            var updatePanji = ent.tblPanjikas.Where(x => x.PanjikaId == objtoedit.PanjiId).FirstOrDefault();
            updatePanji.PanjiState = model.PanjiState;
            updatePanji.PanjiDistrict = model.PanjiDistrict;
            updatePanji.PanjiPalika = model.PanjiPalika;
            updatePanji.PanjiWardNo = model.PanjiWardNo;
            updatePanji.PanjiNaamThar = model.PanjiName;
            updatePanji.PanjiFullName = model.PanjiName_Eng;
            updatePanji.Panji_INVId = model.Panji_INVId;
            updatePanji.MigrationDartaFaramNo = model.BasaisaraiFaramDartaNo;
            updatePanji.FaramDartaMiti = model.FaramDartaMiti;
            updatePanji.FaramDartaDate = Utility.GetRomanDate(model.FaramDartaMiti).ToString();
            updatePanji.PariwarLagatNo = model.PariwarLagatFaramNo;
            //updatePanji.UpdatedBy = Utility.GetCurrentLoginUser();
            updatePanji.UpdatedBy = 1;
            updatePanji.UpdatedDate = DateTime.Now.ToShortDateString().ToString();
            ent.Entry(updatePanji).State = System.Data.Entity.EntityState.Modified;

            // multi personaldetails
            var personid = model.BasaisaraiPersonalDetailsModelList.Select(y => y.BasaisaraiDetailsId).ToList();
            var itemfromdb = ent.tblBasaisaraiPersonalDetails.Where(x => x.NewMigrationId == model.NewMigrationId && (!personid.Contains(x.BasaisaraiDetailsId))).Select(x => x.BasaisaraiDetailsId).ToList();
            if (itemfromdb.Count > 0)
            {
                foreach (var item in itemfromdb)
                {
                    var itemToDelete = ent.tblBasaisaraiPersonalDetails.Find(item);
                    ent.tblBasaisaraiPersonalDetails.Remove(itemToDelete);
                }
            }

            foreach (var item in model.BasaisaraiPersonalDetailsModelList)
            {
                var objToEditItem = ent.tblBasaisaraiPersonalDetails.Where(x => x.BasaisaraiDetailsId == item.BasaisaraiDetailsId).FirstOrDefault();
                if (objToEditItem != null)
                {
                    objToEditItem.NewMigrationId = model.NewMigrationId;
                    objToEditItem.JanmaDartaNo = item.JanmaDartaNo;
                    objToEditItem.NaamThar = item.NaamThar;
                    objToEditItem.FullName = item.FullName;
                    objToEditItem.JanmaMiti = item.JanmaMiti;
                    objToEditItem.JanmaDate = Utility.GetRomanDate(item.JanmaMiti).ToString();
                    objToEditItem.JanmaPradesh = item.JanmaPradesh;
                    objToEditItem.JanmaJilla = item.JanmaJilla;
                    objToEditItem.JanmaPalika = item.JanmaPalika;
                    objToEditItem.JanmaWardNo = item.JanmaWardNo;
                    objToEditItem.Gender = item.Gender;
                    objToEditItem.NagariktaPraPaNo = item.NagariktaPraPaNo;
                    objToEditItem.NagaritaIssueDate = item.NagaritaIssueDate;
                    objToEditItem.NagariktaIssueDistrict = item.NagariktaIssueDistrict;
                    objToEditItem.AnyRecords = item.AnyRecords;
                    objToEditItem.RelationTo = item.RelationTo;
                    ent.Entry(objToEditItem).State = System.Data.Entity.EntityState.Modified;
                }
                else
                {
                    var objTosaveItems = new tblBasaisaraiPersonalDetail()
                    {
                        NewMigrationId = model.NewMigrationId,
                        JanmaDartaNo = item.JanmaDartaNo,
                        NaamThar = item.NaamThar,
                        FullName = item.FullName,
                        JanmaMiti = item.JanmaMiti,
                        JanmaDate = Utility.GetRomanDate(item.JanmaMiti).ToString(),
                        JanmaPradesh = item.JanmaPradesh,
                        JanmaJilla = item.JanmaJilla,
                        JanmaPalika = item.JanmaPalika,
                        JanmaWardNo = item.JanmaWardNo,
                        Gender = item.Gender,
                        NagariktaPraPaNo = item.NagariktaPraPaNo,
                        NagaritaIssueDate = item.NagaritaIssueDate,
                        NagariktaIssueDistrict = item.NagariktaIssueDistrict,
                        AnyRecords = item.AnyRecords,
                        RelationTo = item.RelationTo
                    };
                    ent.tblBasaisaraiPersonalDetails.Add(objTosaveItems);
                }
            }
            ent.SaveChanges();
            //informant
            var infdata = ent.tblBasaisaraiDartaInformants.Where(x => x.NewMigrationId == model.NewMigrationId).SingleOrDefault();
            infdata.NewMigrationId = objtoedit.NewMigrationId;
            infdata.InfNaamThar = model.InfNaamThar;
            infdata.InfFullName = model.InfFullName;
            infdata.InfState = model.InfState;
            infdata.InfDistrict = model.InfDistrict;
            infdata.InfPalika = model.InfPalika;
            infdata.InfWardNo = model.InfWardNo;
            infdata.InfGaunTole = model.InfGaunTole;
            infdata.InfGharNo = model.InfGharNo;
            infdata.InfNagariktaPraPaNo = model.InfNagariktaPraPaNo;
            infdata.InfNagariktaIssueDate = model.InfNagariktaIssueDate;
            infdata.InfNagariktaIssueDistrict = model.InfNagariktaIssueDistrict;
            infdata.InfPassportNo_Desh = model.InfPassportNo_Desh;
            infdata.Miti = model.Miti;
            ent.Entry(infdata).State = System.Data.Entity.EntityState.Modified;
            ent.SaveChanges();

            return model.NewMigrationId;
        }
        public BasaisaraiDartaModel PopulateRecords(int WorkOfficeId, int? NewMigrationId)
        {
            BasaisaraiDartaModel result = (from a in ent.tblBasaisaraiDartas
                                           join c in ent.tblBasaisaraiDartaInformants on a.NewMigrationId equals c.NewMigrationId
                                           join d in ent.tblPanjikas on a.PanjiId equals d.PanjikaId
                                           where a.NewMigrationId == NewMigrationId && d.WorkOffice == WorkOfficeId
                                           select new BasaisaraiDartaModel
                                           {
                                               PanjigarneId = d.PanjikaId,
                                               PanjiState = d.PanjiState,
                                               PanjiDistrict = d.PanjiDistrict,
                                               PanjiPalika = d.PanjiPalika,
                                               PanjiWardNo = d.PanjiWardNo,
                                               PanjiName = d.PanjiNaamThar,
                                               PanjiName_Eng = d.PanjiFullName,
                                               Panji_INVId = d.Panji_INVId,
                                               BasaisaraiFaramDartaNo = (int)d.MigrationDartaFaramNo,
                                               FaramDartaMiti = d.FaramDartaMiti,
                                               PariwarLagatFaramNo = d.PariwarLagatNo,

                                               NewMigrationId = a.NewMigrationId,
                                               PanjiId = a.PanjiId,
                                               GharMuliNaamThar = a.GharMuliNaamThar,
                                               GharMuliFullName = a.GharMuliFullName,
                                               BasaisaraiAayekoDartaNo = a.BasaisaraiAayekoDartaNo,
                                               BasaisaraiAayekoPradesh = a.BasaisaraiAayekoPradesh,
                                               BasaisaraiAayekoJilla = a.BasaisaraiAayekoJilla,
                                               BasaisaraiAayekoPalika = a.BasaisaraiAayekoPalika,
                                               BasaisaraiAayekoWardNo = a.BasaisaraiAayekoWardNo,
                                               BasaisaraiAayekoGharNo = a.BasaisaraiAayekoGharNo,
                                               BasaisaraiAayekoGaunTole = a.BasaisaraiAayekoGaunTole,
                                               BasaisaraiAayekoMiti = a.BasaisaraiAayekoMiti,
                                               BasaisaraiAayekoKaran = a.BasaisaraiAayekoKaran,

                                               BasaisaraiJanePradesh = a.BasaisaraiJanePradesh,
                                               BasaisaraiJaneJilla = a.BasaisaraiJaneJilla,
                                               BasaisaraiJanePalika = a.BasaisaraiJanePalika,
                                               BasaisaraiJaneWardNo = a.BasaisaraiJaneWardNo,
                                               BasaisaraiJaneGharNo = a.BasaisaraiJaneGharNo,
                                               BasaisaraiJaneGaunTole = a.BasaisaraiJaneGaunTole,

                                               MapInformantNewMigrationId = c.NewMigrationId,
                                               InfNaamThar = c.InfNaamThar,
                                               InfFullName = c.InfFullName,
                                               InfState = c.InfState,
                                               InfDistrict = c.InfDistrict,
                                               InfPalika = c.InfPalika,
                                               InfWardNo = c.InfWardNo,
                                               InfGaunTole = c.InfGaunTole,
                                               InfGharNo = c.InfGharNo,
                                               InfNagariktaPraPaNo = c.InfNagariktaPraPaNo,
                                               InfNagariktaIssueDate = c.InfNagariktaIssueDate,
                                               InfNagariktaIssueDistrict = c.InfNagariktaIssueDistrict,
                                               InfPassportNo_Desh = c.InfPassportNo_Desh,
                                               Miti = c.Miti
                                           }).SingleOrDefault();
            //retrieving lists of personal details           
            var personlist = new List<BasaisaraiPersonalDetailsModel>();
            personlist = ent.tblBasaisaraiPersonalDetails.Where(x => x.NewMigrationId == NewMigrationId).Select(x => new BasaisaraiPersonalDetailsModel
            {
                MapPersonNewMigrationId = x.NewMigrationId,
                JanmaDartaNo = x.JanmaDartaNo,
                NaamThar = x.NaamThar,
                FullName = x.FullName,
                JanmaMiti = x.JanmaMiti,
                JanmaPradesh = x.JanmaPradesh,
                JanmaJilla = x.JanmaJilla,
                JanmaPalika = x.JanmaPalika,
                JanmaWardNo = x.JanmaWardNo,
                Gender = x.Gender,
                NagariktaPraPaNo = x.NagariktaPraPaNo,
                NagaritaIssueDate = x.NagaritaIssueDate,
                NagariktaIssueDistrict = x.NagariktaIssueDistrict,
                AnyRecords = x.AnyRecords,
                RelationTo = x.RelationTo
            }).ToList();
            result.BasaisaraiPersonalDetailsModelList = personlist;
            return result;
        }
        public List<BasaisaraiDartaModel> GetSearchList(int? faramno, int? fiscalyear)
        {
            var model = new List<BasaisaraiDartaModel>();
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            var activeyear = 0;
            if (fiscalyear != null)
            {
                activeyear = (int)fiscalyear;
            }
            else { activeyear = activefiscalyear; }
            model = (from a in ent.tblBasaisaraiDartas
                     join d in ent.tblPanjikas on a.PanjiId equals d.PanjikaId
                     where d.FiscalYear == activeyear
                     select new BasaisaraiDartaModel
                     {
                         FaramNo = d.MigrationDartaFaramNo,
                         GharMuliNaamThar = a.GharMuliNaamThar,
                         GharMuliFullName = a.GharMuliFullName,
                         BasaisaraiAayekoDartaNo = a.BasaisaraiAayekoDartaNo,
                         BasaisaraiAayekoPradesh = a.BasaisaraiAayekoPradesh,
                         BasaisaraiAayekoJilla = a.BasaisaraiAayekoJilla,
                         BasaisaraiAayekoPalika = a.BasaisaraiAayekoPalika,
                         BasaisaraiAayekoWardNo = a.BasaisaraiAayekoWardNo,
                         BasaisaraiJanePradesh = a.BasaisaraiJanePradesh,
                         BasaisaraiJaneJilla = a.BasaisaraiJaneJilla,
                         BasaisaraiJanePalika = a.BasaisaraiJanePalika,
                         BasaisaraiJaneWardNo = a.BasaisaraiJaneWardNo,
                     }).ToList();

            if (faramno != null)
            {
                model = model.Where(x => x.FaramNo == faramno).ToList();
            }

            return model;
        }
    }
}