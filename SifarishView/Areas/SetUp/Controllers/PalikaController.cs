using SifarishView.Areas.SetUp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace SifarishView.Areas.SetUp.Controllers
{
    public class PalikaController : Controller
    {
        // GET: SetUp/Palika
        public ActionResult Index()
        {
            IEnumerable<PalikaViewModel> DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Palika").Result;
            DataList = response.Content.ReadAsAsync<IEnumerable<PalikaViewModel>>().Result;
            return View(DataList);
        }
    }
}