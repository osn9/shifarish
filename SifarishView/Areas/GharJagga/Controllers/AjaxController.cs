using Newtonsoft.Json;
using SifarishView.Areas.GharJagga.Models;
using SifarishView.Areas.GharJagga.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace SifarishView.Areas.GharJagga.Controllers
{
    public class AjaxController : Controller
    {
        // GET: GharJagga/Ajax
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetDistrictListForStateId(long id)
        {

            IEnumerable<CommonViewModel.DistrictViewModel> DistrictList = null;
            try
            {

                var accesstoken = Session["accesstoken"];
                GlobalVariables.webApiClient.DefaultRequestHeaders.Clear();
                GlobalVariables.webApiClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + accesstoken);
                HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("district").Result;
                DistrictList = response.Content.ReadAsAsync<IEnumerable<CommonViewModel.DistrictViewModel>>().Result;
                DistrictList = DistrictList.Where(x => x.StateId == id).ToList();
            }
            catch (Exception)
            {
            }
            return Json(DistrictList, JsonRequestBehavior.AllowGet);
        }
    }
}