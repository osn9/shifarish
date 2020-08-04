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
    public class StateDataController : ApiController
    {
        StateProvider pro = new StateProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllList()
        {
            List<StateModel> data = new List<StateModel>();
            data = pro.GetStateList();
            return Ok(data);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult GetRecordById(int? id)
        {
            StateModel model = new StateModel();
            if (id != null)
            {
                model = pro.GetStateRecords(id);
                return Ok(model);
            }
            return Content(HttpStatusCode.NotFound, "Record Not Found");

        }

    }
}