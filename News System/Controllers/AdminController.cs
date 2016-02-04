using News_System.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace News_System.Controllers
{
    public class AdminController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();
        AdminViewModels adminViewModel = new AdminViewModels();
        
        public ActionResult Index()
        {
            adminViewModel.Comment = db.Comment.Where(w => w.Deleted == false).OrderByDescending(o => o.Id).Take(6);
            return View(adminViewModel);
        }

        public JsonResult Chart_MostPopularPosts()
        {
            var posts = (from p in db.Post
                         where p.Visits > 4
                            select new
                            {
                                Id = p.Id,
                                Title = p.Title,
                                Visits = p.Visits,
                            }).Take(5).ToArray();

            return Json(new { data = posts }, JsonRequestBehavior.AllowGet);
        }
    }
}