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
    public class NataPramanitSifarisController : ApiController
    {
        NataPramanitSifarisProvider pro = new NataPramanitSifarisProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllList(int page = 1)
        {
            var pagesize = Utility.PageSize;
            List<NataPramanitSifarisModel> data = new List<NataPramanitSifarisModel>();
            data = pro.GetNataPramanitRecordsList(1, null, page, pagesize);
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id, int page = 1)
        {
            var pagesize = Utility.PageSize;
            NataPramanitSifarisModel model = new NataPramanitSifarisModel();
            if (id != null)
            {
                model = pro.PopulateNataPramanitRecords(1, id);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound, "Record Not Found");

        }
        [System.Web.Http.HttpPost]
        public IHttpActionResult CreateNewRecord(NataPramanitSifarisModel model)
        {
            pro.Insert(model);
            return Content(HttpStatusCode.Created, "Created Successfully");
        }
        [System.Web.Http.HttpPut]
        public IHttpActionResult EditRecord(int id, NataPramanitSifarisModel model)
        {
            model.NewNataId = id;
            pro.Update(model);
            return Content(HttpStatusCode.OK, "Updated Successfully");
        }
    }
}
