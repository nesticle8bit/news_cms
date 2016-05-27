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
    public class CivilStatusController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();

        // GET: CivilStatus
        public ActionResult Index()
        {
            return View(db.CivilStatus.ToList());
        }

        // GET: CivilStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CivilStatus civilStatus = db.CivilStatus.Find(id);
            if (civilStatus == null)
            {
                return HttpNotFound();
            }
            return View(civilStatus);
        }

        public JsonResult DetailsCivilStatus(int? id)
        {
            var data = (from c in db.CivilStatus
                            where c.Id == id
                            select new
                            {
                                Id = c.Id,
                                Name = c.Name
                            }).SingleOrDefault();

            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }

        // GET: CivilStatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CivilStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name")] CivilStatus civilStatus)
        {
            if (ModelState.IsValid)
            {
                db.CivilStatus.Add(civilStatus);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(civilStatus);
        }

        // GET: CivilStatus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CivilStatus civilStatus = db.CivilStatus.Find(id);
            if (civilStatus == null)
            {
                return HttpNotFound();
            }
            return View(civilStatus);
        }

        // POST: CivilStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name")] CivilStatus civilStatus)
        {
            if (ModelState.IsValid)
            {
                db.Entry(civilStatus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(civilStatus);
        }

        // GET: CivilStatus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CivilStatus civilStatus = db.CivilStatus.Find(id);
            if (civilStatus == null)
            {
                return HttpNotFound();
            }
            return View(civilStatus);
        }

        // POST: CivilStatus/Delete/5
        //[HttpPost, ActionName("Delete")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CivilStatus civilStatus = db.CivilStatus.Find(id);
            db.CivilStatus.Remove(civilStatus);
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
