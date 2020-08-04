using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using SifarishView.Areas.Darta.Models;

namespace SifarishView.Areas.Darta.Controllers
{
    public class JanmaDartaController : Controller
    {
        // GET: Darta/JanmaDarta
        public ActionResult Index(int page = 1)
        {
            List<JanmaDartaViewModel> DataList;
            JanmaDartaViewModel model = new JanmaDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("JanmaDarta").Result;
            DataList = response.Content.ReadAsAsync<List<JanmaDartaViewModel>>().Result;
            model.JanmaDartaViewModelList = DataList;
            ViewBag.currentPage = page;
            return View(model);
        }
        public ActionResult Create()
        {
            JanmaDartaViewModel model = new JanmaDartaViewModel();
            //model.JanmaFaramDartaNo = Utility.GetMaxJanmaDartaNo(Utility.JanmaSifaris);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(JanmaDartaViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PostAsJsonAsync("JanmaDarta", model).Result;
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {
            JanmaDartaViewModel model = new JanmaDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("JanmaDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<JanmaDartaViewModel>().Result;
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(JanmaDartaViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PutAsJsonAsync("JanmaDarta/" + model.NewbornId, model).Result;
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Details(int? id)
        {
            var model = new JanmaDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("JanmaDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<JanmaDartaViewModel>().Result;
            return PartialView("VUC_Details", model);
        }
        public ActionResult PrintDarta(int? id)
        {
            var model = new JanmaDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("JanmaDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<JanmaDartaViewModel>().Result;
            return PartialView("_PrintDarta", model);
        }
        public ActionResult Report()
        {
            var model = new JanmaDartaViewModel();
            return View(model);
        }
        public ActionResult GetReport(int? faramno, int? fiscalyear, int page = 1)
        {
            var model = new JanmaDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("JanmaDarta").Result;
            model.JanmaDartaViewModelList = response.Content.ReadAsAsync<List<JanmaDartaViewModel>>().Result;
            ViewBag.currentPage = page;
            return PartialView("_Report", model);
        }
        public ActionResult PrintReport(int? faramno, int? fiscalyear, int page = 1)
        {
            var model = new JanmaDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("JanmaDarta").Result;
            model.JanmaDartaViewModelList = response.Content.ReadAsAsync<List<JanmaDartaViewModel>>().Result;
            ViewBag.currentPage = page;
            return View("_Report", model);
        }
    }
}