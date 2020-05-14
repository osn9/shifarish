using SIFARIS.Areas.SetUp.Models;
using SIFARIS.Areas.SetUp.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SIFARIS.Areas.SetUp.Controllers
{
    public class BasaisaraiKaranController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        AssistProvider pro = new AssistProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllList(int page = 1)
        {
            var pagesize = Utility.PageSize;
            List<BasaisaraiKaranModel> data = new List<BasaisaraiKaranModel>();
            data = pro.GetBasaisaraiKaranList();
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id, int page = 1)
        {
            var pagesize = Utility.PageSize;
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
