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
    public class VivahDartaController : ApiController
    {
        VivahDartaProvider pro = new VivahDartaProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllList(int page = 1)
        {
            var pagesize = Utility.PageSize;
            List<VivahDartaModel> data = new List<VivahDartaModel>();
            data = pro.GetVivahDartaRecordsList(1, null, page, pagesize);
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id, int page = 1)
        {
            var pagesize = Utility.PageSize;
            VivahDartaModel model = new VivahDartaModel();
            if (id != null)
            {
                model = pro.GetVivahDartaRecords(1, id, page, pagesize);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound, "Record Not Found");

        }
        [System.Web.Http.HttpPost]
        public IHttpActionResult CreateNewRecord(VivahDartaModel model)
        {
            pro.Insert(model);
            return Content(HttpStatusCode.Created, "Created Successfully");
        }
        [System.Web.Http.HttpPut]
        public IHttpActionResult EditRecord(int id, VivahDartaModel model)
        {
            model.NewMarriageId = id;
            pro.Update(model);
            return Content(HttpStatusCode.OK, "Updated Successfully");
        }
    }
}
