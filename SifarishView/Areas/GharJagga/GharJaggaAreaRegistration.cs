using System.Web.Mvc;

namespace SifarishView.Areas.GharJagga
{
    public class GharJaggaAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "GharJagga";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "GharJagga_default",
                "GharJagga/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}