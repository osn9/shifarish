using Sifaris.Models;
using Sifaris.Providers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sifaris.Controllers
{
    public class MrityuDartaController : Controller
    {
        //
        // GET: /MrityuDarta/
        MrityuDartaProvider pro = new MrityuDartaProvider();
        public ActionResult Index(int? id, int page = 1)
        {
            int pagesize = Utility.PageSize;
            var model = new MrityuDartaModel();
            model.MrityuDartaModelList = pro.GetMrityuDartaRecordsList(1, id, page, pagesize);
            ViewBag.currentPage = page;
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            MrityuDartaModel model = new MrityuDartaModel();
            model.MrityuFaramDartaNo = Utility.GetMaxMrityuDartaNo(Utility.MrityuSifaris);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(MrityuDartaModel model)
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
            var model = new MrityuDartaModel();
            model = pro.GetMrityuDartaRecords(1, id, 0, 0);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(int id,MrityuDartaModel model)
        {
            if (ModelState.IsValid)
            {
                model.NewDeathId = id;
                pro.Update(model);
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult PrintDarta(int? id)
        {
            var model = new MrityuDartaModel();
            model = pro.GetMrityuDartaRecords(1, id, 0, 0);
            return PartialView("_PrintDarta",model);
        }
        public ActionResult Details(int? id)
        {
            var model = new MrityuDartaModel();
            model = pro.GetMrityuDartaRecords(1, id, 0, 0);
            return PartialView("VUC_Details", model);
        }
        public ActionResult Report()
        {
            var model = new MrityuDartaModel();
            return View(model);
        }
        public ActionResult GetReport(int? faramno, int? fiscalyear, int page = 1)
        {
            var model = new MrityuDartaModel();
            model.MrityuDartaModelList = pro.GetSearchList(faramno, fiscalyear);
            ViewBag.currentPage = page;
            return PartialView("_Report", model);
        }
        public ActionResult PrintReport(int? faramno, int? fiscalyear, int page = 1)
        {
            var model = new MrityuDartaModel();
            model.MrityuDartaModelList = pro.GetSearchList(faramno, fiscalyear);
            ViewBag.currentPage = page;
            return View("_Report", model);
        }
	}
}