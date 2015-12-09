using News_System.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace News_System.App_Start
{
    public class CommonConfig : ActionFilterAttribute
    {
        newsSystem_dbEntities db = new newsSystem_dbEntities();

        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            //Configuration : Site name - Slogan - Url
            filterContext.Controller.ViewBag.SiteName = db.Configuration.SingleOrDefault().WebsiteTitle;
            filterContext.Controller.ViewBag.Slogan = db.Configuration.SingleOrDefault().Slogan;
            filterContext.Controller.ViewBag.WebsiteLink = db.Configuration.SingleOrDefault().Url;

            //Sidebar
            filterContext.Controller.ViewBag.Categorias = db.Category.OrderBy(o => o.Name).ToList();

            Random rand = new Random();
            int toSkip = rand.Next(0, db.Post.Count());
            filterContext.Controller.ViewBag.RandomArticle = db.Post.Take(1).OrderBy(o => o.Id).Skip(toSkip).First();
            filterContext.Controller.ViewBag.FeaturedArticles = db.Post.Where(p => p.Comment.Count > 0)
                                                                       .Take(4)
                                                                       .ToList();

            //List of Social Networks
            filterContext.Controller.ViewBag.SocialNetwork = db.Social
                                                               .Where(w => w.Status == true)
                                                               .OrderBy(o => o.Name).ToList();

            //Configuration : Ads
            filterContext.Controller.ViewBag.Ads_300 = db.Configuration.SingleOrDefault().Ads_300;

            filterContext.Controller.ViewBag.Ads_728 = db.Configuration.SingleOrDefault().Ads_728;
            filterContext.Controller.ViewBag.Ads_970 = db.Configuration.SingleOrDefault().Ads_970;

        }
    }
}