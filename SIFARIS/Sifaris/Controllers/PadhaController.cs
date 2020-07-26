using Sifaris.Models;
using Sifaris.Providers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sifaris.Controllers
{
    public class PadhaController : Controller
    {
        //
        // GET: /Padha/
        PadhaProvider pro = new PadhaProvider();
        SifarisEntities db = new SifarisEntities();
        
        public ActionResult Index(int page = 1)
        {
            List<tblShreni> shreniList = Utility.GetShreniList();
            ViewBag.ListOfShreni = new SelectList(shreniList, "ShreniId", "ShreniName");

            int pagesize = 100;
            var model = new PadhaModel();
            model.PadhaModelList = pro.GetPadhaList(page, pagesize);
            ViewBag.currentPage = page;
            ViewBag.TotalPages = Math.Ceiling((double)pro.GetTotalItemCount() / pagesize);
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {

            List<tblShreni> shreniList = Utility.GetShreniList();
            ViewBag.ListOfShreni = new SelectList(shreniList, "ShreniId", "ShreniName");

            //int empId = Utility.GetEmployeeId(Utility.GetCurrentLoginUser());
            //int userTypeId = Utility.GetEmployeeUserTypeId(empId);
            //var auth = Utility.CheckCreateRightsForLoggedInUser("Padha", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}
            var model = new PadhaModel();
            return View(model);
        }

        [HttpPost]
        public ActionResult Create(PadhaModel model)
        {
            List<tblShreni> shreniList = Utility.GetShreniList();
            ViewBag.ListOfShreni = new SelectList(shreniList, "ShreniId", "ShreniName");

            if (ModelState.IsValid)
            {
                pro.Insert(model);
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index", "Padha");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {

            List<tblShreni> shreniList = Utility.GetShreniList();
            ViewBag.ListOfShreni = new SelectList(shreniList, "ShreniId", "ShreniName");

            //int empId = Utility.GetEmployeeId(Utility.GetCurrentLoginUser());
            //int userTypeId = Utility.GetEmployeeUserTypeId(empId);
            //var auth = Utility.CheckEditRightsForLoggedInUser("Padha", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}
            var model = new PadhaModel();
            model = pro.GetPadhaData(id);

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(PadhaModel model)
        {
            List<tblShreni> shreniList = Utility.GetShreniList();
            ViewBag.ListOfShreni = new SelectList(shreniList, "ShreniId", "ShreniName");

            if (ModelState.IsValid)
            {
                pro.Update(model);
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            //int empId = Utility.GetEmployeeId(Utility.GetCurrentLoginUser());
            //int userTypeId = Utility.GetEmployeeUserTypeId(empId);
            //var auth = Utility.CheckEditRightsForLoggedInUser("Padha", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}
            pro.Delete(id);
            return RedirectToAction("Index");
        }

        public ActionResult PartialCreate()
        {

            List<tblShreni> shreniList = Utility.GetShreniList();
            ViewBag.ListOfShreni = new SelectList(shreniList, "ShreniId", "ShreniName");

            //int empId = Utility.GetEmployeeId(Utility.GetCurrentLoginUser());
            //int userTypeId = Utility.GetEmployeeUserTypeId(empId);
            //var auth = Utility.CheckCreateRightsForLoggedInUser("Padha", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}
            var model = new PadhaModel();
            return PartialView("VUC_Add", model);
        }
	}
}