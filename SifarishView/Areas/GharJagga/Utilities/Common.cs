using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using static SifarishView.Areas.GharJagga.Models.CommonViewModel;

namespace SifarishView.Areas.GharJagga.Utilities
{
    public class Common
    {
        public static IEnumerable<SelectListItem> GetStateList()
        {
            IEnumerable<StateViewModel> StateList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("state").Result;
            StateList = response.Content.ReadAsAsync<IEnumerable<StateViewModel>>().Result;
            return new SelectList(StateList, "Id", "Name");
        }

        public static IEnumerable<SelectListItem> GetDistrictList()
        {
            IEnumerable<DistrictViewModel> DistrictList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("district").Result;
            DistrictList = response.Content.ReadAsAsync<IEnumerable<DistrictViewModel>>().Result;
            return new SelectList(DistrictList, "Id", "Name");
        }

        public static IEnumerable<SelectListItem> GetLocalLevelList()
        {
            IEnumerable<LocalLevelViewModel> LocalLevelList;
            HttpResponseMessage response = GlobalVariables.webApiClient.GetAsync("LocalLevel").Result;
            LocalLevelList = response.Content.ReadAsAsync<IEnumerable<LocalLevelViewModel>>().Result;
            return new SelectList(LocalLevelList, "Id", "Name");
        }

        public static IEnumerable<SelectListItem> GetWardList()
        {
            return new SelectList(new[]
            {
                new {Id="1",Value="1"},
                new {Id="2",Value="2"},
                new {Id="3",Value="3"},
                new {Id="4",Value="4"},
                new {Id="5",Value="5"},
            }, "Id", "Value");
        }

    }
}