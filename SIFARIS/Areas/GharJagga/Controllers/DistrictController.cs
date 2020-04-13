using SIFARIS.Areas.GharJagga.Models;
using SIFARIS.Areas.GharJagga.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace SIFARIS.Areas.GharJagga.Controllers
{
    public class DistrictController : ApiController
    {
        private CommonProvider pro = new CommonProvider();
        // Get api/District
        public IEnumerable<DistrictViewModel> GetDistrict()
        {
            return pro.GetAllDistrict();
        }
        // POST: api/District
        [ResponseType(typeof(DistrictViewModel))]
        public IHttpActionResult PostStateInfo(DistrictViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            bool status = false;
            try
            {
                status = pro.InsertDistrict(model);
            }
            catch (Exception)
            {
                return BadRequest();
            }
            if (status)
                return StatusCode(HttpStatusCode.NoContent);
            else
                return BadRequest(ModelState);
        }
        // Get api/District/{id}
        [ResponseType(typeof(DistrictViewModel))]
        public IHttpActionResult GetDistrictInfo(int id)
        {
            var data = pro.GetDistrictsDetailsById(id);
            if (data != null)
                return Ok(data);
            else
                return NotFound();
        }
        // PUT: api/District/{id}
        [ResponseType(typeof(DistrictViewModel))]
        public IHttpActionResult PutUserInfo(long id, DistrictViewModel model)
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
                status = pro.InsertDistrict(model);
            }
            catch (Exception ed)
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
