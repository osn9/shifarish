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
    public class JanmaMaddatController : ApiController
    {
        AssistProvider pro = new AssistProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllJanmaMaddatList()
        {
            var pagesize = Utility.PageSize;
            List<JanmadaMaddatModel> data = new List<JanmadaMaddatModel>();
            data = pro.GetJanmaMaddatList();
            return Ok(data);
        }
    }
}
