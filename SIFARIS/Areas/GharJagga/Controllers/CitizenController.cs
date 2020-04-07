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

        // GET: api/Citizen
        public IEnumerable<CitizenInfoViewModel> Get()
        {
            return  pro.GetAll(); 
        }

        // GET: api/Citizen/5
        public CitizenInfoViewModel Get(int id)
        {
            return pro.GetById(id);
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
            catch (Exception)
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
