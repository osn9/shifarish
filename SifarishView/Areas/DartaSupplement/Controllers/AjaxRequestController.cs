using SifarishView.Areas.SetUp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace SifarishView.Areas.DartaSupplement.Controllers
{
    public class AjaxRequestController : Controller
    {
        // GET: DartaSupplement/AjaxRequest
        public ActionResult GetDistrict(int ID)
        {
            IEnumerable<DistrictViewModel> DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("District").Result;
            DataList = response.Content.ReadAsAsync<IEnumerable<DistrictViewModel>>().Result;
            List<SelectListItem> districtList = new List<SelectListItem>();

            var projectList = DataList.Where(x => x.StateId_val == ID).ToList();
            foreach (var item in projectList)
            {
                districtList.Add(new SelectListItem { Text = item.DistrictName_Nep, Value = item.DistrictId_val.ToString() });
            }
            return Json(districtList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetPalika(int ID)
        {
            IEnumerable<PalikaViewModel> DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Palika").Result;
            DataList = response.Content.ReadAsAsync<IEnumerable<PalikaViewModel>>().Result;
            List<SelectListItem> palikaList = new List<SelectListItem>();

            var projectList = DataList.Where(x => x.DistrictId == ID).ToList();
            foreach (var item in projectList)
            {
                palikaList.Add(new SelectListItem { Text = item.PalikaName_Nep, Value = item.PalikaId_val.ToString() });
            }
            return Json(palikaList, JsonRequestBehavior.AllowGet);
        }
    }
}