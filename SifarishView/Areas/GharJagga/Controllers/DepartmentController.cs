using SifarishView.Areas.GharJagga.Models;
using SifarishView.Areas.GharJagga.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace SifarishView.Areas.GharJagga.Controllers
{
    public class DepartmentController : Controller
    {
        // GET: GharJagga/Department
        public ActionResult Index()
        {
            IEnumerable<DepartmentViewModel> DataList;
            var accesstoken = Session["accesstoken"];
            GlobalVariables.webApiClient.DefaultRequestHeaders.Clear();

            GlobalVariables.webApiClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + accesstoken);
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Department").Result;

            if (response.IsSuccessStatusCode)
            {
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<IEnumerable<DepartmentViewModel>>(result.obj.ToString());
                    return View(DataList);
                }

            }
            return View(new FiscalYearViewModel());
        }

        // GET: GharJagga/Department/Details/5
        public ActionResult Details(int id)
        {
            DepartmentViewModel DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Department/" + id).Result;

            if (response.IsSuccessStatusCode)
            {
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<DepartmentViewModel>(result.obj.ToString());
                    return View(DataList);
                }

            }
            // DataList = response.Content.ReadAsAsync<CitizenInfoViewModel>().Result;
            return View(new DepartmentViewModel());
        }

        // GET: GharJagga/Department/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: GharJagga/Department/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: GharJagga/Department/Edit/5
        public ActionResult AddOrEdit(int id)
        {
            if (id == 0)
            {
                return View(new DepartmentViewModel());
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Department/" + id).Result;
                //return View(response.Content.ReadAsAsync<CitizenInfoViewModel>().Result);
                DepartmentViewModel DataList = new DepartmentViewModel();
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<DepartmentViewModel>(result.obj.ToString());
                    return View(DataList);
                }
                return View(new DepartmentViewModel());
            }
        }

        // POST: GharJagga/Department/Edit/5
        [HttpPost]
        public ActionResult AddOrEdit(int id, DepartmentViewModel model)
        {
            try
            {
                // TODO: Add update logic here
                if (!ModelState.IsValid)
                {
                    return View(model);
                }
                HttpResponseMessage response;
                if (model.DeparmentId > 0)
                {
                    response = GlobalVariables.webApiClient.PutAsJsonAsync("Department/" + model.DeparmentId, model).Result;
                }
                else
                {
                    response = GlobalVariables.webApiClient.PostAsJsonAsync("Department", model).Result;
                }

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    return View(model);
                }


                //               return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: GharJagga/Department/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: GharJagga/Department/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
