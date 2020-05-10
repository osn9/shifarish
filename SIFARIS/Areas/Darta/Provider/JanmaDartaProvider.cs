using SIFARIS.Areas.JanmaDarta.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.JanmaDarta.Provider
{
    public class JanmaDartaProvider
    {
        SifarishEntities ent = new SifarishEntities();
        public void Insert(JanmaDartaModel model)
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
                JanmaDartaFaramNo = model.JanmaFaramDartaNo,
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
            objToSave.SifarisType = Utility.JanmaSifaris;
            ent.tblPanjikas.Add(objToSave);
            ent.SaveChanges();

            panjiId = objToSave.PanjikaId;
            var newrecord = new tblJanmaDarta()
            {
                PanjiId = panjiId,
                NewbornNaam = model.NewbornNaam,
                NewbornName = model.NewbornName,
                JanmaMiti = model.JanmaMiti,
                JanmaDate = Utility.GetRomanDate(model.JanmaMiti).ToString(),
                JanmaSthaan = model.JanmaSthaan,
                JanmadaMadatt = model.JanmadaMadatt,
                Gender = model.Gender,
                JanmaJaatJati = model.JanmaJaatJati,
                JanmaKisim = model.JanmaKisim,
                JanmaPradesh = model.JanmaPradesh,
                JanmaJilla = model.JanmaJilla,
                JanmaPalika = model.JanmaPalika,
                JanmaWardNo = model.JanmaWardNo,
                JanmaBidesh = model.JanmaBidesh,
                JanmaForeign = model.JanmaForeign,
                BajekoNaam = model.BajekoNaam,
                GrandFather = model.GrandFather

            };
            ent.tblJanmaDartas.Add(newrecord);
            ent.SaveChanges();

            var newbornid = newrecord.NewbornId;

            var fatherrecord = new tblJanmaDartaFatherDetail()
            {
                NewbornId = newbornid,
                NaamThar = model.FatherNaamThar,
                FullName = model.FatherFullName,
                PermaState = model.FatherPermaState,
                PermaDistrict = model.FatherPermaDistrict,
                PermaPalika = model.FatherPermaPalika,
                PermaWardNo = model.FatherPermaWardNo,
                GaunTole = model.FatherGaunTole,
                GharNo = model.FatherGharNo,
                SisuJanmidakoUmer = model.FatherSisuJanmidakoUmer,
                JanmaDesh = model.FatherJanmaDesh,
                NagariktaLiyekoDesh = model.FatherNagariktaLiyekoDesh,
                NagariktaPraPaNo = model.FatherNagariktaPraPaNo,
                NagariktaIssueDate = model.FatherNagariktaIssueDate,
                NagariktaIsssueDistrict = model.FatherNagariktaIsssueDistrict,
                PassportNo_Desh = model.FatherPassportNo_Desh,
                ShikshaSthar = model.FatherShikshaSthar,
                Pesha = model.FatherPesha,
                Dharma = model.FatherDharma,
                MatriBhasa = model.FatherMatriBhasa,
                TotalChild = model.TotalChild,
                TotalLiveChild = model.TotalLiveChild,
                VivahDartaNo = model.VivahDartaNo,
                VivahMiti = model.VivahMiti,
                VivahDate = Utility.GetRomanDate(model.VivahMiti).ToString()
            };

            ent.tblJanmaDartaFatherDetails.Add(fatherrecord);

            var motherrecord = new tblJanmaDartaMotherDetail
            {

                NewbornId = newbornid,
                NaamThar = model.MotherNaamThar,
                FullName = model.MotherFullName,
                PermaState = model.MotherPermaState,
                PermaDistrict = model.MotherPermaDistrict,
                PermaPalika = model.MotherPermaPalika,
                PermaWardNo = model.MotherPermaWardNo,
                GaunTole = model.MotherGaunTole,
                GharNo = model.MotherGharNo,
                SisuJanmidakoUmer = model.MotherSisuJanmidakoUmer,
                JanmaDesh = model.MotherJanmaDesh,
                NagariktaLiyekoDesh = model.MotherNagariktaLiyekoDesh,
                NagariktaPraPaNo = model.MotherNagariktaPraPaNo,
                NagariktaIssueDate = model.MotherNagariktaIssueDate,
                NagariktaIssueDistrict = model.MotherNagariktaIssueDistrict,
                PassportNo_Desh = model.MotherPassportNo_Desh,
                ShikshaSthar = model.MotherShikshaSthar,
                Pesha = model.MotherPesha,
                Dharma = model.MotherDharma,
                MatriBhasa = model.MotherMatriBhasa
            };
            ent.tblJanmaDartaMotherDetails.Add(motherrecord);

            var informant = new tblJanmaDartaInformant()
            {
                NewbornId = newbornid,
                InfNaamThar = model.InfNaamThar,
                InfFullName = model.InfFullName,
                InfRelationToNewBorn = model.InfRelationToNewBorn,
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
            ent.tblJanmaDartaInformants.Add(informant);

            ent.SaveChanges();
        }
        public JanmaDartaModel GetJanmaDartaRecords(int WorkOfficeId, int? NewbornId, int page, int pagesize)
        {
            //JanmaDartaModel model = new JanmaDartaModel();
            var activefiscalyear = Utility.GetCurrentFisicalYear();

            JanmaDartaModel data = (from newborn in ent.tblJanmaDartas
                                    join father in ent.tblJanmaDartaFatherDetails on newborn.NewbornId equals father.NewbornId
                                    join mother in ent.tblJanmaDartaMotherDetails on newborn.NewbornId equals mother.NewbornId
                                    join panji in ent.tblPanjikas on newborn.PanjiId equals panji.PanjikaId
                                    join informant in ent.tblJanmaDartaInformants on newborn.NewbornId equals informant.NewbornId
                                    where newborn.NewbornId == NewbornId && panji.WorkOffice == WorkOfficeId && panji.FiscalYear == activefiscalyear
                                    select new JanmaDartaModel
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
                                        JanmaFaramDartaNo = (int)panji.JanmaDartaFaramNo,
                                        FaramDartaMiti = panji.FaramDartaMiti,
                                        PariwarLagatFaramNo = panji.PariwarLagatNo,
                                        FiscalYear = panji.FiscalYear,
                                        WorkOffice = panji.WorkOffice,
                                        //janmadarta
                                        NewbornId = newborn.NewbornId,
                                        PanjiId = newborn.PanjiId,
                                        NewbornNaam = newborn.NewbornNaam,
                                        NewbornName = newborn.NewbornName,
                                        JanmaMiti = newborn.JanmaMiti,
                                        JanmaDate = newborn.JanmaDate,
                                        JanmaSthaan = newborn.JanmaSthaan,
                                        JanmadaMadatt = newborn.JanmadaMadatt,
                                        Gender = newborn.Gender,
                                        JanmaKisim = newborn.JanmaKisim,
                                        JanmaJaatJati = newborn.JanmaJaatJati,
                                        JanmaPradesh = newborn.JanmaPradesh,
                                        JanmaJilla = newborn.JanmaJilla,
                                        JanmaPalika = newborn.JanmaPalika,
                                        JanmaWardNo = newborn.JanmaWardNo,
                                        JanmaBidesh = newborn.JanmaBidesh,
                                        JanmaForeign = newborn.JanmaForeign,
                                        BajekoNaam = newborn.BajekoNaam,
                                        GrandFather = newborn.GrandFather,
                                        //fatherdetail
                                        NewbornFatherId = father.NewbornFatherId,
                                        MapFatherNewbornId = father.NewbornId,
                                        FatherNaamThar = father.NaamThar,
                                        FatherFullName = father.FullName,
                                        FatherPermaState = father.PermaState,
                                        FatherPermaDistrict = father.PermaDistrict,
                                        FatherPermaPalika = father.PermaPalika,
                                        FatherPermaWardNo = father.PermaWardNo,
                                        FatherGaunTole = father.GaunTole,
                                        FatherGharNo = father.GharNo,
                                        FatherSisuJanmidakoUmer = father.SisuJanmidakoUmer,
                                        FatherJanmaDesh = father.JanmaDesh,
                                        FatherNagariktaLiyekoDesh = father.NagariktaLiyekoDesh,
                                        FatherNagariktaPraPaNo = father.NagariktaPraPaNo,
                                        FatherNagariktaIssueDate = father.NagariktaIssueDate,
                                        FatherNagariktaIsssueDistrict = father.NagariktaIsssueDistrict,
                                        FatherPassportNo_Desh = father.PassportNo_Desh,
                                        FatherShikshaSthar = father.ShikshaSthar,
                                        FatherPesha = father.Pesha,
                                        FatherDharma = father.Dharma,
                                        FatherMatriBhasa = father.MatriBhasa,
                                        TotalChild = father.TotalChild,
                                        TotalLiveChild = father.TotalLiveChild,
                                        VivahDartaNo = father.VivahDartaNo,
                                        VivahMiti = father.VivahMiti,
                                        //motherdetail
                                        NewBornMotherId = mother.NewBornMotherId,
                                        MapMotherNewbornId = mother.NewbornId,
                                        MotherNaamThar = mother.NaamThar,
                                        MotherFullName = mother.FullName,
                                        MotherPermaState = mother.PermaState,
                                        MotherPermaDistrict = mother.PermaDistrict,
                                        MotherPermaPalika = mother.PermaPalika,
                                        MotherPermaWardNo = mother.PermaWardNo,
                                        MotherGaunTole = mother.GaunTole,
                                        MotherGharNo = mother.GharNo,
                                        MotherSisuJanmidakoUmer = mother.SisuJanmidakoUmer,
                                        MotherJanmaDesh = mother.JanmaDesh,
                                        MotherNagariktaLiyekoDesh = mother.NagariktaLiyekoDesh,
                                        MotherNagariktaPraPaNo = mother.NagariktaPraPaNo,
                                        MotherNagariktaIssueDate = mother.NagariktaIssueDate,
                                        MotherNagariktaIssueDistrict = mother.NagariktaIssueDistrict,
                                        MotherPassportNo_Desh = mother.PassportNo_Desh,
                                        MotherShikshaSthar = mother.ShikshaSthar,
                                        MotherPesha = mother.Pesha,
                                        MotherDharma = mother.Dharma,
                                        MotherMatriBhasa = mother.MatriBhasa,
                                        //informantdetail
                                        NewBornInformantId = informant.NewBornInformantId,
                                        MapInformantNewbornId = informant.NewbornId,
                                        InfNaamThar = informant.InfNaamThar,
                                        InfFullName = informant.InfFullName,
                                        InfRelationToNewBorn = informant.InfRelationToNewBorn,
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
        public List<JanmaDartaModel> GetJanmaDartaRecordsList(int WorkOfficeId, int? NewbornId, int page, int pagesize)
        {
            var model = new List<JanmaDartaModel>();
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            model = (from newborn in ent.tblJanmaDartas
                     join father in ent.tblJanmaDartaFatherDetails on newborn.NewbornId equals father.NewbornId
                     join mother in ent.tblJanmaDartaMotherDetails on newborn.NewbornId equals mother.NewbornId
                     join panji in ent.tblPanjikas on newborn.PanjiId equals panji.PanjikaId
                     where panji.FiscalYear == activefiscalyear
                     select new JanmaDartaModel
                     {
                         NewbornId = newborn.NewbornId,
                         NewbornNaam = newborn.NewbornNaam,
                         JanmaMiti = newborn.JanmaMiti,
                         Gender = newborn.Gender,
                         FatherNaamThar = father.NaamThar,
                         MotherNaamThar = mother.NaamThar,
                         JanmaFaramDartaNo = (int)panji.JanmaDartaFaramNo
                     }).ToList();


            return model;
        }
        public List<JanmaDartaModel> GetSearchList(int? faramno, int? fiscalyear)
        {
            var model = new List<JanmaDartaModel>();
            var activefiscalyear = Utility.GetCurrentFisicalYear();
            var activeyear = 0;
            if (fiscalyear != null)
            {
                activeyear = (int)fiscalyear;
            }
            else { activeyear = activefiscalyear; }
            model = (from newborn in ent.tblJanmaDartas
                     join father in ent.tblJanmaDartaFatherDetails on newborn.NewbornId equals father.NewbornId
                     join mother in ent.tblJanmaDartaMotherDetails on newborn.NewbornId equals mother.NewbornId
                     join panji in ent.tblPanjikas on newborn.PanjiId equals panji.PanjikaId
                     where panji.FiscalYear == activeyear
                     select new JanmaDartaModel
                     {
                         NewbornId = newborn.NewbornId,
                         NewbornNaam = newborn.NewbornNaam,
                         JanmaMiti = newborn.JanmaMiti,
                         Gender = newborn.Gender,
                         FatherNaamThar = father.NaamThar,
                         MotherNaamThar = mother.NaamThar,
                         FaramNo = panji.JanmaDartaFaramNo,
                     }).ToList();

            if (faramno != null)
            {
                model = model.Where(x => x.FaramNo == faramno).ToList();
            }

            return model;
        }
        public void Update(JanmaDartaModel model)
        {
            var updatedarta = ent.tblJanmaDartas.Where(x => x.NewbornId == model.NewbornId).SingleOrDefault();
            updatedarta.NewbornId = model.NewbornId;
            updatedarta.PanjiId = model.PanjiId;
            updatedarta.NewbornNaam = model.NewbornNaam;
            updatedarta.NewbornName = model.NewbornName;
            updatedarta.JanmaMiti = model.JanmaMiti;
            updatedarta.JanmaDate = Utility.GetRomanDate(model.JanmaMiti).ToString();
            updatedarta.JanmaSthaan = model.JanmaSthaan;
            updatedarta.JanmadaMadatt = model.JanmadaMadatt;
            updatedarta.Gender = model.Gender;
            updatedarta.JanmaJaatJati = model.JanmaJaatJati;
            updatedarta.JanmaKisim = model.JanmaKisim;
            updatedarta.JanmaPradesh = model.JanmaPradesh;
            updatedarta.JanmaJilla = model.JanmaJilla;
            updatedarta.JanmaPalika = model.JanmaPalika; updatedarta.JanmaWardNo = model.JanmaWardNo;
            updatedarta.JanmaBidesh = model.JanmaBidesh; updatedarta.JanmaForeign = model.JanmaForeign;
            updatedarta.BajekoNaam = model.BajekoNaam; updatedarta.GrandFather = model.GrandFather;
            ent.Entry(updatedarta).State = System.Data.Entity.EntityState.Modified;

            var updatePanji = ent.tblPanjikas.Where(x => x.PanjikaId == updatedarta.PanjiId).SingleOrDefault();
            updatePanji.PanjiState = model.PanjiState;
            updatePanji.PanjiDistrict = model.PanjiDistrict;
            updatePanji.PanjiPalika = model.PanjiPalika;
            updatePanji.PanjiWardNo = model.PanjiWardNo;
            updatePanji.PanjiNaamThar = model.PanjiName;
            updatePanji.PanjiFullName = model.PanjiName_Eng;
            updatePanji.Panji_INVId = model.Panji_INVId;
            updatePanji.JanmaDartaFaramNo = model.JanmaFaramDartaNo;
            updatePanji.FaramDartaMiti = model.FaramDartaMiti;
            updatePanji.FaramDartaDate = Utility.GetRomanDate(model.FaramDartaMiti).ToString();
            updatePanji.PariwarLagatNo = model.PariwarLagatFaramNo;
            //updatePanji.UpdatedBy = Utility.GetCurrentLoginUser();
            updatePanji.UpdatedBy = 1;
            updatePanji.UpdatedDate = DateTime.Now.ToShortDateString().ToString();
            ent.Entry(updatePanji).State = System.Data.Entity.EntityState.Modified;

            var updatefatherdetail = ent.tblJanmaDartaFatherDetails.Where(x => x.NewbornId == updatedarta.NewbornId).SingleOrDefault();
            if (updatefatherdetail != null)
            {
                updatefatherdetail.NewbornId = model.NewbornId;
                updatefatherdetail.NaamThar = model.FatherNaamThar; updatefatherdetail.FullName = model.FatherFullName;
                updatefatherdetail.PermaState = model.FatherPermaState; updatefatherdetail.PermaDistrict = model.FatherPermaDistrict;
                updatefatherdetail.PermaPalika = model.FatherPermaPalika; updatefatherdetail.PermaWardNo = model.FatherPermaWardNo;
                updatefatherdetail.GaunTole = model.FatherGaunTole; updatefatherdetail.GharNo = model.FatherGharNo;
                updatefatherdetail.SisuJanmidakoUmer = model.FatherSisuJanmidakoUmer;
                updatefatherdetail.JanmaDesh = model.FatherJanmaDesh;
                updatefatherdetail.NagariktaLiyekoDesh = model.FatherNagariktaLiyekoDesh;
                updatefatherdetail.NagariktaPraPaNo = model.FatherNagariktaPraPaNo;
                updatefatherdetail.NagariktaIssueDate = model.FatherNagariktaIssueDate; updatefatherdetail.NagariktaIsssueDistrict = model.FatherNagariktaIsssueDistrict;
                updatefatherdetail.PassportNo_Desh = model.FatherPassportNo_Desh;
                updatefatherdetail.ShikshaSthar = model.FatherShikshaSthar; updatefatherdetail.Pesha = model.FatherPesha;
                updatefatherdetail.Dharma = model.FatherDharma; updatefatherdetail.MatriBhasa = model.FatherMatriBhasa;
                updatefatherdetail.TotalChild = model.TotalChild; updatefatherdetail.TotalLiveChild = model.TotalLiveChild;
                updatefatherdetail.VivahDartaNo = model.VivahDartaNo;
                updatefatherdetail.VivahMiti = model.VivahMiti;
                updatefatherdetail.VivahDate = Utility.GetRomanDate(model.VivahMiti).ToString();
                ent.Entry(updatefatherdetail).State = System.Data.Entity.EntityState.Modified;
            }

            var updatemotherdetail = ent.tblJanmaDartaMotherDetails.Where(x => x.NewbornId == updatedarta.NewbornId).SingleOrDefault();
            if (updatemotherdetail != null)
            {
                updatemotherdetail.NewbornId = model.NewbornId;
                updatemotherdetail.NaamThar = model.MotherNaamThar; updatemotherdetail.FullName = model.MotherFullName;
                updatemotherdetail.PermaState = model.MotherPermaState; updatemotherdetail.PermaDistrict = model.MotherPermaDistrict;
                updatemotherdetail.PermaPalika = model.MotherPermaPalika; updatemotherdetail.PermaWardNo = model.MotherPermaWardNo;
                updatemotherdetail.GaunTole = model.MotherGaunTole; updatemotherdetail.GharNo = model.MotherGharNo;
                updatemotherdetail.SisuJanmidakoUmer = model.MotherSisuJanmidakoUmer;
                updatemotherdetail.JanmaDesh = model.MotherJanmaDesh;
                updatemotherdetail.NagariktaLiyekoDesh = model.MotherNagariktaLiyekoDesh;
                updatemotherdetail.NagariktaPraPaNo = model.MotherNagariktaPraPaNo;
                updatemotherdetail.NagariktaIssueDate = model.MotherNagariktaIssueDate; updatemotherdetail.NagariktaIssueDistrict = model.MotherNagariktaIssueDistrict;
                updatemotherdetail.PassportNo_Desh = model.MotherPassportNo_Desh;
                updatemotherdetail.ShikshaSthar = model.MotherShikshaSthar; updatemotherdetail.Pesha = model.MotherPesha;
                updatemotherdetail.Dharma = model.MotherDharma; updatemotherdetail.MatriBhasa = model.MotherMatriBhasa;
                ent.Entry(updatemotherdetail).State = System.Data.Entity.EntityState.Modified;
            }

            var infdata = ent.tblJanmaDartaInformants.Where(x => x.NewbornId == updatedarta.NewbornId).SingleOrDefault();
            if (infdata != null)
            {
                infdata.NewBornInformantId = model.NewBornInformantId;
                infdata.NewbornId = model.NewbornId;
                infdata.InfNaamThar = model.InfNaamThar;
                infdata.InfFullName = model.InfFullName;
                infdata.InfRelationToNewBorn = model.InfRelationToNewBorn;
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
        public JanmaDartaModel GetpanjiDescription(int? fiscalyear)
        {
            JanmaDartaModel data = (from panji in ent.tblPanjikas
                                    where panji.FiscalYear == fiscalyear
                                    select new JanmaDartaModel
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
                                        JanmaFaramDartaNo = (int)panji.JanmaDartaFaramNo,
                                        FaramDartaMiti = panji.FaramDartaMiti,
                                        PariwarLagatFaramNo = panji.PariwarLagatNo,
                                        FiscalYear = panji.FiscalYear,
                                        WorkOffice = panji.WorkOffice
                                    }).SingleOrDefault();

            return data;
        }
    }
}