using SIFARIS.Areas.JanmaDarta.Models;
using SIFARIS.Areas.JanmaDarta.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;

namespace SIFARIS.Areas.JanmaDarta.Controllers
{
    public class JanmaDartaController : ApiController
    {
        private SifarishEntities db = new SifarishEntities();
        JanmaDartaProvider pro = new JanmaDartaProvider();
        Server_Response res = new Server_Response();

        // GET: api/JanmaDarta
        public IHttpActionResult Get(int? id,int page=1)
        {
            int pagesize = Utility.PageSize;
            List<JanmaDartaModel> data = new List<JanmaDartaModel>();
            data = pro.GetJanmaDartaRecordsList(1,id,page,pagesize);
            return data;
            try
            {
                //data = pro.GetJanmaDartaRecordsList();
                //res.obj = data;
                //res.status = true;
                //return Ok(res);
            }
            catch (Exception)
            {
                //res.obj = data;
                //res.status = false;
                //return Ok(res);
                //throw;
            }
        }
    }
}
