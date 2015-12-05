using News_System.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace News_System.App_Start
{
    public class CommonConfig : ActionFilterAttribute
    {
        newsSystem_dbEntities db = new newsSystem_dbEntities();

        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            filterContext.Controller.ViewBag.Categorias = db.Category.OrderBy(o => o.Name).ToList();
            filterContext.Controller.ViewBag.FeaturedArticles = db.Post.Where(p => p.Comment.Count > 0)
                                                                       .ToList();

            //.Where(m => (m.Time.Month == DateTime.Now.Month) && (m.Time.Year == DateTime.Now.Year))
        }
    }
}