using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SifarishView.Startup))]
namespace SifarishView
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
