using Sifaris.Models;
using Sifaris.Providers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sifaris.Controllers
{
    public class VivahDartaController : Controller
    {
        //
        // GET: /VivahDarta/
        VivahDartaProvider pro = new VivahDartaProvider();
        public ActionResult Index(int? id, int page=1)
        {
            var pagesize = Utility.PageSize;
            var model = new VivahDartaModel();
             model.VivahDartaModelList = pro.GetVivahDartaRecordsList(1, id, page, pagesize);
            ViewBag.currentPage = page;
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            VivahDartaModel model = new VivahDartaModel();
            model.VivahFaramDartaNo = Utility.GetMaxVivahDartaNo(Utility.VivahSifaris);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(VivahDartaModel model)
        {
            if (ModelState.IsValid)
            {
                pro.Insert(model);
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var model = new VivahDartaModel();
            model = pro.GetVivahDartaRecords(1, id, 0, 0);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(int id,VivahDartaModel model)
        {
            if (ModelState.IsValid)
            {
                model.NewMarriageId = id;
                pro.Update(model);
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult PrintDarta(int? id)
        {
            var model = new VivahDartaModel();
            model = pro.GetVivahDartaRecords(1, id, 0, 0);
            return PartialView("_PrintDarta", model);
        }
        public ActionResult Details(int? id)
        {
            var model = new VivahDartaModel();
            model = pro.GetVivahDartaRecords(1, id, 0, 0);
            return PartialView("VUC_Details", model);
        }
        public ActionResult Report()
        {
            var model = new VivahDartaModel();
            return View(model);
        }
        public ActionResult GetReport(int? faramno, int? fiscalyear, int page = 1)
        {
            var model = new VivahDartaModel();
            model.VivahDartaModelList = pro.GetSearchList(faramno, fiscalyear);
            ViewBag.currentPage = page;
            return PartialView("_Report", model);
        }
        public ActionResult PrintReport(int? faramno, int? fiscalyear, int page = 1)
        {
            var model = new VivahDartaModel();
            model.VivahDartaModelList = pro.GetSearchList(faramno, fiscalyear);
            ViewBag.currentPage = page;
            return View("_Report", model);
        }
	}
}