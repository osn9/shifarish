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
    public class VivahKisimController : ApiController
    {
        AssistProvider pro = new AssistProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllVivahKisimList()
        {
            List<VivahKisimModel> data = new List<VivahKisimModel>();
            data = pro.GetVivahKisimList();
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id)
        {
            VivahKisimModel model = new VivahKisimModel();
            if (id != null)
            {
                model = pro.GetVivahKisimRecords(id);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound, "Record Not Found");

        }
    }
}
