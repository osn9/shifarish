//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SIFARIS
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblDistrict
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblDistrict()
        {
            this.tblWorkOffices = new HashSet<tblWorkOffice>();
        }
    
        public int DistrictId { get; set; }
        public Nullable<int> DistrictId_val { get; set; }
        public string DistrictName { get; set; }
        public Nullable<int> StateId_val { get; set; }
        public string DistrictName_Nep { get; set; }
    
        public virtual tblState tblState { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblWorkOffice> tblWorkOffices { get; set; }
    }
}
