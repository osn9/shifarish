﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SifarishEntities : DbContext
    {
        public SifarishEntities()
            : base("name=SifarishEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Citizen_GharJagga_Info> Citizen_GharJagga_Info { get; set; }
        public virtual DbSet<JaagaTarfa> JaagaTarfas { get; set; }
        public virtual DbSet<Karlayatarfa> Karlayatarfas { get; set; }
        public virtual DbSet<District> Districts { get; set; }
        public virtual DbSet<DistrictDetail> DistrictDetails { get; set; }
        public virtual DbSet<LocalLevel> LocalLevels { get; set; }
        public virtual DbSet<LocalLevelDetail> LocalLevelDetails { get; set; }
        public virtual DbSet<State> States { get; set; }
        public virtual DbSet<StateDetail> StateDetails { get; set; }
        public virtual DbSet<Ward> Wards { get; set; }
        public virtual DbSet<WardDetail> WardDetails { get; set; }
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<Citizen_Info> Citizen_Info { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<fiscal_year> fiscal_year { get; set; }
        public virtual DbSet<NirmanBebasahi> NirmanBebasahis { get; set; }
        public virtual DbSet<NirmanBebasahiApproval> NirmanBebasahiApprovals { get; set; }
        public virtual DbSet<Demolition> Demolitions { get; set; }
        public virtual DbSet<gharBato> gharBatoes { get; set; }
        public virtual DbSet<GharJaggaKar> GharJaggaKars { get; set; }
        public virtual DbSet<GharjaggakarFile> GharjaggakarFiles { get; set; }
    }
}
