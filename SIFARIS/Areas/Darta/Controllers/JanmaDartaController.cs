using SIFARIS.Areas.JanmaDarta.Models;
using SIFARIS.Areas.JanmaDarta.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;

namespace SIFARIS.Areas.JanmaDarta.Controllers
{
    public class JanmaDartaController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        JanmaDartaProvider pro = new JanmaDartaProvider();
        
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllList(int page=1)
        {
            var pagesize = Utility.PageSize;
            List<JanmaDartaModel> data = new List<JanmaDartaModel>();
            data = pro.GetJanmaDartaRecordsList(1,null, page, pagesize);
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id, int page = 1)
        {
            var pagesize = Utility.PageSize;
            JanmaDartaModel model = new JanmaDartaModel();
            if (id !=null)
            {
                model = pro.GetJanmaDartaRecords(1, id, page, pagesize);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound,"Record Not Found");
            
        }
        [System.Web.Http.HttpPost]
        public IHttpActionResult CreateNewRecord(JanmaDartaModel model)
        {
             pro.Insert(model);
             return Content(HttpStatusCode.Created, "Created Successfully");
        }
        [System.Web.Http.HttpPut]
        public IHttpActionResult EditRecord(int id,JanmaDartaModel model)
        {
            model.NewbornId = id;
            pro.Update(model);
            return Content(HttpStatusCode.OK, "Updated Successfully");
        }
        //[System.Web.Http.Route("api/GetSearchList/{faramno:int?}/{fiscalyear:int?}")]

        //public IHttpActionResult GetSearchList(int? faramno,int? fiscalyear )
        //{
        //    List<JanmaDartaModel> data = new List<JanmaDartaModel>();
        //    data = pro.GetSearchList(faramno,fiscalyear);
        //    return Ok(data);
        //}
    }
}
