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
    public class JanmaKisimController : ApiController
    {
        AssistProvider pro = new AssistProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllJanmaKisimList()
        {
            List<JanmaKisismModel> data = new List<JanmaKisismModel>();
            data = pro.GetJanmaKisimList();
            return Ok(data);
        }
    }
}
