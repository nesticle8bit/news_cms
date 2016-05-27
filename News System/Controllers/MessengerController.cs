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
    public class MessengerController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();

        // GET: Messenger
        public ActionResult Index()
        {
            return View(db.Messenger.ToList());
        }

        // GET: Messenger/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Messenger messenger = db.Messenger.Find(id);
            if (messenger == null)
            {
                return HttpNotFound();
            }
            return View(messenger);
        }

        public JsonResult DetailsMessenger(int? id)
        {
            var data = (from c in db.Messenger
                        where c.Id == id
                        select new
                        {
                            Id = c.Id,
                            Name = c.Name
                        }).SingleOrDefault();

            return Json(new { data = data }, JsonRequestBehavior.AllowGet);
        }

        // GET: Messenger/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Messenger/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name")] Messenger messenger)
        {
            if (ModelState.IsValid)
            {
                db.Messenger.Add(messenger);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(messenger);
        }

        // GET: Messenger/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Messenger messenger = db.Messenger.Find(id);
            if (messenger == null)
            {
                return HttpNotFound();
            }
            return View(messenger);
        }

        // POST: Messenger/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name")] Messenger messenger)
        {
            if (ModelState.IsValid)
            {
                db.Entry(messenger).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(messenger);
        }

        // GET: Messenger/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Messenger messenger = db.Messenger.Find(id);
            if (messenger == null)
            {
                return HttpNotFound();
            }
            return View(messenger);
        }

        // POST: Messenger/Delete/5
        //[HttpPost, ActionName("Delete")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Messenger messenger = db.Messenger.Find(id);
            db.Messenger.Remove(messenger);
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
