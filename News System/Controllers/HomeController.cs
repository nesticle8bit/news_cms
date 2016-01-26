using News_System.Models;
using System.Linq;
using System.Web.Mvc;

namespace News_System.Controllers
{
    public class HomeController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();
        HomeViewModel homeViewModel = new HomeViewModel();

        public ActionResult Index()
        {
            homeViewModel.Posts = db.Post
                                    .Where(p => p.Deleted == false)
                                    .ToList()
                                    .OrderByDescending(o => o.Time);

            //Categorias del Sidebar, no hay necesidad de crear un ActionResult para ese View
            //homeViewModel.Categories = db.Category.ToList().OrderBy(o => o.Name);

            return View(homeViewModel);
        }

        //public ActionResult Sidebar()
        //{
        //    homeViewModel.Categories = db.Category.ToList().OrderByDescending(o => o.Name);
        //    return View(homeViewModel);
        //}
    }
}