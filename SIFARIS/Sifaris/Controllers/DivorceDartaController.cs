using Sifaris.Models;
using Sifaris.Providers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sifaris.Controllers
{
    public class DivorceDartaController : Controller
    {
        //
        // GET: /DivorceDarta/
        DivorceDartaProvider pro = new DivorceDartaProvider();
        public ActionResult Index(int page=1)
        {
            var pagesize = Utility.PageSize;
            var model = new DivorceDartaModel();
            return View(model);
        }
        public ActionResult Create()
        {
            var model = new DivorceDartaModel();
            model.DivorceFaramDartaNo = Utility.GetMaxDivorceDartaNo(Utility.DivorceSifaris);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(DivorceDartaModel model)
        {
            if (ModelState.IsValid)
            {
                pro.Insert(model);
            }
            return View();
        }
	}
}