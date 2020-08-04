using SIFARIS.Areas.SetUp.Models;
using SIFARIS.Areas.SetUp.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SIFARIS.Areas.SetUp.Controllers
{
    public class FiscalYearController : ApiController
    {
        FiscalYearProvider pro = new FiscalYearProvider();

        [System.Web.Http.HttpGet]
        public IHttpActionResult GetAllList()
        {
            List<FiscalYearModel> data = new List<FiscalYearModel>();
            data = pro.PopulateRecords();
            return Ok(data);
        }

        [System.Web.Http.HttpPost]
        public IHttpActionResult CreateNewRecord(FiscalYearModel model)
        {
            bool status = false;
            try
            {
                status = pro.InsertFiscalYear(model);
            }
            catch (Exception)
            {
                return BadRequest();
            }
            if (status)
                return StatusCode(HttpStatusCode.NoContent);
            else
                return BadRequest();
        }
        [System.Web.Http.HttpPut]
        public IHttpActionResult EditRecord(int id, FiscalYearModel model)
        {
            model.FiscalYearId = id;
            bool status = false;
            try
            {
                status = pro.EditFiscalYear(model.FiscalYearId, model);
            }
            catch (Exception)
            {
                return BadRequest();
            }
            if (status)
                return StatusCode(HttpStatusCode.NoContent);
            else
                return BadRequest();


        }
    }
}
