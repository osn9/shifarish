using SifarishView.Areas.Darta.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace SifarishView.Areas.Darta.Controllers
{
    public class MrityuDartaController : Controller
    {
        // GET: Darta/MrityuDarta
        public ActionResult Index(int page = 1)
        {
            List<MrityuDartaViewModel> DataList;
            MrityuDartaViewModel model = new MrityuDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("MrityuDarta").Result;
            DataList = response.Content.ReadAsAsync<List<MrityuDartaViewModel>>().Result;
            model.MrityuDartaViewModelList = DataList;
            ViewBag.currentPage = page;
            return View(model);
        }
        public ActionResult Create()
        {
            MrityuDartaViewModel model = new MrityuDartaViewModel();
            // model.MrityuFaramDartaNo = Utility.GetMaxMrityuDartaNo(Utility.MrityuSifaris);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(MrityuDartaViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PostAsJsonAsync("MrityuDarta", model).Result;
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {
            MrityuDartaViewModel model = new MrityuDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("MrityuDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<MrityuDartaViewModel>().Result;
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(MrityuDartaViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PutAsJsonAsync("MrityuDarta/" + model.NewDeathId, model).Result;
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Details(int? id)
        {
            var model = new MrityuDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("MrityuDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<MrityuDartaViewModel>().Result;
            return PartialView("VUC_Details", model);
        }
        public ActionResult PrintDarta(int? id)
        {
            var model = new MrityuDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("MrityuDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<MrityuDartaViewModel>().Result;
            return PartialView("_PrintDarta", model);
        }
        public ActionResult Report()
        {
            var model = new MrityuDartaViewModel();
            return View(model);
        }
    }
}