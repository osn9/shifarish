using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SIFARIS.Areas.GharJagga.Models;
using SIFARIS.Areas.GharJagga.Provider;


namespace SIFARIS.Areas.GharJagga.Controllers
{
    public class CitizenController : ApiController
    {
        private CitizeninfoProvier pro = new CitizeninfoProvier();
        Server_Response res = new Server_Response();
        // GET: api/Citizen
       // [Authorize]
        public IHttpActionResult Get()
        {
            List<CitizenInfoViewModel> data = new List<CitizenInfoViewModel>();
            try
            {
             data=pro.GetAll();
                res.obj = data;
                res.status = true;
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.obj = data;
                res.status = false;
                return Ok(res);
                throw;
            }
           
        }

        // GET: api/Citizen/5
        public IHttpActionResult Get(int id)
        {
            CitizenInfoViewModel model = new CitizenInfoViewModel();
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

        // POST: api/Citizen
        public IHttpActionResult Post(CitizenInfoViewModel model)
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

        // PUT: api/Citizen/5
        public IHttpActionResult Put(int id, CitizenInfoViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            if (id != model.Id)
            {
                return BadRequest();
            }
            model.Id = id;
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

        // DELETE: api/Citizen/5
        public void Delete(int id)
        {
        }
    }
}
