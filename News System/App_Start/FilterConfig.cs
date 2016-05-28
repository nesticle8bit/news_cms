using System.Web;
using System.Web.Mvc;

namespace News_System
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
<<<<<<< HEAD
            filters.Add(new CustomAuthorizeAttribute());
        }

        public class CustomAuthorizeAttribute : AuthorizeAttribute
        {
            protected override bool AuthorizeCore(HttpContextBase httpContext)
            {
                var routeData = httpContext.Request.RequestContext.RouteData;
                var controller = routeData.GetRequiredString("controller");
                var action = routeData.GetRequiredString("action");
                var area = routeData.DataTokens["area"];
                var user = httpContext.User;

                if (area != null && area.ToString() == "Admin")
                {
                    if (!user.Identity.IsAuthenticated || !user.IsInRole("Administrator"))
                        return false;
                }

                return true;
            }
=======
>>>>>>> 3ae2c16b001ed52d90e746547ce80f711f4b496f
        }
    }
}
