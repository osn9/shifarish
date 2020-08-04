using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.SetUp.Models
{
    public class AssistingModel
    {
    }
    public class RelationModel
    {
        public int RelationId { get; set; }
        public string RelationName { get; set; }
        public string RelationName_Nep { get; set; }
    }
    public class GenderModel
    {
        public int GenderId { get; set; }
        public string Gender { get; set; }
        public string Gender_Nep { get; set; }
    }
    public class JanmadaMaddatModel
    {
        public int JanmadaMaddatId { get; set; }
        public string JanmadaMaddatGarne { get; set; }
    }
    public class JanmaSthanModel
    {
        public int JanmaSthaanId { get; set; }
        public string JanmaSthaanName { get; set; }
    }
    public class JanmaKisismModel
    {
        public int JanmaKisinId { get; set; }
        public string JanmaKisimName { get; set; }
    }
    public class EducationModel
    {
        public int EducationId { get; set; }
        public string Education { get; set; }
    }
    public class OccupationModel
    {
        public int OcupationId { get; set; }
        public string Occupation { get; set; }
    }
    public class VivahKisimModel
    {
        public int VivahKisimId { get; set; }
        public string VivahKisim { get; set; }
        public string VivahKisim_Nep { get; set; }
    }
    public class BasaisaraiKaranModel
    {
        public int BasaisaraiKaranId { get; set; }
        public string BasaisaraiKaran { get; set; }
    }
    public class CourtTypeModel
    {
        public int CourtTypeId { get; set; }
        public string CourtType { get; set; }
        public string CourtType_Nep { get; set; }
    }
}