using SIFARIS.Areas.SetUp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.SetUp.Provider
{
    public class AssistProvider
    {
        SifarishEntities ent = new SifarishEntities();
        public List<RelationModel> GetRelationList()
        {
            var model = new List<RelationModel>();

            model = (from rel in ent.tblRelations
                     select new RelationModel
                     {
                         RelationId=rel.RelationId,
                         RelationName=rel.RelationName,
                         RelationName_Nep=rel.RelationName_Nep
                     }).ToList();

            return model;
        }
        public RelationModel GetRelationRecords(int? id )
        {
            RelationModel model = (from rel in ent.tblRelations
                                   where rel.RelationId==id
                     select new RelationModel
                     {
                         RelationId = rel.RelationId,
                         RelationName = rel.RelationName,
                         RelationName_Nep = rel.RelationName_Nep
                     }).SingleOrDefault();

            return model;
        }
        public List<EducationModel> GetEducationList()
        {
            var model = new List<EducationModel>();

            model = (from edu in ent.tblEducations
                     select new EducationModel
                     {
                         EducationId=edu.EducationId,
                         Education =edu.Education
                     }).ToList();

            return model;
        }
        public List<OccupationModel> GetOccupationList()
        {
            var model = new List<OccupationModel>();

            model = (from occ in ent.tblOccupations
                     select new OccupationModel
                     {
                         OcupationId=occ.OcupationId,
                         Occupation=occ.Occupation
                         
                     }).ToList();

            return model;
        }
        public List<GenderModel> GetGenderList() {
            var model = new List<GenderModel>();

            model = (from gen in ent.tblGenders
                     select new GenderModel
                     {
                        GenderId=gen.GenderId,
                        Gender=gen.Gender,
                        Gender_Nep=gen.Gender_Nep

                     }).ToList();

            return model;
        }
        public GenderModel GetGenderRecords(int? id) {
        GenderModel model = (from gen in ent.tblGenders
                     where gen.GenderId==id
                     select new GenderModel
                     {
                         GenderId = gen.GenderId,
                         Gender = gen.Gender,
                         Gender_Nep = gen.Gender_Nep

                     }).SingleOrDefault();

            return model;
        }
        public List<JanmaSthanModel> GetJanmaSthanList()
        {
            var model = new List<JanmaSthanModel>();

            model = (from gen in ent.tblJanmaSthaans
                     select new JanmaSthanModel
                     {
                         JanmaSthaanId=gen.JanmaSthaanId,
                         JanmaSthaanName=gen.JanmaSthaanName

                     }).ToList();

            return model;
        }
        public List<JanmadaMaddatModel> GetJanmaMaddatList()
        {
            var model = new List<JanmadaMaddatModel>();

            model = (from gen in ent.tblJanmadaMaddats
                     select new JanmadaMaddatModel
                     {
                        JanmadaMaddatId=gen.JanmadaMaddatId,
                        JanmadaMaddatGarne=gen.JanmadaMaddatGarne

                     }).ToList();

            return model;
        }
        public List<JanmaKisismModel> GetJanmaKisimList()
        {
            var model = new List<JanmaKisismModel>();

            model = (from gen in ent.tblJanmaKisims
                     select new JanmaKisismModel
                     {
                         JanmaKisinId=gen.JanmaKisinId,
                         JanmaKisimName=gen.JanmaKisimName

                     }).ToList();

            return model;
        }
        public List<VivahKisimModel> GetVivahKisimList()
        {
            var model = new List<VivahKisimModel>();

            model = (from gen in ent.tblVivahKisims
                     select new VivahKisimModel
                     {
                         VivahKisimId=gen.VivahKisimId,
                         VivahKisim=gen.VivahKisim,
                         VivahKisim_Nep=gen.VivahKisim_Nep

                     }).ToList();

            return model;
        }
        public VivahKisimModel GetVivahKisimRecords(int? id)
        {
            VivahKisimModel model = (from gen in ent.tblVivahKisims
                                     where gen.VivahKisimId == id
                                 select new VivahKisimModel
                                 {
                                     VivahKisimId = gen.VivahKisimId,
                                     VivahKisim = gen.VivahKisim,
                                     VivahKisim_Nep = gen.VivahKisim_Nep

                                 }).SingleOrDefault();

            return model;
        }
        public List<BasaisaraiKaranModel> GetBasaisaraiKaranList()
        {
            var model = new List<BasaisaraiKaranModel>();

            model = (from gen in ent.tblBasaisaraiKarans
                     select new BasaisaraiKaranModel
                     {
                         BasaisaraiKaranId=gen.BasaisaraiKaranId,
                         BasaisaraiKaran=gen.BasaisaraiKaran

                     }).ToList();

            return model;
        }
        public BasaisaraiKaranModel GetBasaisaraiKaranRecords(int? id)
        {
            BasaisaraiKaranModel model = (from gen in ent.tblBasaisaraiKarans
                                          where gen.BasaisaraiKaranId == id
                                 select new BasaisaraiKaranModel
                                 {
                                     BasaisaraiKaranId = gen.BasaisaraiKaranId,
                                     BasaisaraiKaran = gen.BasaisaraiKaran

                                 }).SingleOrDefault();

            return model;
        }
    }
}