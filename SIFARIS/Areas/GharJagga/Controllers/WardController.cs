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
    public class WardController : ApiController
    {
        private CommonProvider pro = new CommonProvider();

        public IEnumerable<WardViewModel> GetLocalLevel()
        {
            return pro.GetAllWard();
        }
        public IHttpActionResult GetWardInfo(int id)
        {
            var data = pro.GetWardDetailsById(id);
            if (data != null)
                return Ok(data);
            else
                return NotFound();
        }
        public IHttpActionResult PostDistrictInfo(WardViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            bool status = false;
            try
            {
                status = pro.InsertWard(model);
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
        public IHttpActionResult PutUserInfo(long id, WardViewModel model)
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
                status = pro.InsertWard(model);
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
