using Sifaris.Models;
using Sifaris.Providers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sifaris.Controllers
{
    public class EmployeesController : Controller
    {
        //
        // GET: /Employees/
        EmployeeProvider pro = new EmployeeProvider();
        SifarisEntities db = new SifarisEntities();

        public ActionResult INVIdCheck(int INVId)
        {
            var any = db.tblEmployees.Any(x => x.INVId == INVId);
            if (any)
                return Json(true, JsonRequestBehavior.AllowGet);
            return Json(false, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Index(int page = 1)
        {

            
            int pagesize =Utility.PageSize ;
            var model = new EmployeesModel();

            model.EmployeesList = pro.GetEmployeesList(page, pagesize);

            ViewBag.currentPage = page;
            model.WorkOfficeId = 1;
            ViewBag.TotalPages = Math.Ceiling((double)pro.GetTotalItemCount() / pagesize);
            return View(model);
        }

        public ActionResult Create()
        {

            //int empId = Utility.GetEmployeeId(Utility.GetCurrentLoginUser());
            //int userTypeId = Utility.GetEmployeeUserTypeId(empId);
            //var auth = Utility.CheckCreateRightsForLoggedInUser("Employees", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}
            var model = new EmployeesModel();
            
            model.WorkOfficeId = 1;
            model.INVId = db.tblEmployees.Max(x => x.INVId) + 1;
            
            model.Status = true;
            return View(model);
        }

        [HttpPost]
        public ActionResult Create(EmployeesModel model)
        {
            IEnumerable<ModelError> allErrors = ModelState.Values.SelectMany(v => v.Errors);


            if (ModelState.IsValid)
            {
                model.INVId = db.tblEmployees.Max(x => x.INVId) + 1;
                //model.PSId = db.Employees.Max(x => x.PSId) + 1;
                model.WorkOfficeId = 1;
                pro.Insert(model);
                TempData["SuccessMessage"] = "Saved Successfully";
                
                return RedirectToAction("Index");
            }
            return View(model);
        }
        [HttpGet]
        public JsonResult GetPadha(int ID)
        {
            List<SelectListItem> padhaList = new List<SelectListItem>();
            using (SifarisEntities db = new SifarisEntities())
            {
                var pList = db.tblPadhas.Where(x => x.ShreniId == ID).ToList();
                foreach (var item in pList)
                {
                    padhaList.Add(new SelectListItem { Text = item.PadhaName, Value = item.PadhaId.ToString() });
                }
            }
            return Json(padhaList, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetDepartment(int ID)
        {
            List<SelectListItem> departmentList = new List<SelectListItem>();
            using (SifarisEntities db = new SifarisEntities())
            {
                var projectList = db.tblDepartments.Where(x => x.WorkOfficeId == ID).ToList();
                foreach (var item in projectList)
                {
                    departmentList.Add(new SelectListItem { Text = item.DepartmentName, Value = item.DepartmentId.ToString() });
                }
            }
            return Json(departmentList, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetShakha(int ID)
        {
            List<SelectListItem> shakhaList = new List<SelectListItem>();
            using (SifarisEntities db = new SifarisEntities())
            {
                var projectList = db.tblShakhas.Where(x => x.DepartmentId == ID).ToList();
                foreach (var item in projectList)
                {
                    shakhaList.Add(new SelectListItem { Text = item.ShakhaName, Value = item.ShakhaId.ToString() });
                }
            }
            return Json(shakhaList, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetEmployee(int PadhaId)
        {
            List<SelectListItem> employeeList = new List<SelectListItem>();
            using (SifarisEntities db = new SifarisEntities())
            {
                var projectList = db.tblEmployees.Where(x => x.PadhaId == PadhaId && x.EmployeeId != 1).ToList();
                foreach (var item in projectList)
                {
                    employeeList.Add(new SelectListItem { Text = item.EmployeeName + " [" + item.INVId + "]", Value = item.EmployeeId.ToString() });
                }
            }
            return Json(employeeList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Edit(int id)
        {

            //int empId = Utility.GetEmployeeId(Utility.GetCurrentLoginUser());
            //int userTypeId = Utility.GetEmployeeUserTypeId(empId);
            //var auth = Utility.CheckEditRightsForLoggedInUser("Employees", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}
            var model = new EmployeesModel();
            model = pro.GetEmployeesData(id);
            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(EmployeesModel model)
        {


            if (ModelState.IsValid)
            {

                model.WorkOfficeId = 1;
                pro.Update(model);
                TempData["SuccessMessage"] = "Updated Successfully";
                //bool isOldPasswordMatched = Membership.ValidateUser(model.UserName, model.Password);
                //if (isOldPasswordMatched)
                //{
                //    var token = WebSecurity.GeneratePasswordResetToken(model.UserName);
                //    WebSecurity.ResetPassword(token, model.Password);
                //}

                return RedirectToAction("Index");
            }
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            //int empId = Utility.GetEmployeeId(Utility.GetCurrentLoginUser());
            //int userTypeId = Utility.GetEmployeeUserTypeId(empId);
            //var auth = Utility.CheckEditRightsForLoggedInUser("Employees", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}
            //pro.Delete(id);
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {

            //int empId = Utility.GetEmployeeId(Utility.GetCurrentLoginUser());
            //int userTypeId = Utility.GetEmployeeUserTypeId(empId);
            //var auth = Utility.CheckReviewRightsForLoggedInUser("Employees", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}


            EmployeesModel uv = pro.GetEmployeesData(id);
            return PartialView("VUC_Details", uv);
        }
        //public ActionResult ResetPassword(int id)
        //{

        //    RegisterModel model = new RegisterModel();
        //    model.EmployeeId = id;

        //    model.UserName = Utility.GetUserNameByEmpId(id);
        //    if (model.UserName.Equals("Error"))
        //    {
        //        TempData["SuccessMessage"] = "User Doesn't exist, Create User First";
        //        return RedirectToAction("Index");
        //    }
        //    return View(model);
        //}

        //[HttpPost]
        //public ActionResult ResetPassword(RegisterModel model)
        //{
        //    bool changePasswordSucceeded;
        //    if (model.Password == model.ConfirmPassword)
        //    {

        //        var token = WebSecurity.GeneratePasswordResetToken(model.UserName);
        //        changePasswordSucceeded = WebSecurity.ResetPassword(token, model.Password);
        //        if (changePasswordSucceeded == true)
        //        {


        //            TempData["SuccessMessage"] = "Sucessfully changed Password for " + model.UserName;
        //            return RedirectToAction("Index", "Employees");
        //        }
        //        else
        //        {
        //            TempData["SuccessMessage"] = "Failed to change Password . Contact Admin";

        //            return RedirectToAction("Index", "Employees");
        //        }

        //    }
        //    else
        //    {
        //        TempData["SuccessMessage"] = "Password and Confirm Password do not match, Try again";
        //        return RedirectToAction("Index", "Employees");
        //    }


        //}

        public ActionResult PartialCreate()
        {

            //int empId = Utility.GetEmployeeId(Utility.GetCurrentLoginUser());
            //int userTypeId = Utility.GetEmployeeUserTypeId(empId);
            //var auth = Utility.CheckCreateRightsForLoggedInUser("Employees", userTypeId);
            //if (auth == false)
            //{
            //    return RedirectToAction("Index", "Home");
            //}
            var model = new EmployeesModel();            
            model.WorkOfficeId = 1;
            model.INVId = db.tblEmployees.Max(x => x.INVId) + 1;            
            model.Status = true;
            return PartialView("VUC_Add", model);
        }
        [HttpPost]
        public ActionResult PartialCreate(EmployeesModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    pro.Insert(model);
                    var model1 = new EmployeesModel();
                    return Json(new { success = true, msg = "Successfully updating Item", dropdown = model1.GetEmployeesList() }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { success = false, msg = "Error, Model State not Valid" }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception e)
            {
                return Json(new { success = false, msg = "Error Updating Item" }, JsonRequestBehavior.AllowGet);
            }

        }
	}
}