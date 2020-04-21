using SIFARIS.Areas.GharJagga.Models;
using SIFARIS.Areas.GharJagga.Provider;
using SIFARIS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SIFARIS.Areas.GharJagga.Controllers
{
    public class FiscalyearController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        FiscalyearProvider pro = new FiscalyearProvider();
        Server_Response res = new Server_Response();
        // GET: api/Fiscalyear
        public IHttpActionResult Get()
        {
            List<FiscalyearViewModel> data = new List<FiscalyearViewModel>();
            try
            {
                data = pro.GetAll();
                res.obj = data;
                res.status = true;
                return Ok(res);
            }
            catch (Exception)
            {
                res.obj = data;
                res.status = false;
                return Ok(res);
                throw;
            }
        }

        // GET: api/Fiscalyear/5
        public IHttpActionResult Get(int id)
        {
            FiscalyearViewModel model = new FiscalyearViewModel();
            try
            {
                model = pro.GetById(id);
                res.obj = model;
                res.status = true;
                return Ok(res);
            }
            catch (Exception)
            {
                res.obj = model;
                res.status = false;
                return Ok(res);
                throw;
            }
        }

        // POST: api/Fiscalyear
        public IHttpActionResult Post(FiscalyearViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            bool status = false;
            try
            {
                status = pro.Insert(model);
            }
            catch (Exception es)
            {
                return BadRequest();
            }
            if (status)
                return StatusCode(HttpStatusCode.NoContent);
            else
                return BadRequest(ModelState);

        }

        // PUT: api/Fiscalyear/5
        public IHttpActionResult Put(int id, FiscalyearViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            if (id != model.FiscalId)
            {
                return BadRequest();
            }
            model.FiscalId = id;
            bool status = false;
            try
            {
                status = pro.Insert(model);
            }
            catch (Exception ex)
            {
                return BadRequest();
            }
            if (status)
                return StatusCode(HttpStatusCode.NoContent);
            else
                return BadRequest();
        }

        // DELETE: api/Fiscalyear/5
        public void Delete(int id)
        {
        }
    }
}
