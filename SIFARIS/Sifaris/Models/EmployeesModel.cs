using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sifaris.Models
{
    public class EmployeesModel
    {
        public int EmployeeId { get; set; }

        [DisplayName("कार्यालय")]
        public int WorkOfficeId { get; set; }
        public string Title { get; set; }

        [DisplayName("महाशाखा")]
        public int? DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        [Required(ErrorMessage = "*")]
        [DisplayName("कर्मचारीको किसिम")]
        public int UserTypeId { get; set; }
        public string UserTypeName { get; set; }
        public int UserTypeScheduleID { get; set; }

        [Required(ErrorMessage = "*")]
        [DisplayName("कर्मचारीको नाम")]
        public string EmployeeName { get; set; }

        [DisplayName("कर्मचारीको ठेगाना")]
        public string EmployeeAddress { get; set; }
        [DisplayName("शाखा")]
        public int? ShakhaId { get; set; }
        public string ShakhaName { get; set; }
        [DisplayName("सम्पर्क नम्बर")]
        public string ContactNumber { get; set; }

        [Required(ErrorMessage = "*")]
        [DisplayName("श्रेणी")]
        public int? ShreniId { get; set; }
        public string ShreniName { get; set; }
        [Required(ErrorMessage = "*")]
        [DisplayName("पद")]
        public int? PadhaId { get; set; }
        public string PadhName { get; set; }
        [DisplayName("कर्मचारी संकेत नं")]
        public Nullable<int> INVId { get; set; }
        [DisplayName("सक्रिय")]
        public bool Status { get; set; }
        public bool IsAdmin { get; set; }



        public List<EmployeesModel> EmployeesList { get; set; }

        public IEnumerable<SelectListItem> GetEmployeesList()
        {
            List<object> obj = new List<object>();
            using (SifarisEntities ent = new SifarisEntities())
            {
                var vitem = ent.tblEmployees.ToList();
                foreach (var item in vitem)
                {
                    obj.Add(new
                    {
                        id = item.EmployeeId,
                        Name = item.EmployeeName
                    });
                }
                return new SelectList(obj, "id", "Name");
            }

        }
    }
}