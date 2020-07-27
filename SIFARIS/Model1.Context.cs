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
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
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
        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<Month> Months { get; set; }
        public virtual DbSet<tblBasaisaraiDarta> tblBasaisaraiDartas { get; set; }
        public virtual DbSet<tblBasaisaraiDartaInformant> tblBasaisaraiDartaInformants { get; set; }
        public virtual DbSet<tblBasaisaraiKaran> tblBasaisaraiKarans { get; set; }
        public virtual DbSet<tblBasaisaraiPersonalDetail> tblBasaisaraiPersonalDetails { get; set; }
        public virtual DbSet<tblCourtType> tblCourtTypes { get; set; }
        public virtual DbSet<tblDepartment> tblDepartments { get; set; }
        public virtual DbSet<tblDistrict> tblDistricts { get; set; }
        public virtual DbSet<tblDivorceDarta> tblDivorceDartas { get; set; }
        public virtual DbSet<tblDivorceDartaInformant> tblDivorceDartaInformants { get; set; }
        public virtual DbSet<tblDivorceeHusbandDetail> tblDivorceeHusbandDetails { get; set; }
        public virtual DbSet<tblDivorceeWifeDetail> tblDivorceeWifeDetails { get; set; }
        public virtual DbSet<tblEducation> tblEducations { get; set; }
        public virtual DbSet<tblEmployee> tblEmployees { get; set; }
        public virtual DbSet<tblFiscalYear> tblFiscalYears { get; set; }
        public virtual DbSet<tblGender> tblGenders { get; set; }
        public virtual DbSet<tblJaggaCharKillaBibaran> tblJaggaCharKillaBibarans { get; set; }
        public virtual DbSet<tblJaggaDhaniBibaran> tblJaggaDhaniBibarans { get; set; }
        public virtual DbSet<tblJaggaThaunBibaran> tblJaggaThaunBibarans { get; set; }
        public virtual DbSet<tblJanmadaMaddat> tblJanmadaMaddats { get; set; }
        public virtual DbSet<tblJanmaDarta> tblJanmaDartas { get; set; }
        public virtual DbSet<tblJanmaDartaFatherDetail> tblJanmaDartaFatherDetails { get; set; }
        public virtual DbSet<tblJanmaDartaInformant> tblJanmaDartaInformants { get; set; }
        public virtual DbSet<tblJanmaDartaMotherDetail> tblJanmaDartaMotherDetails { get; set; }
        public virtual DbSet<tblJanmaKisim> tblJanmaKisims { get; set; }
        public virtual DbSet<tblJanmaSthaan> tblJanmaSthaans { get; set; }
        public virtual DbSet<tblMrityuDarta> tblMrityuDartas { get; set; }
        public virtual DbSet<tblMrityuDartaInformant> tblMrityuDartaInformants { get; set; }
        public virtual DbSet<tblMrityuDartaPersonalDetail> tblMrityuDartaPersonalDetails { get; set; }
        public virtual DbSet<tblNabalakRelativeDetail> tblNabalakRelativeDetails { get; set; }
        public virtual DbSet<tblNabalakSifari> tblNabalakSifaris { get; set; }
        public virtual DbSet<tblNagariktaRelativeDetail> tblNagariktaRelativeDetails { get; set; }
        public virtual DbSet<tblNagariktaSifari> tblNagariktaSifaris { get; set; }
        public virtual DbSet<tblNataPersonalDetail> tblNataPersonalDetails { get; set; }
        public virtual DbSet<tblNataPramanit> tblNataPramanits { get; set; }
        public virtual DbSet<tblOccupation> tblOccupations { get; set; }
        public virtual DbSet<tblPadha> tblPadhas { get; set; }
        public virtual DbSet<tblPalika> tblPalikas { get; set; }
        public virtual DbSet<tblPanjika> tblPanjikas { get; set; }
        public virtual DbSet<tblRelation> tblRelations { get; set; }
        public virtual DbSet<tblShakha> tblShakhas { get; set; }
        public virtual DbSet<tblShreni> tblShrenis { get; set; }
        public virtual DbSet<tblSifarisType> tblSifarisTypes { get; set; }
        public virtual DbSet<tblState> tblStates { get; set; }
        public virtual DbSet<tblUserProfile> tblUserProfiles { get; set; }
        public virtual DbSet<tblUserType> tblUserTypes { get; set; }
        public virtual DbSet<tblVivahBrideDetail> tblVivahBrideDetails { get; set; }
        public virtual DbSet<tblVivahDarta> tblVivahDartas { get; set; }
        public virtual DbSet<tblVivahDartaInformant> tblVivahDartaInformants { get; set; }
        public virtual DbSet<tblVivahGroomDetail> tblVivahGroomDetails { get; set; }
        public virtual DbSet<tblVivahKisim> tblVivahKisims { get; set; }
        public virtual DbSet<tblWorkOffice> tblWorkOffices { get; set; }
        public virtual DbSet<Year> Years { get; set; }
    
        public virtual ObjectResult<string> sp_GetLocalDate(Nullable<System.DateTime> romanDate, Nullable<int> format)
        {
            var romanDateParameter = romanDate.HasValue ?
                new ObjectParameter("RomanDate", romanDate) :
                new ObjectParameter("RomanDate", typeof(System.DateTime));
    
            var formatParameter = format.HasValue ?
                new ObjectParameter("Format", format) :
                new ObjectParameter("Format", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("sp_GetLocalDate", romanDateParameter, formatParameter);
        }
    
        public virtual ObjectResult<Nullable<System.DateTime>> sp_GetRomanDate(Nullable<int> localYear, Nullable<int> localMonth, Nullable<int> localDay)
        {
            var localYearParameter = localYear.HasValue ?
                new ObjectParameter("LocalYear", localYear) :
                new ObjectParameter("LocalYear", typeof(int));
    
            var localMonthParameter = localMonth.HasValue ?
                new ObjectParameter("LocalMonth", localMonth) :
                new ObjectParameter("LocalMonth", typeof(int));
    
            var localDayParameter = localDay.HasValue ?
                new ObjectParameter("LocalDay", localDay) :
                new ObjectParameter("LocalDay", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<System.DateTime>>("sp_GetRomanDate", localYearParameter, localMonthParameter, localDayParameter);
        }
    }
}
