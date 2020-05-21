﻿using SIFARIS.Areas.SetUp.Models;
using SIFARIS.Areas.SetUp.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SIFARIS.Areas.SetUp.Controllers
{
    public class OccupationController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        AssistProvider pro = new AssistProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllOccupationList(int page = 1)
        {
            var pagesize = Utility.PageSize;
            List<OccupationModel> data = new List<OccupationModel>();
            data = pro.GetOccupationList();
            return Ok(data);
        }
    }
}