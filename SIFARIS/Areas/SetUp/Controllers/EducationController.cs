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
    public class EducationController : ApiController
    {
        AssistProvider pro = new AssistProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllEducationList()
        {
            var pagesize = Utility.PageSize;
            List<EducationModel> data = new List<EducationModel>();
            data = pro.GetEducationList();
            return Ok(data);
        }
    }
}
