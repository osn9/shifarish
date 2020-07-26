using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Sifaris.Startup))]
namespace Sifaris
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
