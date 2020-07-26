using Sifaris.Models;
using Sifaris.Providers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sifaris.Controllers
{
    public class FiscalYearController : Controller
    {
        //
        // GET: /FiscalYear/
        FiscalYearProvider pro = new FiscalYearProvider();
        public ActionResult Index()
        {
            FiscalYearModel model = new FiscalYearModel();
            model.FiscalYearModelList = pro.PopulateRecords().OrderByDescending(x => x.FiscalYear).ToList();


            return View(model);
        }
        public ActionResult Create()
        {
            //int empId = Utility.GetEmployeeId(Utility.GetCurrentLoginUser());
            //int userTypeId = Utility.GetEmployeeUserTypeId(empId);
            //var auth = Utility.CheckCreateRightsForLoggedInUser("AssestRecords", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}
            FiscalYearModel model = new FiscalYearModel();
            return View(model);

        }

        [HttpPost]
        public ActionResult Create(FiscalYearModel model)
        {
            if (ModelState.IsValid)
            {
                if (pro.InsertFiscalYear(model))
                {
                    TempData["SuccessMessage"] = "Data has been Saved succeessfully";

                }
                else
                    TempData["SuccessMessage"] = "Data has Not been Saved succeessfully";
            }
            return RedirectToAction("Index");
        }

        public ActionResult Edit(int id)
        {
            FiscalYearModel model = new FiscalYearModel();
            model = pro.PopulateRecords().Where(x => x.FiscalYearId == id).FirstOrDefault();



            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(int id, FiscalYearModel model)
        {
            if (ModelState.IsValid)
            {
                if (pro.EditFiscalYear(id, model))
                {
                    TempData["SuccessMessage"] = "Data has been Updated succeessfully";
                }
                else
                    TempData["SuccessMessage"] = "Data has Not been Updated succeessfully";
            }
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            if (ModelState.IsValid)
            {
                if (pro.DeleteFiscalYear(id))
                {
                    TempData["SuccessMessage"] = "Data has been Deleted succeessfully";
                }
                else
                    TempData["SuccessMessage"] = "Data has Not been Deleted succeessfully";
            }
            return RedirectToAction("Index");
        }
        
	}
}