//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sifaris
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblUserType
    {
        public tblUserType()
        {
            this.tblEmployees = new HashSet<tblEmployee>();
        }
    
        public int UserTypeId { get; set; }
        public string Title { get; set; }
        public int ScheduleId { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
    
        public virtual ICollection<tblEmployee> tblEmployees { get; set; }
    }
}
