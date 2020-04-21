﻿using SIFARIS.Areas.GharJagga.Models;
using SIFARIS.Areas.GharJagga.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SIFARIS.Areas.GharJagga.Controllers
{

    public class DepartmentController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        Departmentprovider pro = new Departmentprovider();
        Server_Response res = new Server_Response();
        // GET: api/Department
        public IHttpActionResult Get()
        {
            List<DepartmentModel> data = new List<DepartmentModel>();
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

        // GET: api/Department/5
        public IHttpActionResult Get(int id)
        {
            DepartmentModel model = new DepartmentModel();
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

        // POST: api/Department
        public IHttpActionResult Post(DepartmentModel model)
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

        // PUT: api/Department/5
        public IHttpActionResult Put(int id, DepartmentModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            if (id != model.DeparmentId)
            {
                return BadRequest();
            }
            model.DeparmentId = id;
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

        // DELETE: api/Department/5
        public void Delete(int id)
        {
        }
    }
}
