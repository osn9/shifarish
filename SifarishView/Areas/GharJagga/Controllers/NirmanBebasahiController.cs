﻿using SifarishView.Areas.GharJagga.Models;
using SifarishView.Areas.GharJagga.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace SifarishView.Areas.GharJagga.Controllers
{
    public class NirmanBebasahiController : Controller
    {
        // GET: GharJagga/NirmanBebasahi
        public ActionResult Index()
        {
            IEnumerable<NirmanBebasahiViewModel> DataList;
            var accesstoken = Session["accesstoken"];
            GlobalVariables.webApiClient.DefaultRequestHeaders.Clear();

            GlobalVariables.webApiClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + accesstoken);
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NirmanBebasahi").Result;

            if (response.IsSuccessStatusCode)
            {
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<IEnumerable<NirmanBebasahiViewModel>>(result.obj.ToString());
                    return View(DataList);
                }

            }
            return View(new NirmanBebasahiViewModel());
        }

        // GET: GharJagga/NirmanBebasahi/Details/5
        public ActionResult Details(int id)
        {
            NirmanBebasahiViewModel DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NirmanBebasahi/" + id).Result;

            if (response.IsSuccessStatusCode)
            {
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<NirmanBebasahiViewModel>(result.obj.ToString());
                    return View(DataList);
                }

            }
            // DataList = response.Content.ReadAsAsync<CitizenInfoViewModel>().Result;
            return View(new NirmanBebasahiViewModel());
        }

        // GET: GharJagga/NirmanBebasahi/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: GharJagga/NirmanBebasahi/Create
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

        // GET: GharJagga/NirmanBebasahi/Edit/5
        public ActionResult AddOrEdit(int id)
        {
            if (id == 0)
            {
                return View(new NirmanBebasahiViewModel());
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NirmanBebasahi/" + id).Result;
                //return View(response.Content.ReadAsAsync<CitizenInfoViewModel>().Result);
                NirmanBebasahiViewModel DataList = new NirmanBebasahiViewModel();
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<NirmanBebasahiViewModel>(result.obj.ToString());
                    return View(DataList);
                }
                return View(new NirmanBebasahiViewModel());
            }
        }

        // POST: GharJagga/NirmanBebasahi/Edit/5
        [HttpPost]
        public ActionResult AddOrEdit(int id, NirmanBebasahiViewModel model)
        {
            try
            {
                // TODO: Add update logic here
                if (!ModelState.IsValid)
                {
                    return View(model);
                }
                HttpResponseMessage response;
                if (model.nirmanbebasaiId > 0)
                {
                    response = GlobalVariables.webApiClient.PutAsJsonAsync("NirmanBebasahi/" + model.nirmanbebasaiId, model).Result;
                }
                else
                {
                    response = GlobalVariables.webApiClient.PostAsJsonAsync("NirmanBebasahi", model).Result;
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

        // GET: GharJagga/NirmanBebasahi/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: GharJagga/NirmanBebasahi/Delete/5
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