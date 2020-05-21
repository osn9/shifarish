using SIFARIS.Areas.DartaSupplement.Models;
using SIFARIS.Areas.DartaSupplement.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SIFARIS.Areas.DartaSupplement.Controllers
{
    public class NabalakSifarisController : ApiController
    {
        NabalakSifarisProvider pro = new NabalakSifarisProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllList(int page = 1)
        {
            var pagesize = Utility.PageSize;
            List<NabalakSifarisModel> data = new List<NabalakSifarisModel>();
            data = pro.GetNabalakRecordList(1, null, page, pagesize);
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id, int page = 1)
        {
            var pagesize = Utility.PageSize;
            NabalakSifarisModel model = new NabalakSifarisModel();
            if (id != null)
            {
                model = pro.GetNabalakRecord(1, id, page, pagesize);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound, "Record Not Found");

        }
        [System.Web.Http.HttpPost]
        public IHttpActionResult CreateNewRecord(NabalakSifarisModel model)
        {
            pro.Insert(model);
            return Content(HttpStatusCode.Created, "Created Successfully");
        }
        [System.Web.Http.HttpPut]
        public IHttpActionResult EditRecord(int id, NabalakSifarisModel model)
        {
            model.NabalakId = id;
            pro.Update(model);
            return Content(HttpStatusCode.OK, "Updated Successfully");
        }
    }
}
