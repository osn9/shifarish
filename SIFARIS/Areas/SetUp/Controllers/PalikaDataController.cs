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
    public class PalikaDataController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        PalikaProvider pro = new PalikaProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllList()
        {
            List<LocalLevelModel> data = new List<LocalLevelModel>();
            data = pro.GetPalikaList();
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id)
        {
            LocalLevelModel model = new LocalLevelModel();
            if (id != null)
            {
                model = pro.GetPalikaRecords(id);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound, "Record Not Found");

        }
    }
}
