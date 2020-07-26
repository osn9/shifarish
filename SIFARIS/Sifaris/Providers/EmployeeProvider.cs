using Sifaris.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sifaris.Providers
{
    public class EmployeeProvider
    {
        //public static readonly ILog Log = LogManager.GetLogger(typeof(EmployeeProviders).Namespace);
        SifarisEntities ent = new SifarisEntities();

        public int GetTotalItemCount()
        {
            return ent.tblEmployees.Count();
        }
        /// <summary>
        /// This function is used to check employeelist paging option
        /// </summary>
        /// <param name="page"></param>
        /// <param name="pagesize"></param>
        /// <returns></returns>
        public List<EmployeesModel> GetEmployeesList(int page, int pagesize)
        {
            //return new List<EmployeesModels>(AutoMapper.Mapper.Map<IEnumerable<Employees>, IEnumerable<EmployeesModels>>(ent.Employees.OrderBy(x => x.EmployeeId).Skip((page - 1) * pagesize).Take(pagesize)));
            var emplist = ent.tblEmployees.Where(x => x.Status == true && x.EmployeeId != 1);
            //if (!Utility.IsDev())
            //{
            //    emplist = emplist.Where(x => x.IsAdmin == false);
            //}
            List<EmployeesModel> resultList= emplist.OrderBy(y => y.ShreniId).Skip((page - 1) * pagesize).Take(pagesize).Select(x=>new EmployeesModel{
            EmployeeId=x.EmployeeId,
            EmployeeName=x.EmployeeName,
            EmployeeAddress=x.EmployeeAddress,
            ContactNumber=x.EmployeeContact,
            WorkOfficeId=x.WorkOfficeId,
            ShreniId=x.ShreniId,
            PadhaId=x.PadhaId,
            INVId=x.INVId,
            IsAdmin=x.IsAdmin,
            Status=x.Status
            }).ToList();
            return resultList;
        }


        public EmployeesModel GetEmployeesData(int EmployeeId)
        {
            EmployeesModel result = ent.tblEmployees.Where(x => x.EmployeeId == EmployeeId).Select(y => new EmployeesModel {
                EmployeeId = y.EmployeeId,
                EmployeeName = y.EmployeeName,
                EmployeeAddress = y.EmployeeAddress,
                ContactNumber = y.EmployeeContact,
                WorkOfficeId=y.WorkOfficeId,
                ShreniId = y.ShreniId,
                PadhaId = y.PadhaId,
                INVId = y.INVId,
                IsAdmin = y.IsAdmin,
                Status = y.Status
            }).SingleOrDefault();
            return result;
        }

        public void Insert(EmployeesModel model)
        {
            try
            {
                var objToSave = new tblEmployee()
                {
                    EmployeeId = model.EmployeeId,
                    EmployeeName = model.EmployeeName,
                    EmployeeAddress = model.EmployeeAddress,
                    EmployeeContact = model.ContactNumber,
                    WorkOfficeId=model.WorkOfficeId,
                    ShreniId = model.ShreniId,
                    PadhaId = model.PadhaId,
                    INVId = model.INVId,
                    IsAdmin = model.IsAdmin,
                    Status = model.Status
                };
                
                //objToSave.CreatedBy = Utility.GetCurrentLoginUser();
                objToSave.CreatedDate = DateTime.Now.ToShortDateString().ToString();
                ent.tblEmployees.Add(objToSave);
                ent.SaveChanges();
            }
            catch (Exception ex)
            {

                //Log.Error(string.Format("Error! on Insert Employeee Data Auction  with error message: {0}",
                //                    ex.Message));
                //Log.Error(string.Format("Error with exception: {0}", ex.StackTrace));
            }

        }

        public void Update(EmployeesModel model)
        {
            try
            {
                var objToEdit = ent.tblEmployees.Single(x => x.EmployeeId == model.EmployeeId);
            objToEdit.EmployeeId=model.EmployeeId;
            objToEdit.EmployeeName=model.EmployeeName;
            objToEdit.EmployeeAddress=model.EmployeeAddress;
            objToEdit.EmployeeContact=model.ContactNumber;
            objToEdit.WorkOfficeId=model.WorkOfficeId;
            objToEdit.ShreniId=model.ShreniId;
            objToEdit.PadhaId=model.PadhaId;
            objToEdit.INVId=model.INVId;
            objToEdit.IsAdmin=model.IsAdmin;
            objToEdit.Status = model.Status;
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

        //public void Delete(int EmployeeId)
        //{
        //    try
        //    {
        //        ((SimpleMembershipProvider)Membership.Provider).DeleteAccount(EmployeeId.ToString()); // deletes record from webpages_Membership table
        //        bool value = ((SimpleMembershipProvider)Membership.Provider).DeleteUser(EmployeeId.ToString(), true); // deletes record from UserProfile table 
        //        if (value)
        //        {
        //            var objToEdit = ent.Employees.Single(x => x.EmployeeId == EmployeeId);
        //            ent.Employees.Remove(objToEdit);
        //            ent.SaveChanges();
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        Log.Error(string.Format("Error! on Delete Employeee Data Auction  with error message: {0}",
        //                                            ex.Message));
        //        Log.Error(string.Format("Error with exception: {0}", ex.StackTrace));
        //    }
        //}
        
    }
}