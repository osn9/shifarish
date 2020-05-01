using SIFARIS.Areas.GharJagga.Models;
using SIFARIS.Areas.GharJagga.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SIFARIS.Areas.GharJagga.Controllers
{
    public class GharBatoController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        GharBatoProvider pro = new GharBatoProvider();
        Server_Response res = new Server_Response();
        // GET: api/GharBato
        public IHttpActionResult Get()
        {
            List<gahrBatoViewModel> data = new List<gahrBatoViewModel>();
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

        // GET: api/GharBato/5
        public IHttpActionResult Get(int id)
        {
            gahrBatoViewModel model = new gahrBatoViewModel();
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

        // POST: api/GharBato
        public IHttpActionResult Post(gahrBatoViewModel model)
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

        // PUT: api/GharBato/5
        public IHttpActionResult Put(int id, gahrBatoViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            if (id != model.id)
            {
                return BadRequest();
            }
            model.id = id;
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

        // DELETE: api/GharBato/5
        public void Delete(int id)
        {
        }
    }
}
