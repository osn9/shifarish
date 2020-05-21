using System.Web.Mvc;

namespace SIFARIS.Areas.DartaSupplement
{
    public class DartaSupplementAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "DartaSupplement";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "DartaSupplement_default",
                "DartaSupplement/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}