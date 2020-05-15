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
    public class BasaisaraiDartaController : ApiController
    {
        BasaisaraiDartaProvider pro = new BasaisaraiDartaProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllList(int page = 1)
        {
            var pagesize = Utility.PageSize;
            List<BasaisaraiDartaModel> data = new List<BasaisaraiDartaModel>();
            data = pro.GetBasaisaaraiDartaRecordsList(1, null, page, pagesize);
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id, int page = 1)
        {
            var pagesize = Utility.PageSize;
            BasaisaraiDartaModel model = new BasaisaraiDartaModel();
            if (id != null)
            {
                model = pro.PopulateRecords(1, id);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound, "Record Not Found");

        }
        [System.Web.Http.HttpPost]
        public IHttpActionResult CreateNewRecord(BasaisaraiDartaModel model)
        {
            pro.Insert(model);
            return Content(HttpStatusCode.Created, "Created Successfully");
        }
        [System.Web.Http.HttpPut]
        public IHttpActionResult EditRecord(int id, BasaisaraiDartaModel model)
        {
            model.NewMigrationId = id;
            pro.Update(model);
            return Content(HttpStatusCode.OK, "Updated Successfully");
        }
    }
}
