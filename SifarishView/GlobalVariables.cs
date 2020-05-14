using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Web;

namespace SifarishView
{
    public class GlobalVariables
    {
        public static HttpClient webApiClient = new HttpClient();
        static GlobalVariables()
        {
            //string baseAddress = ConfigurationManager.AppSettings["BaseAddress"];
            //webApiClient.BaseAddress = new Uri(baseAddress);
            webApiClient .BaseAddress=new Uri("http://localhost:62782/api/");
            webApiClient.DefaultRequestHeaders.Clear();
            webApiClient.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
        }
    }
}