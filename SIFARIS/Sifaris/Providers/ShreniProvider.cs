using Sifaris.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sifaris.Providers
{
    public class ShreniProvider
    {
        //public static readonly ILog Log = LogManager.GetLogger(typeof(Shreni).Namespace);
        SifarisEntities ent = new SifarisEntities();

        public int GetTotalItemCount()
        {
            return ent.tblShrenis.Count();
        }
        public List<ShreniModel> GetShreniList(int page, int pagesize)
        {
            List<ShreniModel> resultList = ent.tblShrenis.OrderBy(x => x.ShreniId).Skip((page - 1) * pagesize).Take(pagesize).Select(x => new ShreniModel
            {               
                ShreniName = x.ShreniName,
                ShreniId = x.ShreniId,
                ShreniScheduleId=x.ShreniScheduleId,
                CreatedBy = x.CreatedBy,
                CreatedDate = x.CreatedDate
            }).ToList();
            return resultList;
        }

        public ShreniModel GetShreniData(int ShreniId)
        {
            ShreniModel result = ent.tblShrenis.Where(x => x.ShreniId == ShreniId).Select(y => new ShreniModel
            {                
                ShreniId = y.ShreniId,
                ShreniName=y.ShreniName,
                ShreniScheduleId=y.ShreniScheduleId,
                CreatedBy = y.CreatedBy,
                CreatedDate = y.CreatedDate

            }).SingleOrDefault();

            return result;
        }

        public void Insert(ShreniModel model)
        {
            try
            {
                var objToSave = new tblShreni()
                {                    
                    ShreniId = model.ShreniId,
                    ShreniName=model.ShreniName,
                    ShreniScheduleId=model.ShreniScheduleId
                };
                //objToSave.CreatedBy = Utility.GetCurrentLoginUser();
                objToSave.CreatedDate = DateTime.Now.ToShortDateString().ToString();
                ent.tblShrenis.Add(objToSave);
                ent.SaveChanges();
            }
            catch (Exception ex)
            {

                //Log.Error(string.Format("Error! on Insert Shreni Data Auction  with error message: {0}",ex.Message));
                //Log.Error(string.Format("Error with exception: {0}", ex.StackTrace));
            }

        }

        public void Update(ShreniModel model)
        {
            try
            {
                var objToEdit = ent.tblShrenis.Single(x => x.ShreniId == model.ShreniId);
                objToEdit.ShreniId = model.ShreniId;
                objToEdit.ShreniName = model.ShreniName;
                objToEdit.ShreniScheduleId = model.ShreniScheduleId;
                objToEdit.CreatedBy = model.CreatedBy;
                objToEdit.CreatedDate = model.CreatedDate;
                //objToEdit.UpdatedBy = Utility.GetCurrentLoginUser();
                objToEdit.UpdatedDate = DateTime.Now.ToShortDateString().ToString();

                ent.Entry(objToEdit).State = System.Data.Entity.EntityState.Modified;
                ent.SaveChanges();
            }
            catch (Exception ex)
            {
                //Log.Error(string.Format("Error! on Update Shreni Data Auction  with error message: {0}",ex.Message));
                //Log.Error(string.Format("Error with exception: {0}", ex.StackTrace));
            }
        }

        public void Delete(int shreniId)
        {
            try
            {
                //((SimpleMembershipProvider)Membership.Provider).DeleteAccount(shreniId.ToString()); // deletes record from webpages_Membership table
                //bool value = ((SimpleMembershipProvider)Membership.Provider).DeleteUser(shreniId.ToString(), true); // deletes record from UserProfile table 
                //if (value)
                {
                    var objToEdit = ent.tblShrenis.Single(x => x.ShreniId == shreniId);
                    ent.tblShrenis.Remove(objToEdit);
                    ent.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                //Log.Error(string.Format("Error! on Delete Shreni Data Auction  with error message: {0}",ex.Message));
                //Log.Error(string.Format("Error with exception: {0}", ex.StackTrace));
            }
        }
    }
}