using SifarishView.Areas.Darta.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace SifarishView.Areas.Darta.Controllers
{
    public class DivorceDartaController : Controller
    {
        // GET: Darta/DivorceDarta
        public ActionResult Index(int page = 1)
        {
            List<DivorceDartaViewModel> DataList;
            DivorceDartaViewModel model = new DivorceDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("DivorceDarta").Result;
            DataList = response.Content.ReadAsAsync<List<DivorceDartaViewModel>>().Result;
            model.DivorceDartaViewModelList = DataList;
            ViewBag.currentPage = page;
            return View(model);
        }
        public ActionResult Create()
        {
            DivorceDartaViewModel model = new DivorceDartaViewModel();
            //model.JanmaFaramDartaNo = Utility.GetMaxJanmaDartaNo(Utility.JanmaSifaris);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(DivorceDartaViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PostAsJsonAsync("DivorceDarta", model).Result;
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {
            DivorceDartaViewModel model = new DivorceDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("DivorceDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<DivorceDartaViewModel>().Result;
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(DivorceDartaViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PutAsJsonAsync("DivorceDarta/" + model.DivorceId, model).Result;
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Details(int? id)
        {
            var model = new DivorceDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("DivorceDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<DivorceDartaViewModel>().Result;
            return PartialView("VUC_Details", model);
        }
        public ActionResult PrintDarta(int? id)
        {
            var model = new DivorceDartaViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("DivorceDarta/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<DivorceDartaViewModel>().Result;
            return PartialView("_PrintDarta", model);
        }
        public ActionResult Report()
        {
            var model = new DivorceDartaViewModel();
            return View(model);
        }
    }
}