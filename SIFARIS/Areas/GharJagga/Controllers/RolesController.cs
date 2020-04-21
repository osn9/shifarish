using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using SIFARIS;
using SIFARIS.Areas.GharJagga.Provider;
using SIFARIS.Models;

namespace SIFARIS.Areas.GharJagga.Controllers
{
    public class RolesController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        CommonProvider pro = new CommonProvider();
        Server_Response res = new Server_Response();
        // GET: api/Roles
        public IHttpActionResult GetAspNetRoles()
        {
            List<roleViewModel> data = new List<roleViewModel>();
            try
            {
                data = pro.GetAllRole();
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

        // GET: api/Roles/5
        [ResponseType(typeof(AspNetRole))]
        public IHttpActionResult GetAspNetRole(string id)
        {
            roleViewModel model = new roleViewModel();
            try
            {
                model = pro.GetRoleById(id);
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
        [HttpGet]
        [Route("api/GetUserAndRole")]
        public IHttpActionResult GetUserAndRole()
        {
            List<RegisterBindingModel> data = new List<RegisterBindingModel>();
            try
            {
                data = pro.getUserwithRole();
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
        [HttpGet]

        [Route("api/GetUser/{name}")]
        public IHttpActionResult GetUserAndRole(string name)
        {
            RegisterBindingModel data = new RegisterBindingModel();
            try
            {
                data = pro.getUserwithRoleById(name);
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

        [Route("api/Getrolename")]
        public IHttpActionResult GetRoles()
        {
            List<roleViewModel> data = new List<roleViewModel>();
            try
            {
                data = pro.GetAllRoleName();
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
        // PUT: api/Roles/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutAspNetRole(string id, AspNetRole aspNetRole)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != aspNetRole.Id)
            {
                return BadRequest();
            }

            db.Entry(aspNetRole).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AspNetRoleExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Roles
        [ResponseType(typeof(AspNetRole))]
        public IHttpActionResult PostAspNetRole(AspNetRole aspNetRole)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.AspNetRoles.Add(aspNetRole);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (AspNetRoleExists(aspNetRole.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = aspNetRole.Id }, aspNetRole);
        }

        // DELETE: api/Roles/5
        [ResponseType(typeof(AspNetRole))]
        public IHttpActionResult DeleteAspNetRole(string id)
        {
            AspNetRole aspNetRole = db.AspNetRoles.Find(id);
            if (aspNetRole == null)
            {
                return NotFound();
            }

            db.AspNetRoles.Remove(aspNetRole);
            db.SaveChanges();

            return Ok(aspNetRole);
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AspNetRoleExists(string id)
        {
            return db.AspNetRoles.Count(e => e.Id == id) > 0;
        }
    }
}