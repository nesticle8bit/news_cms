using News_System.Models;
using System.Web.Mvc;

namespace News_System.Controllers
{
    public class UserController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();
        //ApplicationDbContext UsersContext = new ApplicationDbContext();

        // GET: User
        public ActionResult Index()
        {
            return View();
        }
    }
}