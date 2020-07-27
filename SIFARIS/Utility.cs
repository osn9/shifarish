using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS
{
    public class Utility
    {
        public static int PageSize { get { return 25; } }
        public static int JanmaSifaris { get { return 1; } }
        public static int MrityuSifaris { get { return 2; } }
        public static int VivahSifaris { get { return 3; } }
        public static int BasaisaraiSifaris { get { return 4; } }
        public static int DivorceSifaris { get { return 5; } }
        public static string GetNepaliDate(DateTime? RomanDate, int format)
        {
            if (RomanDate == null)
                return "";
            var ent = new SifarishEntities();
            string NepaliDate = ent.sp_GetLocalDate(RomanDate, format).Single();
            return NepaliDate;
        }

        public static string GetNepaliDateInUnicode(DateTime? RomanDate, int format)
        {
            if (RomanDate == null)
                return "";
            var ent = new SifarishEntities();
            string NepaliDate = ent.sp_GetLocalDate(RomanDate, format).Single();
            return UnicodeConverter.Default(NepaliDate);
        }

        public static DateTime? GetNepaliDateInDateTimeFormat(DateTime? RomanDate)
        {
            if (RomanDate == null)
                return null;
            var ent = new SifarishEntities();
            string NepaliDate = ent.sp_GetLocalDate(RomanDate, 1).Single();

            var da = DateTime.Parse(NepaliDate).Date;

            return da;
        }
        public static DateTime? GetRomanDate(string NepaliDate)
        {
            if (string.IsNullOrEmpty(NepaliDate))
                return null;

            string[] data = NepaliDate.Split(new char[] { '-', '/' });

            var ent = new SifarishEntities();
            int year = int.Parse(data[0]);
            int month = int.Parse(data[1]);
            int day = int.Parse(data[2]);

            return ent.sp_GetRomanDate(year, month, day).FirstOrDefault();

        }
        public static int GetCurrentFisicalYear()
        {
            var _context = new SifarishEntities();
            return _context.tblFiscalYears.First(x => x.IsActive == true).FiscalYearId;
        }
        public static string GetFiscalYearTitle(int id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblFiscalYears.Where(x => x.FiscalYearId == id).SingleOrDefault();
                if (obj != null)
                    return obj.Title;
                else
                    return "";

            }
        }
        public static List<tblFiscalYear> GetFiscalYears()
        {
            using (var ent = new SifarishEntities())
            {
                return ent.tblFiscalYears.ToList();
            }
        }
        public static int GetEmployeeId(int userId)
        {
            using (var _context = new SifarishEntities())
            {
                return _context.Database.SqlQuery<int>("select EmployeeId from UserProfile where UserId=" + userId).FirstOrDefault();
            }
        }
        public static int GetEmployeeUserTypeId(int EmployeeId)
        {
            using (SifarishEntities ent = new SifarishEntities())
            {
                int UserTypeId = ent.tblEmployees.Where(x => x.EmployeeId == EmployeeId).Select(x => x.UserTypeId).FirstOrDefault();
                return UserTypeId;
            }
        }
        public static tblUserType GetUserTypeById(int id)
        {
            using (var ent = new SifarishEntities())
            {
                //return ent.UserTypes.Where(x => x.UserTypeId != 1).ToList();
                return ent.tblUserTypes.Find(id);

            }
        }
        public static List<tblShreni> GetShreniList()
        {
            using (var ent = new SifarishEntities())
            {
                return ent.tblShrenis.ToList();
            }
        }
        public static string GetShreniById(int? id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblShrenis.Where(x => x.ShreniId == id).FirstOrDefault();
                if (obj != null)
                    return obj.ShreniName;
                else
                    return "";
            }
        }
        public static string GetPadhaById(int? id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblPadhas.Where(x => x.PadhaId == id).SingleOrDefault();
                if (obj != null)
                    return obj.PadhaName;
                else
                    return "";
            }
        }
        public static SelectList GetWorkOffice()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblWorkOffices.ToList(), "WorkOfficeId", "Title");
            }
        }
        public static SelectList GetDepartment()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblDepartments.ToList(), "DepartmentId", "DepartmentName");
            }
        }
        public static SelectList GetShreni()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblShrenis.ToList(), "ShreniId", "ShreniName");
            }
        }
        public static SelectList GetShakha()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblShakhas.ToList(), "ShakhaId", "ShakhaName");
            }
        }
        public static SelectList GetPadha()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblPadhas.ToList(), "PadhaId", "PadhaName");
            }
        }
        public static SelectList GetAllDistrict()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblDistricts.ToList(), "DistrictId_val", "DistrictName_Nep");
            }
        }
        public static string GetDistrictById(int? id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblDistricts.Where(x => x.DistrictId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.DistrictName_Nep;
                else
                    return "";
            }
        }
        public static string GetDistrictName(int? id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblDistricts.Where(x => x.DistrictId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.DistrictName;
                else
                    return "";
            }
        }

        public static SelectList GetAllState()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblStates.ToList(), "StateId_val", "StateName_Nep");
            }
        }
        public static string GetStateById(int? id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblStates.Where(x => x.StateId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.StateName_Nep;
                else
                    return "";
            }
        }
        public static string GetStateName(int? id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblStates.Where(x => x.StateId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.StateName;
                else
                    return "";
            }
        }
        public static SelectList GetAllPalika()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblPalikas.ToList(), "PalikaId_val", "PalikaName_Nep");
            }
        }
        public static string GetPalikaById(int? id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblPalikas.Where(x => x.PalikaId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.PalikaName_Nep;
                else
                    return "";
            }
        }
        public static string GetPalikaName(int? id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblPalikas.Where(x => x.PalikaId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.PalikaName;
                else
                    return "";
            }
        }
        public static string GetEmployeeName()
        {
            using (var ent = new SifarishEntities())
            {
                //var employee= ent.Employees.Where(x=>x.EmployeeId != 1).FirstOrDefault();
                var employee = ent.tblEmployees.FirstOrDefault();
                return "[" + employee.INVId + "]" + employee.EmployeeName;
            }
        }
        public static string GetWorkOfficeName(int id)
        {
            using (var ent = new SifarishEntities())
            {
                return ent.tblWorkOffices.Where(x => x.WorkOfficeId == id).Select(x => x.Title).FirstOrDefault();
            }
        }
        public static string GetWorkOfficeAddress()
        {
            using (var ent = new SifarishEntities())
            {
                return ent.tblWorkOffices.Select(x => x.WorkOfficeAddress).FirstOrDefault();
            }
        }
        public static IEnumerable<System.Web.Mvc.SelectListItem> Getalldepartmet()
        {
            //var WareHouseId = GetCurrentLoginUserWorkOfficeId();
            List<object> obj = new List<object>();
            using (var ent = new SifarishEntities())
            {
                var list = ent.tblDepartments.ToList();

                foreach (var item in list)
                {
                    obj.Add(new
                    {
                        id = item.DepartmentId,
                        DepartmentName = item.DepartmentName
                    });
                }
            }
            return new SelectList(obj, "id", "DepartmentName");

        }

        //public static IEnumerable<System.Web.Mvc.SelectListItem> GetallEmployee()
        //{
        //    var WareHouseId = GetCurrentLoginUserWorkOfficeId();
        //    List<object> obj = new List<object>();
        //    using (var ent = new SifarishEntities())
        //    {
        //        var list = ent.tblEmployees.Where(x => x.EmployeeId != 1 && x.Status == true).ToList();

        //        foreach (var item in list)
        //        {
        //            obj.Add(new
        //            {
        //                id = item.EmployeeId,
        //                //EmpName = item.EmpName + "[" + item.Rank + "]"
        //                EmpName = item.EmployeeName + "[ " + item.INVId + " ]"
        //            });
        //        }
        //    }
        //    return new SelectList(obj, "id", "EmpName");
        //}               
        //public static SelectList GetUserType()
        //{
        //    using (var ent = new SifarishEntities())
        //    {
        //        if (IsDev())
        //        {
        //            return new SelectList(ent.tblUserTypes.ToList(), "UserTypeId", "Title");
        //        }
        //        else
        //            return new SelectList(ent.tblUserTypes.Where(x => x.UserTypeId != 1).ToList(), "UserTypeId", "Title");
        //    }
        //}
        //userscontext error
        //public static bool IsDev()
        //{
        //    string UserName = HttpContext.Current.User.Identity.Name;
        //    var ux = new UsersContext();
        //    var ent = new SifarishEntities();

        //    var data = ux.UserProfiles.Single(x => x.UserName == UserName);
        //    var emp = ent.tblEmployees.Find(data.EmployeeId);
        //    if (UserName == "superadmin" || data.EmployeeId == 1 || data.UserId == 1 || emp.IsAdmin)
        //    {
        //        return true;
        //    }
        //    return false;
        //}
        //public static bool IsSuper()
        //{
        //    string UserName = HttpContext.Current.User.Identity.Name;
        //    var ux = new UsersContext();
        //    var ent = new SifarishEntities();

        //    var data = ux.UserProfiles.Single(x => x.UserName == UserName);
        //    var emp = ent.tblEmployees.Find(data.EmployeeId);
        //    if (UserName == "superadmin" || data.EmployeeId == 1 || data.UserId == 1)
        //    {
        //        return true;
        //    }
        //    return false;

        //}
        //public static int GetCurrentLoginUser()
        //{
        //    string UserName = HttpContext.Current.User.Identity.Name;
        //    using (var ux = new UsersContext())
        //    {
        //        return ux.UserProfiles.Where(x => x.UserName == UserName).Select(x => x.UserId).FirstOrDefault();
        //    }
        //}
        //public static int GetCurrentLoginEmployeeId()
        //{

        //    string UserName = HttpContext.Current.User.Identity.Name;
        //    if (UserName != null)
        //    {
        //        using (var ux = new UsersContext())
        //        {
        //            var data = ux.UserProfiles.Single(x => x.UserName == UserName);
        //            if (data != null)
        //                return data.EmployeeId.Value;
        //            else
        //                return 0;
        //        }
        //    }
        //    else
        //    {
        //        return 0;
        //    }
        //}
        //public static string GetCurrentLoginEmployeeName()
        //{
        //    string UserName = HttpContext.Current.User.Identity.Name;
        //    using (var ux = new UsersContext())
        //    {
        //        var data = ux.UserProfiles.Single(x => x.UserName == UserName);
        //        using (var ent = new SifarishEntities())
        //        {
        //            if (data != null)
        //            {
        //                //return ent.Employees.Find(data.EmployeeId ?? 0);
        //                var employee = ent.tblEmployees.FirstOrDefault(x => x.EmployeeId == (data.EmployeeId ?? 0));
        //                return employee.EmployeeName + " [" + employee.INVId + "]";
        //            }
        //            else
        //                return "";
        //        }

        //    }
        //}
        //public static int GetCurrentLoginUserWorkOfficeId()
        //{
        //    var ent = new SifarishEntities();
        //    using (var ux = new UsersContext())
        //    {
        //        int UserId = GetCurrentLoginUser();
        //        var ctx = new UsersContext();
        //        var Employeeid = ctx.UserProfiles.Where(x => x.UserId == UserId).Select(x => x.EmployeeId).FirstOrDefault();
        //        if (Employeeid == null)
        //        {
        //            return -1;
        //        }
        //        int val = ent.tblEmployees.Where(x => x.EmployeeId == Employeeid).Select(x => x.WorkOfficeId).FirstOrDefault();
        //        return val;
        //    }
        //}

        public static int GetMaxJanmaDartaNo(int sifarisId)
        {
            using (var ent = new SifarishEntities())
            {
                var ActiveFiscalYearId = ent.tblFiscalYears.Where(x => x.IsActive == true).FirstOrDefault().FiscalYearId;
                var maxid = ent.tblPanjikas.Where(x => x.FiscalYear == ActiveFiscalYearId && x.SifarisType == sifarisId).Max(x => x.JanmaDartaFaramNo);
                if (maxid == null)
                {
                    maxid = 0;
                }
                return Convert.ToInt32(maxid + 1);
            }
        }
        public static int GetMaxMrityuDartaNo(int sifarisId)
        {
            using (var ent = new SifarishEntities())
            {
                var ActiveFiscalYearId = ent.tblFiscalYears.Where(x => x.IsActive == true).FirstOrDefault().FiscalYearId;
                var maxid = ent.tblPanjikas.Where(x => x.FiscalYear == ActiveFiscalYearId && x.SifarisType == sifarisId).Max(x => x.MrityuDartaFaramNo);
                if (maxid == null)
                {
                    maxid = 0;
                }
                return Convert.ToInt32(maxid + 1);
            }
        }
        public static int GetMaxVivahDartaNo(int sifarisId)
        {
            using (var ent = new SifarishEntities())
            {
                var ActiveFiscalYearId = ent.tblFiscalYears.Where(x => x.IsActive == true).FirstOrDefault().FiscalYearId;
                var maxid = ent.tblPanjikas.Where(x => x.FiscalYear == ActiveFiscalYearId && x.SifarisType == sifarisId).Max(x => x.VivahDartaFaramNo);
                if (maxid == null)
                {
                    maxid = 0;
                }
                return Convert.ToInt32(maxid + 1);
            }
        }
        public static int GetMaxBasaisaraiDartaNo(int sifarisId)
        {
            using (var ent = new SifarishEntities())
            {
                var ActiveFiscalYearId = ent.tblFiscalYears.Where(x => x.IsActive == true).FirstOrDefault().FiscalYearId;
                var maxid = ent.tblPanjikas.Where(x => x.FiscalYear == ActiveFiscalYearId && x.SifarisType == sifarisId).Max(x => x.MigrationDartaFaramNo);
                if (maxid == null)
                {
                    maxid = 0;
                }
                return Convert.ToInt32(maxid + 1);
            }
        }
        public static int GetMaxDivorceDartaNo(int sifarisId)
        {
            using (var ent = new SifarishEntities())
            {
                var ActiveFiscalYearId = ent.tblFiscalYears.Where(x => x.IsActive == true).FirstOrDefault().FiscalYearId;
                var maxid = ent.tblPanjikas.Where(x => x.FiscalYear == ActiveFiscalYearId && x.SifarisType == sifarisId).Max(x => x.DivorceDartaFaramNo);
                if (maxid == null)
                {
                    maxid = 0;
                }
                return Convert.ToInt32(maxid + 1);
            }
        }
        public static SelectList GetJanmasthaan()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblJanmaSthaans.ToList(), "JanmaSthaanId", "JanmaSthaanName");
            }
        }
        public static SelectList GetJanmaMaddat()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblJanmadaMaddats.ToList(), "JanmadaMaddatId", "JanmadaMaddatGarne");
            }
        }
        public static SelectList GetGender()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblGenders.ToList(), "GenderId", "Gender_Nep");
            }
        }
        public static string GetGenderById(int? id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblGenders.Where(x => x.GenderId == id).SingleOrDefault();
                if (obj != null)
                    return obj.Gender_Nep;
                else
                    return "";
            }
        }
        public static SelectList GetJanmaKisim()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblJanmaKisims.ToList(), "JanmaKisinId", "JanmaKisimName");
            }
        }
        public static SelectList GetOccupation()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblOccupations.ToList(), "OcupationId", "Occupation");
            }
        }
        public static SelectList GetEducation()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblEducations.ToList(), "EducationId", "Education");
            }
        }
        public static SelectList GetRelation()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblRelations.ToList(), "RelationId", "RelationName_Nep");
            }
        }
        public static string GetRelationById(int? id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblRelations.Where(x => x.RelationId == id).SingleOrDefault();
                if (obj != null)
                    return obj.RelationName_Nep;
                else
                    return "";
            }
        }
        public static SelectList GetVivahKisim()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblVivahKisims.ToList(), "VivahKisimId", "VivahKisim_Nep");
            }
        }
        public static string GetVivahKisimById(int? id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblVivahKisims.Where(x => x.VivahKisimId == id).SingleOrDefault();
                if (obj != null)
                    return obj.VivahKisim_Nep;
                else
                    return "";
            }
        }
        public static string GetVivahKisimName(int? id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblVivahKisims.Where(x => x.VivahKisimId == id).SingleOrDefault();
                if (obj != null)
                    return obj.VivahKisim;
                else
                    return "";
            }
        }
        public static SelectList GetBasaisaraiKaran()
        {
            using (var ent = new SifarishEntities())
            {
                return new SelectList(ent.tblBasaisaraiKarans.ToList(), "BasaisaraiKaranId", "BasaisaraiKaran");
            }
        }
        public static string GetBasaisaraiKaranById(int? id)
        {
            using (var ent = new SifarishEntities())
            {
                var obj = ent.tblBasaisaraiKarans.Where(x => x.BasaisaraiKaranId == id).SingleOrDefault();
                if (obj != null)
                    return obj.BasaisaraiKaran;
                else
                    return "";
            }
        }
    }
}