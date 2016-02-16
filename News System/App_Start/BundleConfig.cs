using System.Web;
using System.Web.Optimization;

namespace News_System
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            //Scripts
            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js",
                      "~/Scripts/bootstrap-filestyle.js",
                      "~/Scripts/jquery.autosize.min.js"));

            //Scripts: Frontend
            bundles.Add(new ScriptBundle("~/bundles/frontend").Include(
                "~/Scripts/jquery.overlaps.js",
                "~/Scripts/wow.js",
                "~/Scripts/global_script.js"));

            bundles.Add(new ScriptBundle("~/bundles/posts").Include(
                "~/Scripts/jquery.wysibb.js",
                "~/Scripts/xbbcode.js",
                "~/Scripts/social-buttons.js",
                "~/Scripts/selection-sharer.min.js",
                "~/Scripts/selectize.js"));

            //Css Styles
            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/font-awesome.css",
                      "~/Content/wbbtheme.css",
                      "~/Content/selectize.default.css",
                      "~/Content/selection-sharer.min.css",
                      "~/Content/social-buttons.css",
                      "~/Content/animate.css",
                      "~/Content/site.css"));
        }
    }
}
