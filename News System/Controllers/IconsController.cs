using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using News_System.Models;

namespace News_System.Controllers
{
    public class IconsController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();

        // GET: Icons
        public ActionResult Index()
        {
            return View(db.Icon.ToList());
        }

        // GET: Icons/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Icon icon = db.Icon.Find(id);
            if (icon == null)
            {
                return HttpNotFound();
            }
            return View(icon);
        }

        // GET: Icons/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Icons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,IconName")] Icon icon)
        {
            if (ModelState.IsValid)
            {
                db.Icon.Add(icon);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(icon);
        }

        // GET: Icons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Icon icon = db.Icon.Find(id);
            if (icon == null)
            {
                return HttpNotFound();
            }
            return View(icon);
        }

        // POST: Icons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,IconName")] Icon icon)
        {
            if (ModelState.IsValid)
            {
                db.Entry(icon).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(icon);
        }

        // GET: Icons/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Icon icon = db.Icon.Find(id);
            if (icon == null)
            {
                return HttpNotFound();
            }
            return View(icon);
        }

        // POST: Icons/Delete/5
        //[HttpPost, ActionName("Delete")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Icon icon = db.Icon.Find(id);
            db.Icon.Remove(icon);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public JsonResult DetailsIcon(int? id)
        {
            var category = (from c in db.Icon
                            where c.Id == id
                            select new
                            {
                                Id = c.Id,
                                Name = c.IconName
                            }).SingleOrDefault();

            return Json(new { data = category }, JsonRequestBehavior.AllowGet);
        }
    }
}
