using SifarishView.Areas.DartaSupplement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace SifarishView.Areas.DartaSupplement.Controllers
{
    public class NataPramanitSifarisController : Controller
    {
        // GET: DartaSupplement/NataPramanitSifaris
        public ActionResult Index(int page = 1)
        {
            List<NataPramanitSifarisViewModel> DataList;
            NataPramanitSifarisViewModel model = new NataPramanitSifarisViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NataPramanitSifaris").Result;
            DataList = response.Content.ReadAsAsync<List<NataPramanitSifarisViewModel>>().Result;
            model.NataPramanitSifarisViewModelList = DataList;
            ViewBag.currentPage = page;
            return View(model);
        }
        public ActionResult Create()
        {
            NataPramanitSifarisViewModel model = new NataPramanitSifarisViewModel();
            //model.JanmaFaramDartaNo = Utility.GetMaxJanmaDartaNo(Utility.JanmaSifaris);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(NataPramanitSifarisViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PostAsJsonAsync("NataPramanitSifaris", model).Result;
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {
            NataPramanitSifarisViewModel model = new NataPramanitSifarisViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NataPramanitSifaris/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<NataPramanitSifarisViewModel>().Result;
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(NataPramanitSifarisViewModel model)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.PutAsJsonAsync("NataPramanitSifaris/" + model.NewNataId, model).Result;
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Details(int? id)
        {
            var model = new NataPramanitSifarisViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NataPramanitSifaris/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<NataPramanitSifarisViewModel>().Result;
            return PartialView("VUC_Details", model);
        }
        public ActionResult PrintDarta(int? id)
        {
            var model = new NataPramanitSifarisViewModel();
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NataPramanitSifaris/" + id.ToString()).Result;
            model = response.Content.ReadAsAsync<NataPramanitSifarisViewModel>().Result;
            return PartialView("_PrintDarta", model);
        }
        public ActionResult AddMultiRecord()
        {
            return PartialView("AddPersonalDetails", new NataPramanitPersonalDetailViewModel());
        }
        public ActionResult Report()
        {
            var model = new NataPramanitSifarisViewModel();
            return View(model);
        }
    }
}