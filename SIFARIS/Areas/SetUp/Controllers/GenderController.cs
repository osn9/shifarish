using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SIFARIS.Areas.SetUp.Models;
using SIFARIS.Areas.SetUp.Provider;

namespace SIFARIS.Areas.SetUp.Controllers
{
    public class GenderController : ApiController
    {
        AssistProvider pro = new AssistProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllGenderList()
        {
            List<GenderModel> data = new List<GenderModel>();
            data = pro.GetGenderList();
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id)
        {
            GenderModel model = new GenderModel();
            if (id != null)
            {
                model = pro.GetGenderRecords(id);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound, "Record Not Found");

        }
    }
}
