using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using News_System.Models;
using System.IO;

namespace News_System.Controllers
{
    public class PostController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();

        // GET: Post
        public ActionResult Index()
        {
            return View(db.Post.ToList());
        }

        // GET: Post/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Post post = db.Post.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }

        // GET: Post/Create
        public ActionResult Create()
        {
            ViewBag.Category = new SelectList(db.Category, "Id", "Name");
            return View();
        }

        // POST: Post/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Title,Image,Time,Description,Tags,Id_Category")] Post post, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (Directory.Exists(Server.MapPath("~/Files/")) == false) Directory.CreateDirectory(Server.MapPath("~/Files/"));

                //Guardar la Imagen
                if (file != null)
                {
                    string fileNameOP = string.Empty;
                    if (file.FileName.LastIndexOf("\\") > 0)
                        fileNameOP = file.FileName.Substring(file.FileName.LastIndexOf("\\") + 1);
                    else
                        fileNameOP = file.FileName;

                    string filename = Path.GetFileName(DateTime.Now.ToString("yyyy-MM-dd-HHmmss") + "_" + fileNameOP);
                    file.SaveAs(Server.MapPath("~/Files/") + filename);
                    post.Image = filename;
                }
                
                post.Time = DateTime.Now;

                db.Post.Add(post);
                db.SaveChanges();

                int id_post = post.Id;

                string[] tag = post.Tags.Split(new string[] { "," }, StringSplitOptions.None);
                Post_Tags postTags = new Post_Tags();
                
                TagsController tagController = new TagsController();
                Tags tags = new Tags();
                int id_tag = 0;

                for (int i = 0; i < tag.Length; i++)
                {
                    int id_registro = VerificarRegistro(tag[i]);
                    //Verificar si el registro existe
                    if (id_registro == 0) {
                        //Crear Tags
                        tags.Name = tag[i];
                        id_tag = tagController.CreateTag(tags);
                        //Crear PostTags
                        CreateTagPost(id_post, id_tag);
                    }
                    else
                    {
                        CreateTagPost(id_post, id_registro);
                    }
                }

                return RedirectToAction("Index");
            }

            ViewBag.Category = new SelectList(db.Category, "Id", "Name", post.Category);
            return View(post);
        }

        public void CreateTagPost(int id_post, int id_tag)
        {
            Post_Tags postTags = new Post_Tags();
            postTags.Id_Post = id_post;
            postTags.Id_Tags = id_tag;

            db.Post_Tags.Add(postTags);
            db.SaveChanges();
        }

        // GET: Post/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Post post = db.Post.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }

        // POST: Post/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,Image,Time,Description,Id_Category")] Post post)
        {
            if (ModelState.IsValid)
            {
                db.Entry(post).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Category = new SelectList(db.Category, "Id", "Name");
            return View(post);
        }

        // GET: Post/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Post post = db.Post.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }

        // POST: Post/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Post post = db.Post.Find(id);
            db.Post.Remove(post);
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


        //GET Tags
        //-------------

        public JsonResult GetTags()
        {
            var token = string.Join(",", db.Tags.ToList().Select(x => x.Name).ToList());
            return Json(new { data = token.ToString().Split(',') }, JsonRequestBehavior.AllowGet);

            //var consulta = db.Tags
            //                .Select(x => new { x.Name })
            //                .OrderBy(o => o.Name)
            //                .ToArray();

            //return Json(consulta, JsonRequestBehavior.AllowGet);

            //var servicios = db.Ser_Especifico
            //   .Where(x => x.Id_Servicio == id_servicio)
            //   .Select(x => new { x.Id, x.Especifico })
            //   .OrderBy(x => x.Especifico);

            //return Json(servicios, JsonRequestBehavior.AllowGet);
        }


        //Verificar si existe el registro
        public int VerificarRegistro(string dato)
        {
            int id = 0;
            if (db.Tags.Any(x => x.Name == dato) == true)
                id = db.Tags.Where(x => x.Name == dato)
                    .Select(x => x.Id)
                    .FirstOrDefault();
            else
                id = 0;

            return id;
        }

        //
        public ActionResult ViewPost(int? id)
        {
            Post post = db.Post.Find(id);

            if (post != null)
            {
                ViewBag.Tags = db.Post_Tags
                    .Where(t => t.Id_Post == id).ToList();

                ViewBag.Prev = db.Post.Where(p => p.Id < id)
                    .OrderByDescending(o => o.Id).FirstOrDefault();

                ViewBag.Next = db.Post.Where(p => p.Id > id)
                    .OrderBy(o => o.Id).FirstOrDefault();
            }

            return View(post);
        }
    }
}
