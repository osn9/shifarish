using SIFARIS;
using SIFARIS.Areas.GharJagga.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Provider
{
    public class Departmentprovider
    {
        public bool Insert(DepartmentModel model)
        {
            using (var con = new SifarishEntities())
            {
                if (model.DeparmentId > 0)
                {

                    var data = con.Departments.Where(x => x.DeparmentId == model.DeparmentId).FirstOrDefault();
                    if (data != null)
                    {
                        data.DepartmentName = model.DepartmentName;
                        data.DepartmentCode = model.DepartmentCode;
                        data.DepartmentAddress = model.DepartmentAddress;
                        data.Status = model.Status;
                        data.CreatedBy = model.CreatedBy;
                        data.CreatedDate = model.CreatedDate;
                        data.DeletedBy = model.DeletedBy;
                        data.DeletedDate = model.DeletedDate;
                        data.UpdatedDate = model.UpdatedDate;
                        data.UpdatedBy = model.UpdatedBy;

                        con.Entry(data).State = System.Data.Entity.EntityState.Modified;



                        // var a=  con.SaveChanges();
                    }
                }
                else
                {
                    Department cdata = new Department()
                    {

                        DepartmentName = model.DepartmentName,
                        DepartmentCode = model.DepartmentCode,
                        DepartmentAddress = model.DepartmentAddress,
                        Status = true,
                    CreatedBy = model.CreatedBy,
                    CreatedDate = model.CreatedDate,
                    DeletedBy = model.DeletedBy,
                    DeletedDate = model.DeletedDate,
                    UpdatedDate = model.UpdatedDate,
                    UpdatedBy = model.UpdatedBy,
                  


                    };
                    con.Departments.Add(cdata);




                }
                int i = con.SaveChanges();
                if (i > 0)
                    return true;
                else
                    return false;
            }
        }
        public List<DepartmentModel> GetAll()
        {
            using (var con = new SifarishEntities())
            {
                var result = con.Departments


                                .Select(x => new DepartmentModel()
                                {
                                    DeparmentId=x.DeparmentId,
                                       DepartmentName = x.DepartmentName,
                        DepartmentCode = x.DepartmentCode,
                        DepartmentAddress = x.DepartmentAddress,
                        Status = true,
                    CreatedBy = x.CreatedBy,
                    CreatedDate = x.CreatedDate,
                    DeletedBy = x.DeletedBy,
                    DeletedDate = x.DeletedDate,
                    UpdatedDate = x.UpdatedDate,
                    UpdatedBy = x.UpdatedBy,

                                }).ToList();
                return result;
            }
        }

        public DepartmentModel GetById(int id)
        {
            using (var con = new SifarishEntities())
            {
                var result = con.Departments

                                .Select(x => new DepartmentModel()
                                {
                                    DeparmentId = x.DeparmentId,
                                    DepartmentName = x.DepartmentName,
                                    DepartmentCode = x.DepartmentCode,
                                    DepartmentAddress = x.DepartmentAddress,
                                    Status = true,
                                    CreatedBy = x.CreatedBy,
                                    CreatedDate = x.CreatedDate,
                                    DeletedBy = x.DeletedBy,
                                    DeletedDate = x.DeletedDate,
                                    UpdatedDate = x.UpdatedDate,
                                    UpdatedBy = x.UpdatedBy,

                                }).Where(x => x.DeparmentId == id).FirstOrDefault();
                return result;
            }
        }
    }
}