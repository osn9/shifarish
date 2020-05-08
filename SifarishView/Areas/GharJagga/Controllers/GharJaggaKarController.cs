using Newtonsoft.Json;
using SifarishView.Areas.GharJagga.Models;
using SifarishView.Areas.GharJagga.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Hosting;
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
        public ActionResult Create(int id)
        {
            GhraJaggaKarFileViewModle model = new GhraJaggaKarFileViewModle();
            model.GhraJaggaKarId = id;
            return View(model);
        }

        // POST: GharJagga/GharJaggaKar/Create
        //[HttpPost]
        //public ActionResult Create(HttpPostedFileBase[] files, GhraJaggaKarFileViewModle model)
        //{
        //    var accesstoken = Session["accesstoken"];

        //    GlobalVariables.webApiClient.DefaultRequestHeaders.Clear();

        //    GlobalVariables.webApiClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + accesstoken);
        //    using (var client = new HttpClient())
        //    {
        //        var formDappta = new MultipartFormDataContent();
        //        string baseAddress = ConfigurationManager.AppSettings["BaseAddress"];
        //        //   webApiClient.BaseAddress = new Uri(baseAddress);
        //        client.BaseAddress = new Uri(baseAddress);

        //        using (var formData = new MultipartFormDataContent())
        //        {
        //            foreach (var file in files)
        //            {
        //                byte[] imgData;
        //                using (var reader = new BinaryReader(file.InputStream))
        //                {
        //                    imgData = reader.ReadBytes(file.ContentLength);
        //                }

        //                formData.Add(new StreamContent(new MemoryStream(imgData)), "image", file.FileName);
        //                formData.Add(new StringContent(JsonConvert.SerializeObject(model)), "model");
        //            }
        //            // var responsse = GlobalVariables.PostResponse("FileUpload", formData, Session["access_token"].ToString());
        //            // var response = client.PostAsync("http://localhost:25917/api/FileUpload").Result;
        //            //  var responsesss = client.PostAsync("http://localhost:25917/api/FileUpload", formData).Result;
        //            // HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("GharJaggaKar").Result;
        //            var response = client.PostAsync("http://localhost:62782/api/FileUpload", formData).Result;

        //            // var response = GlobalVariables.webApiClient.PostAsync("GharJaggaKarFile", formData).Result;
        //            if (!response.IsSuccessStatusCode)
        //            {
        //                return RedirectToAction("", new { id = 99 });
        //            }
        //            return View();
        //        }
        //    }
        //}



        [HttpPost]
        public ActionResult Create(HttpPostedFileBase[] files, GhraJaggaKarFileViewModle model)
        {
            var accesstoken = Session["accesstoken"];

            GlobalVariables.webApiClient.DefaultRequestHeaders.Clear();

            GlobalVariables.webApiClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + accesstoken);
            using (var client = new HttpClient())
            {
                var formDappta = new MultipartFormDataContent();
                GhraJaggaKarFileViewModle u = new GhraJaggaKarFileViewModle();
                /// u.Address = "asdasd";
                //u.DistrictId = 1;
                var id = model.GhraJaggaKarId.ToString();
                using (var formData = new MultipartFormDataContent())
                {
                    foreach (var file in files)
                    {
                        byte[] imgData;
                        using (var reader = new BinaryReader(file.InputStream))
                        {
                            imgData = reader.ReadBytes(file.ContentLength);
                        }

                        formData.Add(new StreamContent(new MemoryStream(imgData)), "image", file.FileName);
                        formData.Add(new StringContent(id), "Id");
                        formData.Add(new StringContent(JsonConvert.SerializeObject(u)), "u");
                    }
                    // var responsse = GlobalVariables.PostResponse("FileUpload", formData, Session["access_token"].ToString());
                    // var response = client.PostAsync("http://localhost:25917/api/FileUpload").Result;
                    //  var responsesss = client.PostAsync("http://localhost:25917/api/FileUpload", formData).Result;
                    // var response = GlobalVariables.webApiClient.PostAsync("GharJaggaKarFile", formData).Result;
                    var response = GlobalVariables.webApiClient.PostAsync("GharJaggaKarFile", formData).Result;
                    if (!response.IsSuccessStatusCode)
                    {
                        return RedirectToAction("Create", new { id = model.GhraJaggaKarId });
                    }
                        return RedirectToAction("Files", new { id = model.GhraJaggaKarId });
                }
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
        public ActionResult Files(int id)
        {
            if (id == 0)
            {
                return View(new GhraJaggaKarFileViewModle());
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("GharJaggaKarFile/" + id).Result;
                //return View(response.Content.ReadAsAsync<CitizenInfoViewModel>().Result);
                //GhraJaggaKarFileViewModle DataList = new GhraJaggaKarFileViewModle();
                IEnumerable<GhraJaggaKarFileViewModle> DataList;
                var result = response.Content.ReadAsAsync<Server_Response>().Result;
                if (result.obj.ToString() != null)
                {
                    DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<IEnumerable<GhraJaggaKarFileViewModle>>(result.obj.ToString());

                    // DataList = Newtonsoft.Json.JsonConvert.DeserializeObject<GhraJaggaKarFileViewModle>(result.obj.ToString());
                    return View(DataList);
                }
                return View(new GhraJaggaKarFileViewModle());
            }
        }
        public async Task<ActionResult> FilesDownload(int id)
        {
            if (id == 0)
            {
                return View(new GhraJaggaKarFileViewModle());
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("GharJaggaKarFile/Download/" + id).Result;
                var name = response.Content.Headers.ContentDisposition.FileName;
                string FileName = name.Trim();
                FileName = FileName.Replace(" ", "");
                if (response.IsSuccessStatusCode)
                {

                    System.Net.Http.HttpContent content = response.Content;
                    var contentStream = await content.ReadAsStreamAsync(); // get the actual content stream
                    return File(contentStream, "application/json", FileName);

                   // secondarymethod

                  //  using (var fs = new FileStream(
                   //     HostingEnvironment.MapPath(string.Format("~/Downloads/{0}", name)),
                  //      FileMode.CreateNew))
                  //  {
                   //     await response.Content.CopyToAsync(fs);
                  //  }

                }
                else
                {
                    throw new FileNotFoundException();
                }
                
               
            }
        }
    }
}
