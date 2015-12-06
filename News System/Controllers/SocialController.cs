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
    public class SocialController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();

        // GET: Social
        public ActionResult Index()
        {
            var social = db.Social.Include(s => s.Icon);
            return View(social.ToList());
        }

        // GET: Social/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Social social = db.Social.Find(id);
            if (social == null)
            {
                return HttpNotFound();
            }
            return View(social);
        }

        // GET: Social/Create
        public ActionResult Create()
        {
            ViewBag.Id_Icon = new SelectList(db.Icon, "Id", "IconName");
            return View();
        }

        // POST: Social/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Link,Id_Icon,Status")] Social social)
        {
            if (ModelState.IsValid)
            {
                db.Social.Add(social);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_Icon = new SelectList(db.Icon, "Id", "IconName", social.Id_Icon);
            return View(social);
        }

        // GET: Social/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Social social = db.Social.Find(id);
            if (social == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_Icon = new SelectList(db.Icon, "Id", "IconName", social.Id_Icon);
            return View(social);
        }

        // POST: Social/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Link,Id_Icon,Status")] Social social)
        {
            if (ModelState.IsValid)
            {
                db.Entry(social).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_Icon = new SelectList(db.Icon, "Id", "IconName", social.Id_Icon);
            return View(social);
        }

        // GET: Social/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Social social = db.Social.Find(id);
            if (social == null)
            {
                return HttpNotFound();
            }
            return View(social);
        }

        // POST: Social/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Social social = db.Social.Find(id);
            db.Social.Remove(social);
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
    }
}
