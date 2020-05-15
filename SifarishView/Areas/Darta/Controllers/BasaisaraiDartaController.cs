using SifarishView.Areas.Darta.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace SifarishView.Areas.Darta.Controllers
{
    public class BasaisaraiDartaController : Controller
    {
        // GET: Darta/BasaisaraiDarta
        public ActionResult Index(int page = 1)
        {
            List<BasaisaraiDartaViewModel> DataList;
            BasaisaraiDartaViewModel model = new BasaisaraiDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("BasaisaraiDarta").Result;
            DataList = response.Content.ReadAsAsync<List<BasaisaraiDartaViewModel>>().Result;
            model.BasaisaraiDartaViewModelList = DataList;
            ViewBag.currentPage = page;
            return View(model);
        }
        public ActionResult Create()
        {
            BasaisaraiDartaViewModel model = new BasaisaraiDartaViewModel();
            //model.BasaisaraiFaramDartaNo = Utility.GetMaxBasaisaraiDartaNo(Utility.BasaisaraiSifaris);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(BasaisaraiDartaViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PostAsJsonAsync("BasaisaraiDarta", model).Result;
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {
            BasaisaraiDartaViewModel model = new BasaisaraiDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("BasaisaraiDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<BasaisaraiDartaViewModel>().Result;
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(BasaisaraiDartaViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PutAsJsonAsync("BasaisaraiDarta/" + model.NewMigrationId, model).Result;
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Details(int? id)
        {
            var model = new BasaisaraiDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("BasaisaraiDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<BasaisaraiDartaViewModel>().Result;
            return PartialView("VUC_Details", model);
        }
        public ActionResult PrintDarta(int? id)
        {
            var model = new BasaisaraiDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("BasaisaraiDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<BasaisaraiDartaViewModel>().Result;
            return PartialView("_PrintDarta", model);
        }
        public ActionResult Report()
        {
            var model = new BasaisaraiDartaViewModel();
            return View(model);
        }
    }
}