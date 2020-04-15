using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SifarishView.Controllers
{
    public class ErrorsController : Controller
    {
        // GET: Errors
        public ActionResult Unauthorized()
        {
            return new HttpStatusCodeResult(401);
        }

        // GET: Errors/Forbidden
        public ActionResult Forbidden()
        {
            return new HttpStatusCodeResult(403);
        }

        public ActionResult PageNotFound()
        {
            return View();
        }
    }
}