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
    
    public partial class JaagaTarfa
    {
        public int jagaTarfa_id { get; set; }
        public string MulSadak { get; set; }
        public string sahayakSadaK { get; set; }
        public string KacchiSadak { get; set; }
        public string Goreto { get; set; }
        public string BatoNavaeko { get; set; }
        public Nullable<int> CitizenId { get; set; }
    
        public virtual Citizen_Info Citizen_Info { get; set; }
    }
}
