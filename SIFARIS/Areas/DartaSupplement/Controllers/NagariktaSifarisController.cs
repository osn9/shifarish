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
    public class NagariktaSifarisController : ApiController
    {
        NagariktaSifarisProvider pro = new NagariktaSifarisProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllList(int page = 1)
        {
            var pagesize = Utility.PageSize;
            List<NagariktaSifarisModel> data = new List<NagariktaSifarisModel>();
            data = pro.GetNagariktaRecordList(1, null, page, pagesize);
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id, int page = 1)
        {
            var pagesize = Utility.PageSize;
            NagariktaSifarisModel model = new NagariktaSifarisModel();
            if (id != null)
            {
                model = pro.GetNagariktaRecord(1, id, page, pagesize);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound, "Record Not Found");

        }
        [System.Web.Http.HttpPost]
        public IHttpActionResult CreateNewRecord(NagariktaSifarisModel model)
        {
            pro.Insert(model);
            return Content(HttpStatusCode.Created, "Created Successfully");
        }
        [System.Web.Http.HttpPut]
        public IHttpActionResult EditRecord(int id, NagariktaSifarisModel model)
        {
            model.NewNagariktaId = id;
            pro.Update(model);
            return Content(HttpStatusCode.OK, "Updated Successfully");
        }
    }
}
