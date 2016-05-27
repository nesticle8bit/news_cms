using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(News_System.Startup))]
namespace News_System
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
