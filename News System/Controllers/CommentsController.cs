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
    public class CommentsController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();

        // GET: Comments
        public ActionResult Index()
        {
            var comment = db.Comment.Include(c => c.Post);
            return View(comment.ToList());
        }

        // GET: Comments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comment.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        public JsonResult DetailsComments(int? id)
        {
            var comments = (from c in db.Comment
                            where c.Id == id
                            select new
                            {
                                Id = c.Id,
                                Name = c.Name,
                                Comment = c.Comment1,
                                Time = c.Time,
                                Post = c.Post.Title,
                            }).SingleOrDefault();

            return Json(new { data = comments }, JsonRequestBehavior.AllowGet);
        }

        // GET: Comments/Create
        public ActionResult Create()
        {
            ViewBag.Id_Post = new SelectList(db.Post, "Id", "Title");
            return View();
        }

        // POST: Comments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Comment1,Email,Website,Time,Id_Post")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                comment.Time = DateTime.Now;

                db.Comment.Add(comment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_Post = new SelectList(db.Post, "Id", "Title", comment.Id_Post);
            return View(comment);
        }

        // GET: Comments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comment.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_Post = new SelectList(db.Post, "Id", "Title", comment.Id_Post);
            return View(comment);
        }

        // POST: Comments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Comment1,Email,Website,Time,Id_Post")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(comment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_Post = new SelectList(db.Post, "Id", "Title", comment.Id_Post);
            return View(comment);
        }

        // GET: Comments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comment.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // POST: Comments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Comment comment = db.Comment.Find(id);
            db.Comment.Remove(comment);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //For the Ajax Call
        [HttpPost]
        public ActionResult HideComment(int? id)
        {
            Comment comment = db.Comment.Find(id);
            comment.Deleted = true;

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

        [HttpPost]
        public ActionResult ApproveComment(int? id, bool state)
        {
            Comment comm = db.Comment.Find(id);
            comm.Approved = state;
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}
