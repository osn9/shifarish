using Sifaris.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sifaris.Providers
{
    public class DivorceDartaProvider
    {
        SifarisEntities ent=new SifarisEntities();
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
                DivorceId=model.DivorceId,
                PanjiId=panjiId,
                CourtType=model.CourtType,
                District=model.District,
                NirnayaNo=model.NirnayaNo,
                NinayaMiti=model.NinayaMiti,
                VivahDartaNo=model.VivahDartaNo,

            };
            ent.tblDivorceDartas.Add(insertnew);
            ent.SaveChanges();

            var divorceId = insertnew.DivorceId;
            var newrecordhusband = new tblDivorceeHusbandDetail()
            {
               DivorceId=divorceId,
            };
            ent.tblDivorceeHusbandDetails.Add(newrecordhusband);
            var newrecordwife = new tblDivorceeWifeDetail()
            {

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
        public DivorceDartaModel Get()
        {
            DivorceDartaModel model=new DivorceDartaModel();

            return model;
        }
        
    }
}