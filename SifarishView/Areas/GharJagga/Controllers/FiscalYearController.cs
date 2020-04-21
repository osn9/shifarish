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
    public class FiscalYearController : Controller
    {
        // GET: GharJagga/FiscalYear
        public ActionResult Index()
        {
            IEnumerable<FiscalYearViewModel> DataList;
            var accesstoken = Session["accesstoken"];
            GlobalVariables.webApiClient.DefaultRequestHeaders.Clear();

            GlobalVariables.webApiClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + accesstoken);
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Fiscalyear").Result;

            if (response.IsSuccessStatusCode)
            {
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<IEnumerable<FiscalYearViewModel>>(result.obj.ToString());
                    return View(DataList);
                }

            }
            return View(new FiscalYearViewModel());
        
        }

        // GET: GharJagga/FiscalYear/Details/5
        public ActionResult Details(int id)
        {
            FiscalYearViewModel DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Fiscalyear/" + id).Result;

            if (response.IsSuccessStatusCode)
            {
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<FiscalYearViewModel>(result.obj.ToString());
                    return View(DataList);
                }

            }
            // DataList = response.Content.ReadAsAsync<CitizenInfoViewModel>().Result;
            return View(new FiscalYearViewModel());
        }

        // GET: GharJagga/FiscalYear/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: GharJagga/FiscalYear/Create
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

        // GET: GharJagga/FiscalYear/Edit/5
        public ActionResult AddOrEdit(int id)
        {
            if (id == 0)
            {
                return View(new FiscalYearViewModel());
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Fiscalyear/" + id).Result;
                //return View(response.Content.ReadAsAsync<CitizenInfoViewModel>().Result);
                FiscalYearViewModel DataList = new FiscalYearViewModel();
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<FiscalYearViewModel>(result.obj.ToString());
                    return View(DataList);
                }
                return View(new FiscalYearViewModel());
            }
        }

        // POST: GharJagga/FiscalYear/Edit/5
        [HttpPost]
        public ActionResult AddOrEdit(FiscalYearViewModel model)
        {
            try
            {
                // TODO: Add update logic here
                if (!ModelState.IsValid)
                {
                    return View(model);
                }
                HttpResponseMessage response;
                if (model.FiscalId > 0)
                {
                    response = GlobalVariables.webApiClient.PutAsJsonAsync("Fiscalyear/" + model.FiscalId, model).Result;
                }
                else
                {
                    response = GlobalVariables.webApiClient.PostAsJsonAsync("Fiscalyear", model).Result;
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

        // GET: GharJagga/FiscalYear/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: GharJagga/FiscalYear/Delete/5
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
