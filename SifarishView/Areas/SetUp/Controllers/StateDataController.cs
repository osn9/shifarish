using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Http;
using System.Web.Mvc;
using SifarishView.Areas.SetUp.Models;

namespace SifarishView.Areas.SetUp.Controllers
{
    public class StateDataController : Controller
    {
        // GET: SetUp/StateData
        public ActionResult Index()
        {
            IEnumerable<StateDataViewModel> DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("StateData").Result;
            DataList = response.Content.ReadAsAsync<IEnumerable<StateDataViewModel>>().Result;
            return View(DataList);
        }
    }
}