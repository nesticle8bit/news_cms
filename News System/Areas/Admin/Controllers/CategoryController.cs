using News_System.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace News_System.Areas.Admin.Controllers
{
    public class CategoryController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();

        // GET: Admin/Category
        public ActionResult Index()
        {
            return View(db.Category.ToList());
        }
    }
}