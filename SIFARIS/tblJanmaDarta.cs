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
    
    public partial class tblJanmaDarta
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblJanmaDarta()
        {
            this.tblJanmaDartaFatherDetails = new HashSet<tblJanmaDartaFatherDetail>();
            this.tblJanmaDartaInformants = new HashSet<tblJanmaDartaInformant>();
            this.tblJanmaDartaMotherDetails = new HashSet<tblJanmaDartaMotherDetail>();
        }
    
        public int NewbornId { get; set; }
        public int PanjiId { get; set; }
        public string NewbornNaam { get; set; }
        public string NewbornName { get; set; }
        public string JanmaMiti { get; set; }
        public string JanmaDate { get; set; }
        public Nullable<int> JanmaSthaan { get; set; }
        public Nullable<int> JanmadaMadatt { get; set; }
        public int Gender { get; set; }
        public Nullable<int> JanmaKisim { get; set; }
        public string JanmaJaatJati { get; set; }
        public Nullable<int> JanmaPradesh { get; set; }
        public Nullable<int> JanmaJilla { get; set; }
        public Nullable<int> JanmaPalika { get; set; }
        public Nullable<int> JanmaWardNo { get; set; }
        public string JanmaBidesh { get; set; }
        public string JanmaForeign { get; set; }
        public string BajekoNaam { get; set; }
        public string GrandFather { get; set; }
    
        public virtual tblPanjika tblPanjika { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblJanmaDartaFatherDetail> tblJanmaDartaFatherDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblJanmaDartaInformant> tblJanmaDartaInformants { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblJanmaDartaMotherDetail> tblJanmaDartaMotherDetails { get; set; }
    }
}