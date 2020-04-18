﻿using Newtonsoft.Json;
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
    public class CitizenInfoController : Controller
    {
        //[Authorize]
        // GET: GharJagga/CitizenInfo
        [HandleError]
        public ActionResult Index()
        {

            IEnumerable<CitizenInfoViewModel> DataList;
            var accesstoken = Session["accesstoken"];
            GlobalVariables.webApiClient.DefaultRequestHeaders.Clear();

            GlobalVariables.webApiClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + accesstoken);
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Citizen").Result;
            
            if (response.IsSuccessStatusCode)
            { 
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
            if (result.obj.ToString() != null)
            {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<IEnumerable<CitizenInfoViewModel>>(result.obj.ToString());
                    return View(DataList);
                }
          
        }
            return View(new CitizenInfoViewModel());
        }

        // GET: GharJagga/CitizenInfo/Details/5
        public ActionResult Details(int id)
        {
            CitizenInfoViewModel DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Citizen/" + id).Result;

            if (response.IsSuccessStatusCode)
            {
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<CitizenInfoViewModel>(result.obj.ToString());
                    return View(DataList);
                }

            }
            // DataList = response.Content.ReadAsAsync<CitizenInfoViewModel>().Result;
            return View(new CitizenInfoViewModel());

        }

        // GET: GharJagga/CitizenInfo/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: GharJagga/CitizenInfo/Create
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

        // GET: GharJagga/CitizenInfo/Edit/5
        public ActionResult AddOrEdit(int id)
        {
            if (id == 0)
            {
                return View(new CitizenInfoViewModel());
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("Citizen/" + id).Result;
                //return View(response.Content.ReadAsAsync<CitizenInfoViewModel>().Result);
                CitizenInfoViewModel DataList = new CitizenInfoViewModel();
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<CitizenInfoViewModel>(result.obj.ToString());
                    return View(DataList);
                }
                return View(new CitizenInfoViewModel());
            }
            //return View();
        }

        // POST: GharJagga/CitizenInfo/Edit/5
        [HttpPost]
        public ActionResult AddOrEdit( CitizenInfoViewModel model)
        {
            try
            {
                // TODO: Add update logic here
                if (!ModelState.IsValid)
                {
                    return View(model);
                }
                HttpResponseMessage response;
                if (model.Id > 0)
                {
                    response = GlobalVariables.webApiClient.PutAsJsonAsync("Citizen/" + model.Id, model).Result;
                }
                else
                {
                    response = GlobalVariables.webApiClient.PostAsJsonAsync("Citizen", model).Result;
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

        // GET: GharJagga/CitizenInfo/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: GharJagga/CitizenInfo/Delete/5
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