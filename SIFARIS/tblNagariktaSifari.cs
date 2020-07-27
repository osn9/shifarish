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
    
    public partial class tblNagariktaSifari
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblNagariktaSifari()
        {
            this.tblNagariktaRelativeDetails = new HashSet<tblNagariktaRelativeDetail>();
        }
    
        public int NewNagariktaId { get; set; }
        public int NagariktaFaramNo { get; set; }
        public string NaamThar { get; set; }
        public string FullName { get; set; }
        public string JanmaMiti { get; set; }
        public string JanmaDate { get; set; }
        public Nullable<int> JanmaPradesh { get; set; }
        public Nullable<int> JanmaJilla { get; set; }
        public Nullable<int> JanmaPalika { get; set; }
        public Nullable<int> JanmaWard { get; set; }
        public Nullable<int> PermaPradesh { get; set; }
        public Nullable<int> PermaJilla { get; set; }
        public Nullable<int> PermaPalika { get; set; }
        public Nullable<int> PermaWard { get; set; }
        public int Gender { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public Nullable<int> WorkOffice { get; set; }
        public Nullable<int> FiscalYear { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblNagariktaRelativeDetail> tblNagariktaRelativeDetails { get; set; }
    }
}
