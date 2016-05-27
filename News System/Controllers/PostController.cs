using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using News_System.Models;
using System.IO;
using System.Collections.Generic;

namespace News_System.Controllers
{
    public class PostController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();

        // GET: Post
        public ActionResult Index()
        {
            return View(db.Post.OrderByDescending(o => o.Time).ToList());
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
        public ActionResult Create([Bind(Include = "Id,Title,Image,Time,Description,Tags,Id_Category,DisabledComments,Visits")] Post post, HttpPostedFileBase file)
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

                post.DisabledComments = false;
                post.Visits = 0;
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
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Post post = db.Post.Find(id);
            if (post == null)
                return HttpNotFound();
            else
                ViewBag.PostTitle = post.Title;

            return View(post);
        }

        // POST: Post/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,Image,Time,Description,Id_Category,DisabledComments")] Post post)
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

        public ActionResult ViewPost(int? id)
        {
            PostViewModels postViewModel = new PostViewModels();

            postViewModel.Posts = db.Post.Find(id);
            postViewModel.Comments = db.Comment.Where(c => c.Id_Post == postViewModel.Posts.Id);

            if (postViewModel.Posts == null)
            {
                return this.HttpNotFound();
            }
            else
            {
                ViewBag.Title = postViewModel.Posts.Title;

                RelatedArticles(postViewModel.Posts.Id);

                ViewBag.Tags = db.Post_Tags
                    .Where(t => t.Id_Post == id).ToList();

                ViewBag.Prev = db.Post.Where(p => p.Id < id && p.Deleted == false)
                    .OrderByDescending(o => o.Id).FirstOrDefault();

                ViewBag.Next = db.Post.Where(p => p.Id > id && p.Deleted == false)
                    .OrderBy(o => o.Id).FirstOrDefault();
            }

            return View(postViewModel);
        }

        //Filter all the posts by this Category
        public ActionResult Category(int? id)
        {
            return View(db.Post.Where(p => p.Category.Id == id).OrderByDescending(o=>o.Time).ToList());
        }

        public ActionResult Search(string q)
        {
            if (q != null)
                ViewBag.SearchParam = q;
            else
                ViewBag.SearchParam = "";

            return View(db.Post.Where(p => p.Title.Contains(q)).OrderByDescending(o => o.Time).ToList());
        }

        public void RelatedArticles(int id_post)
        {
            List<Post_Tags> Tags = db.Post_Tags.Where(p => p.Id_Post == id_post).ToList();

            List<Post> Posts = new List<Post>();

            for (int i = 0; i < Tags.Count; i++)
            {
                int id_tag = Tags[i].Tags.Id;

                var item = db.Post
                        .Where(p => p.Post_Tags
                            .Any(a => a.Tags.Id == id_tag))
                                .FirstOrDefault();

                //Agrega el Item a la lista si encontro un registro en la Db
                if(item != null) Posts.Add(item);

                //Revisar si Posts no excede los 3 registros
                if (Posts.Count == 3) break;
            }

            if (Posts.Count > 0)
                ViewBag.RelatedArticles = Posts.Distinct().ToList();
        }
        
        //For the Ajax Call
        [HttpPost]
        public ActionResult RemovePost(int? id)
        {
            Post post = db.Post.Find(id);
            db.Post.Remove(post);
            db.SaveChanges();

            return RedirectToAction("Index");
        }


        [HttpPost]
        public ActionResult ChangeState(int? id, bool state)
        {
            Post post = db.Post.Find(id);
            post.Deleted = state;
            db.SaveChanges();

            return RedirectToAction("Index");
        }

        public ActionResult Hightlight(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            
            Post post = db.Post.Find(id);

            if (post == null)
                return HttpNotFound();
            
            if(post.Highlight == true)
                post.Highlight = false;
            else
                post.Highlight = true;

            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}
