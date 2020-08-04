using SIFARIS.Areas.Darta.Models;
using SIFARIS.Areas.Darta.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SIFARIS.Areas.Darta.Controllers
{
    public class DivorceDartaController : ApiController
    {
        DivorceDartaProvider pro = new DivorceDartaProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllList(int page = 1)
        {
            var pagesize = Utility.PageSize;
            List<DivorceDartaModel> data = new List<DivorceDartaModel>();
            data = pro.GetdivorceDartaRecordsList(1, null, page, pagesize);
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id, int page = 1)
        {
            var pagesize = Utility.PageSize;
            DivorceDartaModel model = new DivorceDartaModel();
            if (id != null)
            {
                model = pro.GetDivorceDartaRecords(1, id, page, pagesize);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound, "Record Not Found");

        }
        [System.Web.Http.HttpPost]
        public IHttpActionResult CreateNewRecord(DivorceDartaModel model)
        {
            pro.Insert(model);
            return Content(HttpStatusCode.Created, "Created Successfully");
        }
        [System.Web.Http.HttpPut]
        public IHttpActionResult EditRecord(int id, DivorceDartaModel model)
        {
            model.DivorceId = id;
            pro.Update(model);
            return Content(HttpStatusCode.OK, "Updated Successfully");
        }
    }
}
