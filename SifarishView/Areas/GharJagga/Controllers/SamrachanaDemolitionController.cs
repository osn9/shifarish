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
    public class SamrachanaDemolitionController : Controller
    {
        // GET: GharJagga/SamrachanaDemolition
        public ActionResult Index()
        {
            IEnumerable<SanrachanaDemolitionViewModel> DataList;
            var accesstoken = Session["accesstoken"];
            GlobalVariables.webApiClient.DefaultRequestHeaders.Clear();

            GlobalVariables.webApiClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + accesstoken);
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("SanrachanaDemolition").Result;

            if (response.IsSuccessStatusCode)
            {
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<IEnumerable<SanrachanaDemolitionViewModel>>(result.obj.ToString());
                    return View(DataList);
                }

            }
            return View(new SanrachanaDemolitionViewModel());
        }

        // GET: GharJagga/SamrachanaDemolition/Details/5
        public ActionResult Details(int id)
        {
            SanrachanaDemolitionViewModel DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("SanrachanaDemolition/" + id).Result;

            if (response.IsSuccessStatusCode)
            {
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<SanrachanaDemolitionViewModel>(result.obj.ToString());
                    return View(DataList);
                }

            }
            // DataList = response.Content.ReadAsAsync<CitizenInfoViewModel>().Result;
            return View(new SanrachanaDemolitionViewModel());
        }

        // GET: GharJagga/SamrachanaDemolition/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: GharJagga/SamrachanaDemolition/Create
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

        // GET: GharJagga/SamrachanaDemolition/Edit/5
        public ActionResult AddOrEdit(int id)
        {
            if (id == 0)
            {
                return View(new SanrachanaDemolitionViewModel());
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("SanrachanaDemolition/" + id).Result;
                //return View(response.Content.ReadAsAsync<CitizenInfoViewModel>().Result);
                SanrachanaDemolitionViewModel DataList = new SanrachanaDemolitionViewModel();
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<SanrachanaDemolitionViewModel>(result.obj.ToString());
                    return View(DataList);
                }
                return View(new SanrachanaDemolitionViewModel());
            }
        }

        // POST: GharJagga/SamrachanaDemolition/Edit/5
        [HttpPost]
        public ActionResult AddOrEdit(int id, SanrachanaDemolitionViewModel model)
        {
            try
            {
                // TODO: Add update logic here
                if (!ModelState.IsValid)
                {
                    return View(model);
                }
                HttpResponseMessage response;
                if (model.id > 0)
                {
                    response = GlobalVariables.webApiClient.PutAsJsonAsync("SanrachanaDemolition/" + model.id, model).Result;
                }
                else
                {
                    response = GlobalVariables.webApiClient.PostAsJsonAsync("SanrachanaDemolition", model).Result;
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

        // GET: GharJagga/SamrachanaDemolition/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: GharJagga/SamrachanaDemolition/Delete/5
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
