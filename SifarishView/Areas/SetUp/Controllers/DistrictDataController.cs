using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Http;
using System.Web.Mvc;
using SifarishView.Areas.SetUp.Models;

namespace SifarishView.Areas.SetUp.Controllers
{
    public class DistrictDataController : Controller
    {
        // GET: SetUp/DistrictData
        public ActionResult Index()
        {
            IEnumerable<DistrictDataViewModel> DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("DistrictData").Result;
            DataList = response.Content.ReadAsAsync<IEnumerable<DistrictDataViewModel>>().Result;
            return View(DataList);
        }
    }
}