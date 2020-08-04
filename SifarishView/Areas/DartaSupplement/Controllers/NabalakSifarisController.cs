using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using SifarishView.Areas.DartaSupplement.Models;

namespace SifarishView.Areas.DartaSupplement.Controllers
{
    public class NabalakSifarisController : Controller
    {
        // GET: DartaSupplement/NabalakSifaris
        public ActionResult Index(int page = 1)
        {
            List<NabalakSifarisViewModel> DataList;
            NabalakSifarisViewModel model = new NabalakSifarisViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NabalakSifaris").Result;
            DataList = response.Content.ReadAsAsync<List<NabalakSifarisViewModel>>().Result;
            model.NabalakSifarisViewModelList = DataList;
            ViewBag.currentPage = page;
            return View(model);
        }
        public ActionResult Create()
        {
            NabalakSifarisViewModel model = new NabalakSifarisViewModel();
            //model.JanmaFaramDartaNo = Utility.GetMaxJanmaDartaNo(Utility.JanmaSifaris);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(NabalakSifarisViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PostAsJsonAsync("NabalakSifaris", model).Result;
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {
            NabalakSifarisViewModel model = new NabalakSifarisViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NabalakSifaris/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<NabalakSifarisViewModel>().Result;
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(NabalakSifarisViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PutAsJsonAsync("NabalakSifaris/" + model.NabalakId, model).Result;
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Details(int? id)
        {
            var model = new NabalakSifarisViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NabalakSifaris/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<NabalakSifarisViewModel>().Result;
            return PartialView("VUC_Details", model);
        }
        public ActionResult PrintDarta(int? id)
        {
            var model = new NabalakSifarisViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NabalakSifaris/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<NabalakSifarisViewModel>().Result;
            return PartialView("_PrintDarta", model);
        }
        public ActionResult Report()
        {
            var model = new NabalakSifarisViewModel();
            return View(model);
        }
    }
}