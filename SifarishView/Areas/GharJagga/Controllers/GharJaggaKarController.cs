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
    public class GharJaggaKarController : Controller
    {
        // GET: GharJagga/GharJaggaKar
        public ActionResult Index()
        {

            IEnumerable<GharJaggaKarViewModel> DataList;
            var accesstoken = Session["accesstoken"];
            GlobalVariables.webApiClient.DefaultRequestHeaders.Clear();

            GlobalVariables.webApiClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + accesstoken);
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("GharJaggaKar").Result;

            if (response.IsSuccessStatusCode)
            {
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<IEnumerable<GharJaggaKarViewModel>>(result.obj.ToString());
                    return View(DataList);
                }

            }
            return View(new GharJaggaKarViewModel());
        }

        // GET: GharJagga/GharJaggaKar/Details/5
        public ActionResult Details(int id)
        {
            GharJaggaKarViewModel DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("GharJaggaKar/" + id).Result;

            if (response.IsSuccessStatusCode)
            {
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<GharJaggaKarViewModel>(result.obj.ToString());
                    return View(DataList);
                }

            }
            // DataList = response.Content.ReadAsAsync<CitizenInfoViewModel>().Result;
            return View(new GharJaggaKarViewModel());
        }

        // GET: GharJagga/GharJaggaKar/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: GharJagga/GharJaggaKar/Create
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

        // GET: GharJagga/GharJaggaKar/Edit/5
        public ActionResult AddOrEdit(int id)
        {
            if (id == 0)
            {
                return View(new GharJaggaKarViewModel());
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("GharJaggaKar/" + id).Result;
                //return View(response.Content.ReadAsAsync<CitizenInfoViewModel>().Result);
                GharJaggaKarViewModel DataList = new GharJaggaKarViewModel();
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<GharJaggaKarViewModel>(result.obj.ToString());
                    return View(DataList);
                }
                return View(new GharJaggaKarViewModel());
            }
        }

        // POST: GharJagga/GharJaggaKar/Edit/5
        [HttpPost]
        public ActionResult AddOrEdit(int id, GharJaggaKarViewModel model)
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
                    response = GlobalVariables.webApiClient.PutAsJsonAsync("GharJaggaKar/" + model.id, model).Result;
                }
                else
                {
                    response = GlobalVariables.webApiClient.PostAsJsonAsync("GharJaggaKar", model).Result;
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

        // GET: GharJagga/GharJaggaKar/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: GharJagga/GharJaggaKar/Delete/5
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
