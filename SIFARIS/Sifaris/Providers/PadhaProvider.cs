using Sifaris.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sifaris.Providers
{
    public class PadhaProvider
    {
        //public static readonly ILog Log = LogManager.GetLogger(typeof(PadhaProvider).Namespace);
        SifarisEntities ent = new SifarisEntities();

        public int GetTotalItemCount()
        {
            return ent.tblShrenis.Count();
        }
        public List<PadhaModel> GetPadhaList(int page, int pagesize)
        {
            List<PadhaModel> resultList = ent.tblPadhas.OrderBy(x=>x.PadhaId).Skip((page - 1) * pagesize).Take(pagesize).Select(x => new PadhaModel
            {
                PadhaId = x.PadhaId,
                PadhaName = x.PadhaName,
                ShreniId = x.ShreniId,
                CreatedBy=x.CreatedBy,CreatedDate=x.CreatedDate
            }).ToList();
            return resultList;
        }

        public PadhaModel GetPadhaData(int padhaId)
        {
            PadhaModel result = ent.tblPadhas.Where(x => x.PadhaId == padhaId).Select(y => new PadhaModel
            {
                PadhaId = y.PadhaId,
                PadhaName = y.PadhaName,
                ShreniId = y.ShreniId,
                CreatedBy = y.CreatedBy,
                CreatedDate = y.CreatedDate

            }).SingleOrDefault();
            

            return result;
        }

        public void Insert(PadhaModel model)
        {
            try
            {
                var objToSave = new tblPadha()
                {
                    PadhaId = model.PadhaId,
                    PadhaName = model.PadhaName,
                    ShreniId = model.ShreniId
                };
               
                //objToSave.CreatedBy = Utility.GetCurrentLoginUser();
                objToSave.CreatedDate = DateTime.Now.ToShortDateString().ToString();
                ent.tblPadhas.Add(objToSave);
                ent.SaveChanges();
            }
            catch (Exception ex)
            {

                //Log.Error(string.Format("Error! on Insert Shreni Data Auction  with error message: {0}",
                //                    ex.Message));
                //Log.Error(string.Format("Error with exception: {0}", ex.StackTrace));
            }

        }
        /// <summary>
        /// Error updating inserted record too i.e created by and createddate to null
        /// </summary>
        /// <param name="model"></param>
        public void Update(PadhaModel model)
        {
            try
            {
                var objToEdit = ent.tblPadhas.Single(x => x.PadhaId == model.PadhaId);
                objToEdit.PadhaId = model.PadhaId;
                objToEdit.PadhaName = model.PadhaName;
                objToEdit.ShreniId = model.ShreniId;
                objToEdit.CreatedBy = model.CreatedBy;
                objToEdit.CreatedDate = model.CreatedDate;
                //objToEdit.UpdatedBy = Utility.GetCurrentLoginUser();
                objToEdit.UpdatedDate = DateTime.Now.ToShortDateString().ToString();

                ent.Entry(objToEdit).State = System.Data.Entity.EntityState.Modified;
                ent.SaveChanges();
            }
            catch (Exception ex)
            {
                //Log.Error(string.Format("Error! on Update Employeee Data Auction  with error message: {0}",
                //                     ex.Message));
                //Log.Error(string.Format("Error with exception: {0}", ex.StackTrace));
            }
        }

        public void Delete(int padhaId)
        {
            try
            {
                //((SimpleMembershipProvider)Membership.Provider).DeleteAccount(shreniId.ToString()); // deletes record from webpages_Membership table
                //bool value = ((SimpleMembershipProvider)Membership.Provider).DeleteUser(shreniId.ToString(), true); // deletes record from UserProfile table 
                //if (value)
                {
                    var objToEdit = ent.tblPadhas.Single(x => x.PadhaId == padhaId);
                    ent.tblPadhas.Remove(objToEdit);
                    ent.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                //Log.Error(string.Format("Error! on Delete Employeee Data Auction  with error message: {0}",
                //                                    ex.Message));
                //Log.Error(string.Format("Error with exception: {0}", ex.StackTrace));
            }
        }
    }
}