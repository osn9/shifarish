using SIFARIS.Areas.SetUp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.SetUp.Provider
{
    public class StateProvider
    {
        SifarishEntities ent = new SifarishEntities();
        public StateModel GetStateRecords(int? id)
        {
            StateModel data = (from state in ent.tblStates
                               where state.StateId_val == id
                               select new StateModel
                               {
                                   StateId = state.StateId,
                                   StateId_val = state.StateId_val,
                                   StateName = state.StateName,
                                   StateName_Nep = state.StateName_Nep,
                               }).SingleOrDefault();

            return data;
        }
        public List<StateModel> GetStateList()
        {
            var model = new List<StateModel>();

            model = (from state in ent.tblStates
                     select new StateModel
                     {
                         StateId = state.StateId,
                         StateId_val = state.StateId_val,
                         StateName = state.StateName,
                         StateName_Nep = state.StateName_Nep,
                     }).ToList();

            return model;
        }
    }
}