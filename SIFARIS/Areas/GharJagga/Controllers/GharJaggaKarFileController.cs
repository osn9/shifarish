using Newtonsoft.Json;
using SIFARIS.Areas.GharJagga.Models;
using SIFARIS.Areas.GharJagga.Provider;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Hosting;
using System.Web.Http;

namespace SIFARIS.Areas.GharJagga.Controllers
{
    public class GharJaggaKarFileController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        GharJaggaKarProvide pro = new GharJaggaKarProvide();
        Server_Response res = new Server_Response();
        // GET: api/GharJaggaKarFile
        public IHttpActionResult Gets( )
        {
                return Ok(res);

        }

        // GET: api/GharJaggaKarFile/5
        public IHttpActionResult Get(int id)
        {
            List<GhraJaggaKarFileViewModle> data = new List<GhraJaggaKarFileViewModle>();
            try
            {
                data = pro.GetFilesById(id);
                res.obj = data;
                res.status = true;
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.obj = data;
                res.status = false;
                return Ok(res);
                throw;
            }
        }
        [AllowAnonymous]
        // POST: api/GharJaggaKarFile
        public IHttpActionResult Post()
        {
            var httpContext = HttpContext.Current;
            GhraJaggaKarFileViewModle model = new GhraJaggaKarFileViewModle();

            bool status = false;
            try
            {
                // Check for any uploaded file  
                //var form = HttpContext.Current.Request.Form;
                //foreach (string key in form.AllKeys)
                //{
                //  //  Console.WriteLine("{0} - {1}", key, form[key]);
                //}
                foreach (string key in HttpContext.Current.Request.Form.AllKeys)
                {
                    if (key== "Id")
                    {
                        string value = HttpContext.Current.Request.Form[key].FirstOrDefault().ToString();

                        model.GhraJaggaKarId = Convert.ToInt32(value);
                    }
                   
                }
              
                if (httpContext.Request.Files.Count > 0)
                {
                    //Loop through uploaded files  
                    for (int i = 0; i < httpContext.Request.Files.Count; i++)
                    {
                        HttpPostedFile httpPostedFile = httpContext.Request.Files[i];
                        if (httpPostedFile != null)
                        {
                            // Construct file save path  
                            string Name = httpPostedFile.FileName.Trim();
                            Name = Name.Replace(" ", "");
                            string FileName = DateTime.Now.ToFileTime() + Name;
                            var fileSavePath = Path.Combine(HostingEnvironment.MapPath("~/Image/"), FileName);
                            //var fileSavePath = Path.Combine(HostingEnvironment.MapPath("~/Image/"), httpPostedFile.FileName);

                            // Save the uploaded file  
                            httpPostedFile.SaveAs(fileSavePath);
                            model.FilePath = fileSavePath;
                            model.FileName = Name;
                           
                           
                                status = pro.InsertFile(model);


                            // var provider = new MultipartMemoryStreamProvider();
                            // Request.Content.ReadAsMultipartAsync(provider);
                            // UserViewModel u = new UserViewModel();



                            //foreach (var requestContents in provider.Contents)
                            //{
                            //    if (requestContents.Headers.ContentDisposition.Name == "u")
                            //    {
                            //        GhraJaggaKarFileViewModle u;
                            //        u = JsonConvert.DeserializeObject<GhraJaggaKarFileViewModle>(requestContents.ReadAsStringAsync().Result);
                            //    }
                            //    //  requestContents.bod
                            //}
                        }
                    }
                }
            }
            catch
            {
                return BadRequest();
            }
            if (status)
                return StatusCode(HttpStatusCode.NoContent);
            else
                return BadRequest(ModelState);
        }

        // PUT: api/GharJaggaKarFile/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/GharJaggaKarFile/5
        public void Delete(int id)
        {
        }
        // [HttpPost
        [HttpGet]
        [Route("api/GharJaggaKarFile/Download/{id}")]
        public HttpResponseMessage Download(int id)
        {
           // string fileName ="sada";

            var filesData = pro.GetFilesByIdDownload(id);
            if (filesData!=null)
            {
                string filePath = filesData.FilePath;
                string filename = filesData.FileName;
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK);

                //Set the File Path.
              //  string filePath = HttpContext.Current.Server.MapPath("~/Image/") + fileName;

                //Check whether File exists.
                if (!File.Exists(filePath))
                {
                    //Throw 404 (Not Found) exception if File not found.
                    response.StatusCode = HttpStatusCode.NotFound;
                    response.ReasonPhrase = string.Format("File not found: {0} .", filePath);
                    throw new HttpResponseException(response);
                }

                //Read the File into a Byte Array.
                byte[] bytes = File.ReadAllBytes(filePath);

                //Set the Response Content.
                response.Content = new ByteArrayContent(bytes);

                //Set the Response Content Length.
                response.Content.Headers.ContentLength = bytes.LongLength;

                //Set the Content Disposition Header Value and FileName.
                response.Content.Headers.ContentDisposition = new ContentDispositionHeaderValue("attachment");
                response.Content.Headers.ContentDisposition.FileName = filename;

                //Set the File Content Type.
                response.Content.Headers.ContentType = new MediaTypeHeaderValue(MimeMapping.GetMimeMapping(filename));
                return response;
            }
            //Create HTTP Response.
            HttpResponseMessage responses = Request.CreateResponse(HttpStatusCode.OK);
            throw new HttpResponseException(responses);
        }
    }
}
