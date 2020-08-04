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
    public class BasaisaraiKaranController : ApiController
    {
        AssistProvider pro = new AssistProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllList()
        {
            List<BasaisaraiKaranModel> data = new List<BasaisaraiKaranModel>();
            data = pro.GetBasaisaraiKaranList();
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id)
        {
            BasaisaraiKaranModel model = new BasaisaraiKaranModel();
            if (id != null)
            {
                model = pro.GetBasaisaraiKaranRecords(id);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound, "Record Not Found");

        }
    }
}
