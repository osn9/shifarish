using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using SifarishView.Areas.SetUp.Models;

namespace SifarishView
{
    public class Utility
    {
        public static int PageSize { get { return 25; } }
        public static int JanmaSifaris { get { return 1; } }
        public static int MrityuSifaris { get { return 2; } }
        public static int VivahSifaris { get { return 3; } }
        public static int BasaisaraiSifaris { get { return 4; } }
        public static int DivorceSifaris { get { return 5; } }

        public static SelectList GetAllState()
        {
            IEnumerable<StateDataViewModel> StateList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("StateData").Result;
            StateList = response.Content.ReadAsAsync<IEnumerable<StateDataViewModel>>().Result;
            return new SelectList(StateList, "StateId_val", "StateName_Nep");
        }
        public static string GetStateById(int? id)
        {
            StateDataViewModel obj;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("StateData/" + id.ToString()).Result;
            obj = response.Content.ReadAsAsync<StateDataViewModel>().Result;

            if (obj != null)
                return obj.StateName_Nep;
            else
                return "";
        }
        public static string GetStateName(int? id)
        {
            StateDataViewModel obj;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("StateData/" + id.ToString()).Result;
            obj = response.Content.ReadAsAsync<StateDataViewModel>().Result;
            if (obj != null)
                return obj.StateName;
            else
                return "";
        }
        public static SelectList GetAllDistrict()
        {
            IEnumerable<DistrictDataViewModel> DistrictList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("DistrictData").Result;
            DistrictList = response.Content.ReadAsAsync<IEnumerable<DistrictDataViewModel>>().Result;
            return new SelectList(DistrictList, "DistrictId_val", "DistrictName_Nep");
        }
        public static string GetDistrictById(int? id)
        {
            DistrictDataViewModel obj;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("DistrictData/" + id.ToString()).Result;
            obj = response.Content.ReadAsAsync<DistrictDataViewModel>().Result;

            if (obj != null)
                return obj.DistrictName_Nep;
            else
                return "";
        }
        public static string GetDistrictName(int? id)
        {
            DistrictDataViewModel obj;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("DistrictData/" + id.ToString()).Result;
            obj = response.Content.ReadAsAsync<DistrictDataViewModel>().Result;
            if (obj != null)
                return obj.DistrictName;
            else
                return "";
        }
        public static SelectList GetAllPalika()
        {
            IEnumerable<PalikaDataViewModel> PaliakList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("PalikaData").Result;
            PaliakList = response.Content.ReadAsAsync<IEnumerable<PalikaDataViewModel>>().Result;
            return new SelectList(PaliakList, "PalikaId_val", "PalikaName_Nep");
        }
        public static string GetPalikaById(int? id)
        {
            PalikaDataViewModel obj;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("PalikaData/" + id.ToString()).Result;
            obj = response.Content.ReadAsAsync<PalikaDataViewModel>().Result;

            if (obj != null)
                return obj.PalikaName_Nep;
            else
                return "";
        }
        public static string GetPalikaName(int? id)
        {
            PalikaDataViewModel obj;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("PalikaData/" + id.ToString()).Result;
            obj = response.Content.ReadAsAsync<PalikaDataViewModel>().Result;
            if (obj != null)
                return obj.PalikaName;
            else
                return "";
        }
        public static SelectList GetRelation()
        {
            IEnumerable<RelationViewModel> RelationList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Relation").Result;
            RelationList = response.Content.ReadAsAsync<IEnumerable<RelationViewModel>>().Result;
            return new SelectList(RelationList, "RelationId", "RelationName_Nep");

        }
        public static string GetRelationById(int? id)
        {
            RelationViewModel obj;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Relation/" + id.ToString()).Result;
            obj = response.Content.ReadAsAsync<RelationViewModel>().Result;

            if (obj != null)
                return obj.RelationName_Nep;
            else
                return "";
        }
        public static SelectList GetOccupation()
        {
            IEnumerable<OccupationViewModel> OccupationList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Occupation").Result;
            OccupationList = response.Content.ReadAsAsync<IEnumerable<OccupationViewModel>>().Result;
            return new SelectList(OccupationList, "OcupationId", "Occupation");

        }
        public static SelectList GetEducation()
        {
            IEnumerable<EducationViewModel> EducationList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Education").Result;
            EducationList = response.Content.ReadAsAsync<IEnumerable<EducationViewModel>>().Result;
            return new SelectList(EducationList, "EducationId", "Education");

        }
        public static SelectList GetJanmasthaan()
        {
            IEnumerable<JanmaSthanViewModel> JanmasthaanList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("JanmaSthan").Result;
            JanmasthaanList = response.Content.ReadAsAsync<IEnumerable<JanmaSthanViewModel>>().Result;
            return new SelectList(JanmasthaanList, "JanmaSthaanId", "JanmaSthaanName");

        }
        public static SelectList GetJanmaMaddat()
        {
            IEnumerable<JanmadaMaddatViewModel> JanmaMaddatList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("JanmaMaddat").Result;
            JanmaMaddatList = response.Content.ReadAsAsync<IEnumerable<JanmadaMaddatViewModel>>().Result;
            return new SelectList(JanmaMaddatList, "JanmadaMaddatId", "JanmadaMaddatGarne");

        }
        public static SelectList GetGender()
        {
            IEnumerable<GenderViewModel> GenderList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Gender").Result;
            GenderList = response.Content.ReadAsAsync<IEnumerable<GenderViewModel>>().Result;
            return new SelectList(GenderList, "GenderId", "Gender_Nep");

        }
        public static string GetGenderById(int? id)
        {
            GenderViewModel obj;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Gender/" + id.ToString()).Result;
            obj = response.Content.ReadAsAsync<GenderViewModel>().Result;
            if (obj != null)
                return obj.Gender_Nep;
            else
                return "";

        }
        public static SelectList GetJanmaKisim()
        {
            IEnumerable<JanmaKisismViewModel> JanmaKisimList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("JanmaKisim").Result;
            JanmaKisimList = response.Content.ReadAsAsync<IEnumerable<JanmaKisismViewModel>>().Result;
            return new SelectList(JanmaKisimList, "JanmaKisinId", "JanmaKisimName");

        }
        public static SelectList GetVivahKisim()
        {
            IEnumerable<VivahKisimViewModel> VivahKisimList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("VivahKisim").Result;
            VivahKisimList = response.Content.ReadAsAsync<IEnumerable<VivahKisimViewModel>>().Result;
            return new SelectList(VivahKisimList, "VivahKisimId", "VivahKisim_Nep");

        }
        public static string GetVivahKisimById(int? id)
        {
            VivahKisimViewModel obj;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("VivahKisim/" + id.ToString()).Result;
            obj = response.Content.ReadAsAsync<VivahKisimViewModel>().Result;
            if (obj != null)
                return obj.VivahKisim_Nep;
            else
                return "";

        }
        public static string GetVivahKisimName(int? id)
        {
            VivahKisimViewModel obj;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("VivahKisim/" + id.ToString()).Result;
            obj = response.Content.ReadAsAsync<VivahKisimViewModel>().Result;
            if (obj != null)
                return obj.VivahKisim;
            else
                return "";

        }
        public static SelectList GetBasaisaraiKaran()
        {
            IEnumerable<BasaisaraiKaranViewModel> BasaisaraiKaranList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("BasaisaraiKaran").Result;
            BasaisaraiKaranList = response.Content.ReadAsAsync<IEnumerable<BasaisaraiKaranViewModel>>().Result;
            return new SelectList(BasaisaraiKaranList, "BasaisaraiKaranId", "BasaisaraiKaran");

        }
        public static string GetBasaisaraiKaranById(int? id)
        {
            BasaisaraiKaranViewModel obj;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("BasaisaraiKaran/" + id.ToString()).Result;
            obj = response.Content.ReadAsAsync<BasaisaraiKaranViewModel>().Result;
            if (obj != null)
                return obj.BasaisaraiKaran;
            else
                return "";

        }
        public static int GetCurrentFisicalYear()
        {
            IEnumerable<FiscalYearViewModel> FiscalYearList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("FiscalYear").Result;
            FiscalYearList = response.Content.ReadAsAsync<IEnumerable<FiscalYearViewModel>>().Result;
            return FiscalYearList.First(x => x.STATUS == true).FiscalYearId;
        }
        public static string GetFiscalYearTitle(int id)
        {
            IEnumerable<FiscalYearViewModel> FiscalYearList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("FiscalYear").Result;
            FiscalYearList = response.Content.ReadAsAsync<IEnumerable<FiscalYearViewModel>>().Result;
            var obj = FiscalYearList.Where(x => x.FiscalYearId == id).SingleOrDefault();
            if (obj != null)
                return obj.FiscalYear;
            else
                return "";


        }
        public static IEnumerable<FiscalYearViewModel> GetFiscalYears()
        {
            IEnumerable<FiscalYearViewModel> FiscalYearList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("FiscalYear").Result;
            FiscalYearList = response.Content.ReadAsAsync<IEnumerable<FiscalYearViewModel>>().Result;
            return FiscalYearList;


        }
        public static SelectList GetCourtType()
        {
            IEnumerable<CourtTypeViewModel> CourtTypeList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("CourtType").Result;
            CourtTypeList = response.Content.ReadAsAsync<IEnumerable<CourtTypeViewModel>>().Result;
            return new SelectList(CourtTypeList, "CourtTypeId", "CourtType_Nep");

        }
        public static string GetCourtTypeById(int? id)
        {
            CourtTypeViewModel obj;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("CourtType/" + id.ToString()).Result;
            obj = response.Content.ReadAsAsync<CourtTypeViewModel>().Result;

            if (obj != null)
                return obj.CourtType_Nep;
            else
                return "";
        }
        public static string GetCourtTypeName(int? id)
        {
            CourtTypeViewModel obj;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("CourtType/" + id.ToString()).Result;
            obj = response.Content.ReadAsAsync<CourtTypeViewModel>().Result;
            if (obj != null)
                return obj.CourtType;
            else
                return "";
        }
    }
}