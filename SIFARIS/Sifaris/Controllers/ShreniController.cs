using Sifaris.Models;
using Sifaris.Providers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sifaris.Controllers
{
    public class ShreniController : Controller
    {
        //
        // GET: /Shreni/
        ShreniProvider pro = new ShreniProvider();
        SifarisEntities db = new SifarisEntities();        
        public ActionResult Index(int page = 1)
        {
            int pagesize = 100;
            var model = new ShreniModel();
            model.ShreniList = pro.GetShreniList(page, pagesize);
            ViewBag.currentPage = page;
            ViewBag.TotalPages = Math.Ceiling((double)pro.GetTotalItemCount() / pagesize);
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {

            //int empId = Utility.GetEmployeeId(Utility.GetCurrentLoginUser());
            //int userTypeId = Utility.GetEmployeeUserTypeId(empId);
            //var auth = Utility.CheckCreateRightsForLoggedInUser("Shreni", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}
            var model = new ShreniModel();
            return View(model);
        }

        [HttpPost]
        public ActionResult Create(ShreniModel model)
        {

            if (ModelState.IsValid)
            {
                pro.Insert(model);
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index", "Shreni");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {
            //int empId = Utility.GetEmployeeId(Utility.GetCurrentLoginUser());
            //int userTypeId = Utility.GetEmployeeUserTypeId(empId);
            //var auth = Utility.CheckEditRightsForLoggedInUser("Shreni", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}
            var model = new ShreniModel();
            model = pro.GetShreniData(id);

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(ShreniModel model)
        {
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
            //var auth = Utility.CheckEditRightsForLoggedInUser("Shreni", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}
            pro.Delete(id);
            return RedirectToAction("Index");
        }


        public ActionResult PartialCreate()
        {

            //int empId = Utility.GetEmployeeId(Utility.GetCurrentLoginUser());
            //int userTypeId = Utility.GetEmployeeUserTypeId(empId);
            //var auth = Utility.CheckCreateRightsForLoggedInUser("Shreni", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}
            var model = new ShreniModel();
            return PartialView("VUC_Add", model);
        }
	}
}