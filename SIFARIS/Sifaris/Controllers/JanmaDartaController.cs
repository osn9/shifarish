using Sifaris.Models;
using Sifaris.Providers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sifaris.Controllers
{
    public class JanmaDartaController : Controller
    {
        //
        // GET: /JanmaDarta/
        JanmaDartaProvider pro = new JanmaDartaProvider();
        public ActionResult Index(int?id,int page=1)
        {
            int pagesize = Utility.PageSize;
            JanmaDartaModel model = new JanmaDartaModel();
            model.JanmaDartaModelList=pro.GetJanmaDartaRecordsList(1,id,page,pagesize);           
            ViewBag.currentPage = page;
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            JanmaDartaModel model = new JanmaDartaModel();            
            model.JanmaFaramDartaNo = Utility.GetMaxJanmaDartaNo(Utility.JanmaSifaris);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(JanmaDartaModel model)
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
            var model = new JanmaDartaModel();
            model = pro.GetJanmaDartaRecords(1,id,0,0);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(int id,JanmaDartaModel model)
        {
            if (ModelState.IsValid)
            {
                model.NewbornId = id;
                pro.Update(model);
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult PrintDarta(int? id)
        {
            var model = new JanmaDartaModel();
            model = pro.GetJanmaDartaRecords(1, id, 0, 0);
            return PartialView("_PrintDarta",model);
        }
        public ActionResult Details(int? id)
        {
            var model = new JanmaDartaModel();
            model = pro.GetJanmaDartaRecords(1, id, 0, 0);
            return PartialView("VUC_Details", model);
        }
        public ActionResult Report()
        {
            var model = new JanmaDartaModel();
            return View(model);
        }
        public ActionResult GetReport(int? faramno,int? fiscalyear,int page=1)
        {
            var model = new JanmaDartaModel();
           // model = pro.GetpanjiDescription(fiscalyear);
            model.JanmaDartaModelList = pro.GetSearchList(faramno,fiscalyear);
            ViewBag.currentPage = page;
            return PartialView("_Report",model);
        }
        public ActionResult PrintReport(int? faramno, int? fiscalyear, int page = 1)
        {
            var model = new JanmaDartaModel();
            model.JanmaDartaModelList = pro.GetSearchList(faramno, fiscalyear);
            ViewBag.currentPage = page;
            return View("_Report",model);
        }
	}
}