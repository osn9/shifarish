using SifarishView.Areas.SetUp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace SifarishView.Areas.SetUp.Controllers
{
    public class DistrictController : Controller
    {
        // GET: SetUp/District
        public ActionResult Index()
        {
            IEnumerable<DistrictViewModel> DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("District").Result;
            DataList = response.Content.ReadAsAsync<IEnumerable<DistrictViewModel>>().Result;
            return View(DataList);
        }
    }
}