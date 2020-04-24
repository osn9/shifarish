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
    public class NirmanBebasahiApprovalController : Controller
    {
        // GET: GharJagga/NirmanBebasahiApproval
        public ActionResult Index()
        {
            IEnumerable<NirmanBebasahiApprovalViewModel> DataList;
            var accesstoken = Session["accesstoken"];
            GlobalVariables.webApiClient.DefaultRequestHeaders.Clear();

            GlobalVariables.webApiClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + accesstoken);
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NirmanBebasahiApproval").Result;

            if (response.IsSuccessStatusCode)
            {
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<IEnumerable<NirmanBebasahiApprovalViewModel>>(result.obj.ToString());
                    return View(DataList);
                }

            }
            return View(new NirmanBebasahiApprovalViewModel());
        }

        // GET: GharJagga/NirmanBebasahiApproval/Details/5
        public ActionResult Details(int id)
        {

            NirmanBebasahiApprovalViewModel DataList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NirmanBebasahiApproval/" + id).Result;

            if (response.IsSuccessStatusCode)
            {
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<NirmanBebasahiApprovalViewModel>(result.obj.ToString());
                    return View(DataList);
                }

            }
            // DataList = response.Content.ReadAsAsync<CitizenInfoViewModel>().Result;
            return View(new NirmanBebasahiApprovalViewModel());
        }

        // GET: GharJagga/NirmanBebasahiApproval/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: GharJagga/NirmanBebasahiApproval/Create
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

        // GET: GharJagga/NirmanBebasahiApproval/Edit/5
        public ActionResult AddOrEdit(int id)
        {
            if (id == 0)
            {
                return View(new NirmanBebasahiApprovalViewModel());
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("NirmanBebasahiApproval/" + id).Result;
                //return View(response.Content.ReadAsAsync<CitizenInfoViewModel>().Result);
                NirmanBebasahiApprovalViewModel DataList = new NirmanBebasahiApprovalViewModel();
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<NirmanBebasahiApprovalViewModel>(result.obj.ToString());
                    return View(DataList);
                }
                return View(new NirmanBebasahiApprovalViewModel());
            }
        }

        // POST: GharJagga/NirmanBebasahiApproval/Edit/5
        [HttpPost]
        public ActionResult AddOrEdit(int id, NirmanBebasahiApprovalViewModel model)
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
                    response = GlobalVariables.webApiClient.PutAsJsonAsync("NirmanBebasahiApproval/" + model.id, model).Result;
                }
                else
                {
                    response = GlobalVariables.webApiClient.PostAsJsonAsync("NirmanBebasahiApproval", model).Result;
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

        // GET: GharJagga/NirmanBebasahiApproval/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: GharJagga/NirmanBebasahiApproval/Delete/5
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
