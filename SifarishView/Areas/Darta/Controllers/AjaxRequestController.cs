using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using SifarishView.Areas.SetUp.Models;

namespace SifarishView.Areas.Darta.Controllers
{
    public class AjaxRequestController : Controller
    {
        // GET: Darta/AjaxRequest
        public ActionResult GetDistrict(int ID)
        {
            IEnumerable<DistrictDataViewModel> DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("DistrictData").Result;
            DataList = response.Content.ReadAsAsync<IEnumerable<DistrictDataViewModel>>().Result;
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
            IEnumerable<PalikaDataViewModel> DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("PalikaData").Result;
            DataList = response.Content.ReadAsAsync<IEnumerable<PalikaDataViewModel>>().Result;
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