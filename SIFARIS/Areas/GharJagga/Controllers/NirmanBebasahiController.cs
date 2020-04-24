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
    public class NirmanBebasahiController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        NirmanbebashiProvider pro = new NirmanbebashiProvider();
        Server_Response res = new Server_Response();
        // GET: api/NirmanBebasahi
        public IHttpActionResult Get()
        {
            List<NirmanBebasahiViewModel> data = new List<NirmanBebasahiViewModel>();
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

        // GET: api/NirmanBebasahi/5
        public IHttpActionResult Get(int id)
        {
            NirmanBebasahiViewModel model = new NirmanBebasahiViewModel();
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

        // POST: api/NirmanBebasahi
        public IHttpActionResult Post(NirmanBebasahiViewModel model)
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

        // PUT: api/NirmanBebasahi/5
        public IHttpActionResult Put(int id, NirmanBebasahiViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            if (id != model.nirmanbebasaiId)
            {
                return BadRequest();
            }
            model.nirmanbebasaiId = id;
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

        // DELETE: api/NirmanBebasahi/5
        public void Delete(int id)
        {
        }
    }
}
