using Sifaris.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sifaris.Providers
{
    public class UserTypeProvider
    {
        //public static readonly ILog Log = LogManager.GetLogger(typeof(UserTypes).Namespace);
        SifarisEntities ent = new SifarisEntities();

        public int GetTotalItemCount()
        {
            return ent.tblUserTypes.Count();
        }
        public List<UserTypeModel> GetUserTypeList(int page, int pagesize)
        {
            List<UserTypeModel> resultList = ent.tblUserTypes.Where(x => x.UserTypeId != 1).OrderBy(x => x.ScheduleId).Skip((page - 1) * pagesize).Take(pagesize).Select(x => new UserTypeModel { 
            UserTypeId=x.UserTypeId,
            Title=x.Title,
            CreatedBy=x.CreatedBy,
            CreatedDate=x.CreatedDate,
            ScheduleId=x.ScheduleId
            }).ToList();

            return resultList;
        }

        public UserTypeModel GetUserTypeData(int usertypeId)
        {
            UserTypeModel result = ent.tblUserTypes.Where(x => x.UserTypeId == usertypeId).Select(y => new UserTypeModel
            {
                UserTypeId = y.UserTypeId,
                Title = y.Title,
                ScheduleId = y.ScheduleId,
                CreatedBy = y.CreatedBy,
                CreatedDate = y.CreatedDate

            }).SingleOrDefault();
            return result;
        }

        //public void Insert(UserTypeModel model)
        //{
        //    try
        //    {
        //        var objToSave = AutoMapper.Mapper.Map<UserTypeModel, UserTypes>(model);
        //        webpages_Roles l = new webpages_Roles();
        //        l.RoleName = objToSave.Title;
        //        ent.webpages_Roles.Add(l);
        //        ent.SaveChanges();
        //        objToSave.CreatedBy = Utility.GetCurrentLoginUser();
        //        objToSave.CreatedDate = DateTime.Now.ToShortDateString().ToString();
        //        //ent.UserTypes.Add(objToSave);
        //        var URpro = new UserRoleProviders();
        //        UserRoleModel newObjToSave = new UserRoleModel();
        //        newObjToSave.Title = model.Title;
        //        URpro.CreateEditUserRoles(newObjToSave);
        //        ent.SaveChanges();
        //    }
        //    catch (Exception ex)
        //    {

        //        Log.Error(string.Format("Error! on Insert UserTypes Data Auction  with error message: {0}",
        //                            ex.Message));
        //        Log.Error(string.Format("Error with exception: {0}", ex.StackTrace));
        //    }

        //}
        /// <summary>
        /// Error updating inserted record too i.e created by and createddate to null
        /// </summary>
        /// <param name="model"></param>
        //public void Update(UserTypeModel model)
        //{
        //    try
        //    {
        //        var objToEdit = ent.UserTypes.Where(x => x.UserTypeId == model.UserTypeId).FirstOrDefault();
        //        AutoMapper.Mapper.Map(model, objToEdit);



        //        objToEdit.UpdatedBy = Utility.GetCurrentLoginUser();
        //        objToEdit.UpdateDate = DateTime.Now.ToShortDateString().ToString();

        //        ent.Entry(objToEdit).State = EntityState.Modified;
        //        ent.SaveChanges();

        //        var lstuser = ent.webpages_Roles.Where(x => x.RoleId == model.UserTypeId).FirstOrDefault();
        //        if (lstuser != null)
        //        {
        //            //webpages_Roles vm = new webpages_Roles();
        //            //vm.RoleId = lstuser.RoleId;
        //            //vm.RoleName = lstuser.RoleName;
        //            lstuser.RoleId = model.UserTypeId;
        //            lstuser.RoleName = model.Title;
        //            ent.SaveChanges();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Log.Error(string.Format("Error! on Update UserTypes Data Auction  with error message: {0}",
        //                             ex.Message));
        //        Log.Error(string.Format("Error with exception: {0}", ex.StackTrace));
        //    }
        //}

        //public void Delete(int usertypeId)
        //{
        //    try
        //    {
        //        var objToEdit = ent.UserTypes.Single(x => x.UserTypeId == usertypeId);
        //        ent.UserTypes.Remove(objToEdit);
        //        ent.SaveChanges();

        //        webpages_Roles l = ent.webpages_Roles.Single(x => x.RoleId == usertypeId);

        //        ent.webpages_Roles.Remove(l);
        //    }
        //    catch (Exception ex)
        //    {
        //        Log.Error(string.Format("Error! on Delete UserTypes Data Auction  with error message: {0}",
        //                                            ex.Message));
        //        Log.Error(string.Format("Error with exception: {0}", ex.StackTrace));
        //    }
        //}
    }
}