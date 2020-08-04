using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Http;
using System.Web.Mvc;
using SifarishView.Areas.SetUp.Models;

namespace SifarishView.Areas.SetUp.Controllers
{
    public class PalikaDataController : Controller
    {
        // GET: SetUp/PalikaData
        public ActionResult Index()
        {
            IEnumerable<PalikaDataViewModel> DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("PalikaData").Result;
            DataList = response.Content.ReadAsAsync<IEnumerable<PalikaDataViewModel>>().Result;
            return View(DataList);
        }
    }
}