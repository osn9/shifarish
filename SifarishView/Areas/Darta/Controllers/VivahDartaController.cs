using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using SifarishView.Areas.Darta.Models;

namespace SifarishView.Areas.Darta.Controllers
{
    public class VivahDartaController : Controller
    {
        // GET: Darta/VivahDarta
        public ActionResult Index(int page = 1)
        {
            List<VivahDartaViewModel> DataList;
            VivahDartaViewModel model = new VivahDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("VivahDarta").Result;
            DataList = response.Content.ReadAsAsync<List<VivahDartaViewModel>>().Result;
            model.VivahDartaViewModelList = DataList;
            ViewBag.currentPage = page;
            return View(model);
        }
        public ActionResult Create()
        {
            VivahDartaViewModel model = new VivahDartaViewModel();
            //model.VivahFaramDartaNo = Utility.GetMaxVivahDartaNo(Utility.VivahSifaris);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(VivahDartaViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PostAsJsonAsync("VivahDarta", model).Result;
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {
            VivahDartaViewModel model = new VivahDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("VivahDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<VivahDartaViewModel>().Result;
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(VivahDartaViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PutAsJsonAsync("VivahDarta/" + model.NewMarriageId, model).Result;
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Details(int? id)
        {
            var model = new VivahDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("VivahDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<VivahDartaViewModel>().Result;
            return PartialView("VUC_Details", model);
        }
        public ActionResult PrintDarta(int? id)
        {
            var model = new VivahDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("VivahDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<VivahDartaViewModel>().Result;
            return PartialView("_PrintDarta", model);
        }
        public ActionResult Report()
        {
            var model = new VivahDartaViewModel();
            return View(model);
        }
    }
}