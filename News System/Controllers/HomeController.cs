using News_System.Models;
using System.Linq;
using System.Web.Mvc;
using PagedList;

namespace News_System.Controllers
{
    public class HomeController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();
        HomeViewModel homeViewModel = new HomeViewModel();
        
        public ActionResult Index(int? page)
        {
            int pageSize = 8;
            int pageNumber = (page ?? 1);

            ViewBag.PostsDestacados = (from q in db.Post
                                       where q.Deleted == false && q.Highlight == true
                                       select new MinimalPostViewModel
                                       {
                                           Id = q.Id,
                                           Title = q.Title,
                                           Image = q.Image,
                                           Time = q.Time,
                                           Category = q.Category.Name,
                                           Id_Category = q.Category.Id,
                                           Comments = q.Comment.Count
                                       }).ToList();

            var posts = (from q in db.Post
                         where q.Deleted == false && q.Highlight == false
                         orderby q.Time descending
                         select q);

            return View(posts.ToPagedList(pageNumber, pageSize));
        }

        //public ActionResult Sidebar()
        //{
        //    homeViewModel.Categories = db.Category.ToList().OrderByDescending(o => o.Name);
        //    return View(homeViewModel);
        //}
    }
}