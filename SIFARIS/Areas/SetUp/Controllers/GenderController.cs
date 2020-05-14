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
    public class GenderController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        AssistProvider pro = new AssistProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllGenderList(int page = 1)
        {
            var pagesize = Utility.PageSize;
            List<GenderModel> data = new List<GenderModel>();
            data = pro.GetGenderList();
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id, int page = 1)
        {
            var pagesize = Utility.PageSize;
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
