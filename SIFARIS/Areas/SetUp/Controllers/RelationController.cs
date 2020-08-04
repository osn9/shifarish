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
    public class RelationController : ApiController
    {
        AssistProvider pro = new AssistProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllRelationList()
        {
            List<RelationModel> data = new List<RelationModel>();
            data = pro.GetRelationList();
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id)
        {
            RelationModel model = new RelationModel();
            if (id != null)
            {
                model = pro.GetRelationRecords(id);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound, "Record Not Found");

        }
    }
}
