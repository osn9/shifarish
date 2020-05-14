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
    public class DistrictController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        DistrictProvider pro = new DistrictProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllList(int page = 1)
        {
            var pagesize = Utility.PageSize;
            List<DistrictModel> data = new List<DistrictModel>();
            data = pro.GetDistrictList();
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id, int page = 1)
        {
            var pagesize = Utility.PageSize;
            DistrictModel model = new DistrictModel();
            if (id != null)
            {
                model = pro.GetDistrictRecords(id);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound, "Record Not Found");

        }

    }
}
