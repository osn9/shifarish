using SifarishView.Areas.SetUp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace SifarishView.Areas.SetUp.Controllers
{
    public class StateController : Controller
    {
        // GET: SetUp/State
        public ActionResult Index()
        {
            IEnumerable<StateViewModel> DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("State").Result;
            DataList = response.Content.ReadAsAsync<IEnumerable<StateViewModel>>().Result;
            return View(DataList);
        }
    }
}