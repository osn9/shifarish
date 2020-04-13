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
    public class StateController : ApiController
    {
        private CommonProvider pro = new CommonProvider();
        // Get api/State
        public IEnumerable<StateViewModel> GetStates()
        {
            return pro.GetAllState();
        }

        // POST: api/State
        //[ResponseType(typeof(StateViewModel))]
        public IHttpActionResult PostStateInfo(StateViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            bool status = false;
            try
            {
                status = pro.InsertState(model);
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

        // Get api/State/{id}
        [ResponseType(typeof(StateViewModel))]
        public IHttpActionResult GetStateInfo(int id)
        {
            var data = pro.GetStateDetailsById(id);
            if (data != null)
                return Ok(data);
            else
                return NotFound();
        }

        // PUT: api/State/{id}
        [ResponseType(typeof(StateViewModel))]
        public IHttpActionResult PutUserInfo(long id, StateViewModel model)
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
                status = pro.InsertState(model);
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
