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
    public class GharJaggaKarController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        GharJaggaKarProvide pro = new GharJaggaKarProvide();
        Server_Response res = new Server_Response();
        // GET: api/GharJaggaKar
        public IHttpActionResult Get()
        {
            List<GharJaggaKarViewModel> data = new List<GharJaggaKarViewModel>();
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

        // GET: api/GharJaggaKar/5
        public IHttpActionResult Get(int id)
        {
            GharJaggaKarViewModel model = new GharJaggaKarViewModel();
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

        // POST: api/GharJaggaKar
        public IHttpActionResult Post(GharJaggaKarViewModel model)
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

        // PUT: api/GharJaggaKar/5
        public IHttpActionResult Put(int id, GharJaggaKarViewModel model )
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

        // DELETE: api/GharJaggaKar/5
        public void Delete(int id)
        {
        }
    }
}
