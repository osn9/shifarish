using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SifarishView.Areas.GharJagga.Models
{
    public class CommonViewModel
    {
        public class StateViewModel
        {
            public long Id { get; set; }
            public string Name { get; set; }
            public Nullable<long> StateDetailsId { get; set; }
            public string Capital { get; set; }
            public string ChiefMinister { get; set; }
            public string PDensity { get; set; }
            public string Governer { get; set; }
            public string Population { get; set; }
            public string Area { get; set; }
            public string Website { get; set; }
            public Nullable<int> TotalDist { get; set; }
        }
        public class DistrictViewModel
        {
            public long Id { get; set; }
            public string Name { get; set; }
            public long StateId { get; set; }
            public Nullable<long> DistrictDetailsId { get; set; }
            public string HeadQuater { get; set; }
            public string PDensity { get; set; }
            public string Population { get; set; }
            public string Area { get; set; }
            public string Website { get; set; }
        }
        public class LocalLevelViewModel
        {
            public long Id { get; set; }
            public string Name { get; set; }
            public string Type { get; set; }
            public long DistId { get; set; }
            public Nullable<int> MaxWardNo { get; set; }
            public Nullable<long> LocalLevelDetailsId { get; set; }
            public string Area { get; set; }
            public string Density { get; set; }
            public string Population { get; set; }
            public string Website { get; set; }
        }
        public class WardViewModel
        {
            public long Id { get; set; }
            public Nullable<long> WardNo { get; set; }

            public Nullable<long> LocalLevelId { get; set; }
            public long wardDetailsId { get; set; }
            public string Area { get; set; }
            public string Density { get; set; }
            public string Popullation { get; set; }
        }

        public class TestWard
        {
            public int Id { get; set; }
            public int Value { get; set; }
        }
        public class DepartmentViewModel
        {
            public long Id { get; set; }
            public string Name { get; set; }
            public Nullable<long> LocalLevelId { get; set; }
        }
        public class DesignationViewModel
        {
            public long Id { get; set; }
            public string Name { get; set; }
            public Nullable<long> DepartmentId { get; set; }
        }
        public class EmployeeViewModel
        {
            public long Id { get; set; }
            public string Name { get; set; }
            public long DepartmentId { get; set; }
            public long DesignationId { get; set; }
            public Nullable<long> WardId { get; set; }
            public string Phone { get; set; }
            public string Photo { get; set; }
            public string Address { get; set; }
            public long LocalLevelId { get; set; }
            public bool IsActive { get; set; }

        }
    }
}