using Sifaris.Models;
using Sifaris.Providers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sifaris.Controllers
{
    public class BasaisaraiDartaController : Controller
    {
        //
        // GET: /BasaisaraiDarta/
        BasaisaraiDartaProvider pro = new BasaisaraiDartaProvider();
        public ActionResult Index(int? id,int page=1)
        {
            int pagesize = Utility.PageSize;
            var model = new BasaisaraiDartaModel();
            var data = pro.GetBasaisaraiDartaRecords(1, id, page, pagesize);
            model.BasaisaraiDartaModelList = data.BasaisaraiDartaModelList;
            ViewBag.currentPage = page;
            ViewBag.pageSize = pagesize;
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            BasaisaraiDartaModel model = new BasaisaraiDartaModel();
            model.BasaisaraiFaramDartaNo = Utility.GetMaxBasaisaraiDartaNo(Utility.BasaisaraiSifaris);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(BasaisaraiDartaModel model)
        {
            if (ModelState.IsValid)
            {
                var id=pro.Insert(model);
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index", new {id=id });
            }
            return View(model);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var model = new BasaisaraiDartaModel();
            model = pro.PopulateRecords(1, id);
            //model = pro.GetBasaisaaraiDartaRecordsList(1,id,0,0).Single(x=>x.NewMigrationId==id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(int id,BasaisaraiDartaModel model)
        {
            model.NewMigrationId = id;
            if (ModelState.IsValid)
            {
                var iids=pro.Update(model);
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index", new {id=iids });
            }
            return View(model);
            
        }
        public ActionResult PrintDarta(int? id)
        {
            var model = new BasaisaraiDartaModel();
            model = pro.GetBasaisaraiDartaRecords(1, id, 0, 0);
            return PartialView("_PrintDarta", model);
        }
        public ActionResult Details(int? id)
        {
            var model = new BasaisaraiDartaModel();
            model = pro.GetBasaisaraiDartaRecords(1, id, 0, 0);
            return PartialView("VUC_Details", model);
        }
        public ActionResult AddMultiRecord()
        {
            return PartialView("AddPersonalDetails", new BasaisaraiPersonalDetailsModel());
        }
        public ActionResult Report()
        {
            var model = new BasaisaraiDartaModel();
            return View(model);
        }
        public ActionResult GetReport(int? faramno, int? fiscalyear, int page = 1)
        {
            var model = new BasaisaraiDartaModel();
            model.BasaisaraiDartaModelList = pro.GetSearchList(faramno, fiscalyear);
            ViewBag.currentPage = page;
            return PartialView("_Report", model);
        }
        public ActionResult PrintReport(int? faramno, int? fiscalyear, int page = 1)
        {
            var model = new BasaisaraiDartaModel();
            model.BasaisaraiDartaModelList = pro.GetSearchList(faramno, fiscalyear);
            ViewBag.currentPage = page;
            return View("_Report", model);
        }
	}
}