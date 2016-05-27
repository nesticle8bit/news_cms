using Microsoft.AspNet.Identity.EntityFramework;
using News_System.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace News_System.Controllers
{
    public class RoleController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();
        ApplicationDbContext context;

        public RoleController()
        {
            context = new ApplicationDbContext();
        }

        // GET: Role
        public ActionResult Index()
        {
            var roles = context.Roles.ToList();
            return View(roles);
        }

        public ActionResult Create()
        {
            var rol = new IdentityRole();
            return View(rol);
        }

        [HttpPost]
        public ActionResult Create(IdentityRole role)
        {
            context.Roles.Add(role);
            context.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Edit(string rol)
        {
            var thisRole = context.Roles.Where(r => r.Name.Equals(rol, StringComparison.CurrentCultureIgnoreCase)).FirstOrDefault();
            return View(thisRole);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(IdentityRole rol)
        {
            try
            {
                context.Entry(rol).State = EntityState.Modified;
                context.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public JsonResult DetailsRole(string id)
        {
            var role = (from c in db.AspNetRoles
                            where c.Id == id
                            select new
                            {
                                Id = c.Id,
                                Name = c.Name
                            }).SingleOrDefault();

            return Json(new { data = role }, JsonRequestBehavior.AllowGet);
        }
    }
}