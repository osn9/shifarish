using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using SifarishView.Areas.DartaSupplement.Models;

namespace SifarishView.Areas.DartaSupplement.Controllers
{
    public class NagariktaSifarisController : Controller
    {
        // GET: DartaSupplement/NagariktaSifaris
        public ActionResult Index(int page = 1)
        {
            List<NagariktaSifarisViewModel> DataList;
            NagariktaSifarisViewModel model = new NagariktaSifarisViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NagariktaSifaris").Result;
            DataList = response.Content.ReadAsAsync<List<NagariktaSifarisViewModel>>().Result;
            model.NagariktaSifarisViewModelList = DataList;
            ViewBag.currentPage = page;
            return View(model);
        }
        public ActionResult Create()
        {
            NagariktaSifarisViewModel model = new NagariktaSifarisViewModel();
            //model.JanmaFaramDartaNo = Utility.GetMaxJanmaDartaNo(Utility.JanmaSifaris);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(NagariktaSifarisViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PostAsJsonAsync("NagariktaSifaris", model).Result;
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {
            NagariktaSifarisViewModel model = new NagariktaSifarisViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NagariktaSifaris/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<NagariktaSifarisViewModel>().Result;
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(NagariktaSifarisViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PutAsJsonAsync("NagariktaSifaris/" + model.NewNagariktaId, model).Result;
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Details(int? id)
        {
            var model = new NagariktaSifarisViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NagariktaSifaris/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<NagariktaSifarisViewModel>().Result;
            return PartialView("VUC_Details", model);
        }
        public ActionResult PrintDarta(int? id)
        {
            var model = new NagariktaSifarisViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NagariktaSifaris/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<NagariktaSifarisViewModel>().Result;
            return PartialView("_PrintDarta", model);
        }
        public ActionResult Report()
        {
            var model = new NagariktaSifarisViewModel();
            return View(model);
        }
    }
}