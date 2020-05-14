using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SifarishView.Areas.SetUp.Models
{
    public class AssistingViewModel
    {
    }
    public class RelationViewModel
    {
        public int RelationId { get; set; }
        public string RelationName { get; set; }
        public string RelationName_Nep { get; set; }
    }
    public class GenderViewModel
    {
        public int GenderId { get; set; }
        public string Gender { get; set; }
        public string Gender_Nep { get; set; }
    }
    public class JanmadaMaddatViewModel
    {
        public int JanmadaMaddatId { get; set; }
        public string JanmadaMaddatGarne { get; set; }
    }
    public class JanmaSthanViewModel
    {
        public int JanmaSthaanId { get; set; }
        public string JanmaSthaanName { get; set; }
    }
    public class JanmaKisismViewModel
    {
        public int JanmaKisinId { get; set; }
        public string JanmaKisimName { get; set; }
    }
    public class EducationViewModel
    {
        public int EducationId { get; set; }
        public string Education { get; set; }
    }
    public class OccupationViewModel
    {
        public int OcupationId { get; set; }
        public string Occupation { get; set; }
    }
    public class VivahKisimViewModel
    {
        public int VivahKisimId { get; set; }
        public string VivahKisim { get; set; }
        public string VivahKisim_Nep { get; set; }
    }
    public class BasaisaraiKaranViewModel
    {
        public int BasaisaraiKaranId { get; set; }
        public string BasaisaraiKaran { get; set; }
    }
}