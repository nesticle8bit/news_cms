using News_System.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace News_System.Controllers
{
    public class PagesController : Controller
    {
        private newsSystem_dbEntities db = new newsSystem_dbEntities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Advertise()
        {
            ViewBag.Title = "Advertise!";
            ViewBag.SubTitle = "Align your brand with captivating content!";
            //ViewBag.Email = mail;

            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult WriteForUs()
        {
            ViewBag.Title = "Write for us!";
            ViewBag.SubTitle = "We’re always looking for new writers to join our team";

            return View();
        }
        
        public ActionResult Privacy()
        {
            ViewBag.Title = "Privacy Policy";
            ViewBag.LastUpdated = "Last updated: August 02, 2015";
            ViewBag.Email = db.Configuration.SingleOrDefault().Email; ;

            return View();
        }

        public ActionResult Terms()
        {
            ViewBag.Title = "Terms and Conditions ('Terms')";
            ViewBag.LastUpdated = "Last updated: August 02, 2015";
            ViewBag.Email = db.Configuration.SingleOrDefault().Email; ;

            return View();
        }

        public ActionResult Subscribe()
        {
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Email = db.Configuration.SingleOrDefault().Email;;
            
            return View();
        }

        public ActionResult Chat()
        {
            ViewBag.SubTitle = "Just enjoy talking to us :)";
            return View();
        }
    }
}