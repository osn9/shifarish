using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SIFARIS.Areas.GharJagga.Models;
using SIFARIS.Models;

namespace SIFARIS.Areas.GharJagga.Provider
{
    public class CommonProvider
    {
        public List<StateViewModel> GetAllState()
        {
            using (var con = new SifarishEntities())
            {
                var data = (from s in con.States
                            join st in con.StateDetails on s.Id equals st.StateId into group1
                            from g1 in group1.DefaultIfEmpty()
                            select new StateViewModel
                            {
                                Id = s.Id,
                                Name = s.Name,
                                StateDetailsId = (long)g1.Id,
                                Capital = g1.Capital,
                                Area = g1.Area,
                                ChiefMinister = g1.ChiefMinister,
                                Governer = g1.Governer,
                                PDensity = g1.PDensity,
                                Population = g1.Population,
                                TotalDist = g1.TotalDist,
                                Website = g1.Website,
                            }).ToList();
                return data;
            }
        }
        public StateViewModel GetStateDetailsById(int StateId)
        {
            using (var con = new SifarishEntities())
            {
                var data = (from s in con.States
                            join st in con.StateDetails on s.Id equals st.StateId into group1
                            from g1 in group1.DefaultIfEmpty()
                            where s.Id == StateId
                            select new StateViewModel
                            {
                                Id = s.Id,
                                Name = s.Name,
                                StateDetailsId = (long)g1.Id,
                                Capital = g1.Capital,
                                Area = g1.Area,
                                ChiefMinister = g1.ChiefMinister,
                                Governer = g1.Governer,
                                PDensity = g1.PDensity,
                                Population = g1.Population,
                                TotalDist = g1.TotalDist,
                                Website = g1.Website,
                            }).FirstOrDefault();
                return data;
            }
        }

        public bool InsertState(StateViewModel model)
        {
            using (var con = new SifarishEntities())
            {
                if (model.Id > 0)
                {
                    var state = con.States.Where(x => x.Id == model.Id).FirstOrDefault();
                    if (state != null)
                    {
                        state.Name = model.Name;
                        con.Entry(state).State = System.Data.Entity.EntityState.Modified;
                    }
                    if (model.StateDetailsId > 0)
                    {
                        var stateDetails = con.StateDetails.Where(x => x.Id == model.StateDetailsId).FirstOrDefault();
                        if (stateDetails != null)
                        {
                            stateDetails.Capital = model.Capital;
                            stateDetails.ChiefMinister = model.ChiefMinister;
                            stateDetails.PDensity = model.PDensity;
                            stateDetails.Governer = model.Governer;
                            stateDetails.Population = model.Population;
                            stateDetails.Area = model.Area;
                            stateDetails.Website = model.Website;
                            stateDetails.TotalDist = model.TotalDist;
                            con.Entry(stateDetails).State = System.Data.Entity.EntityState.Modified;
                        }
                    }
                    else
                    {
                        StateDetail statedetail = new StateDetail()
                        {
                            Capital = model.Capital,
                            Area = model.Area,
                            ChiefMinister = model.ChiefMinister,
                            Governer = model.Governer,
                            PDensity = model.PDensity,
                            Population = model.Population,
                            TotalDist = model.TotalDist,
                            Website = model.Website,
                            StateId = model.Id,
                        };
                        con.StateDetails.Add(statedetail);
                    }
                    int i = con.SaveChanges();
                    if (i > 0)
                        return true;
                    else
                        return false;
                }
                else
                {
                    StateDetail statedetail = new StateDetail()
                    {
                        Capital = model.Capital,
                        Area = model.Area,
                        ChiefMinister = model.ChiefMinister,
                        Governer = model.Governer,
                        PDensity = model.PDensity,
                        Population = model.Population,
                        TotalDist = model.TotalDist,
                        Website = model.Website,
                        State = new State()
                        {
                            Name = model.Name
                        }
                    };
                    con.StateDetails.Add(statedetail);
                    int i = con.SaveChanges();
                    if (i > 0)
                        return true;
                    else
                        return false;
                }
            }
        }

        public List<DistrictViewModel> GetAllDistrict()
        {
            using (var con = new SifarishEntities())
            {
                var data = (from d in con.Districts
                            join dt in con.DistrictDetails on d.Id equals dt.DistId into group1
                            from g1 in group1.DefaultIfEmpty()
                            select new DistrictViewModel
                            {
                                Id = d.Id,
                                Name = d.Name,
                                HeadQuater = g1.HeadQuater,
                                Area = g1.Area,
                                PDensity = g1.PDensity,
                                Population = g1.Population,
                                Website = g1.Website,
                                DistrictDetailsId = g1.Id,
                                StateId = d.StateId
                            }).ToList();
                return data;
            }
        }
        public DistrictViewModel GetDistrictsDetailsById(int DistrictId)
        {
            using (var con = new SifarishEntities())
            {
                var data = (from d in con.Districts
                            join dt in con.DistrictDetails on d.Id equals dt.DistId into group1
                            from g1 in group1.DefaultIfEmpty()
                            where d.Id == DistrictId
                            select new DistrictViewModel
                            {
                                Id = d.Id,
                                Name = d.Name,
                                HeadQuater = g1.HeadQuater,
                                PDensity = g1.PDensity,
                                Population = g1.Population,
                                Area = g1.Area,
                                Website = g1.Website,
                                DistrictDetailsId = g1.Id,
                                StateId = d.StateId
                            }).FirstOrDefault();
                return data;
            }
        }
        public bool InsertDistrict(DistrictViewModel model)
        {
            using (var con = new SifarishEntities())
            {
                if (model.Id > 0)
                {
                    var district = con.Districts.Where(x => x.Id == model.Id).FirstOrDefault();
                    if (district != null)
                    {
                        district.Name = model.Name;
                        district.StateId = model.StateId;
                        con.Entry(district).State = System.Data.Entity.EntityState.Modified;
                    }
                    if (model.DistrictDetailsId > 0)
                    {
                        var districtDetails = con.DistrictDetails.Where(x => x.Id == model.DistrictDetailsId).FirstOrDefault();
                        if (districtDetails != null)
                        {
                            districtDetails.HeadQuater = model.HeadQuater;
                            districtDetails.PDensity = model.PDensity;
                            districtDetails.Population = model.Population;
                            districtDetails.Area = model.Area;
                            districtDetails.Website = model.Website;
                            con.Entry(districtDetails).State = System.Data.Entity.EntityState.Modified;
                        }
                    }
                    else
                    {
                        DistrictDetail districtdetail = new DistrictDetail()
                        {
                            HeadQuater = model.HeadQuater,
                            PDensity = model.PDensity,
                            Population = model.Population,
                            Area = model.Area,
                            Website = model.Website,
                            DistId = model.Id,
                        };
                        con.DistrictDetails.Add(districtdetail);
                    }
                    int i = con.SaveChanges();
                    if (i > 0)
                        return true;
                    else
                        return false;

                }
                else
                {
                    DistrictDetail districtdetail = new DistrictDetail()
                    {
                        HeadQuater = model.HeadQuater,
                        PDensity = model.PDensity,
                        Population = model.Population,
                        Area = model.Area,
                        Website = model.Website,
                        District = new District()
                        {
                            Name = model.Name
                        }
                    };
                    con.DistrictDetails.Add(districtdetail);
                    int i = con.SaveChanges();
                    if (i > 0)
                        return true;
                    else
                        return false;
                }
            }
        }
        public List<LocalLevelViewModel> GetAllLocalLevel()
        {
            using (var con = new SifarishEntities())
            {
                var data = (from l in con.LocalLevels
                            join lt in con.LocalLevelDetails on l.Id equals lt.LocalLevelId into group1
                            from g1 in group1.DefaultIfEmpty()
                            select new LocalLevelViewModel
                            {
                                Id = l.Id,
                                Name = l.Name,
                                Type = l.Type,
                                DistId = l.DistId,
                                MaxWardNo = l.MaxWardNo,
                                Area = g1.Area,
                                Density = g1.Density,
                                Population = g1.Population,
                                Website = g1.Website
                            }).ToList();
                return data;
            }
        }

        public LocalLevelViewModel GetLocalLevelsDetailsById(int LocalLevelId)
        {
            using (var con = new SifarishEntities())
            {

                var data = (from l in con.LocalLevels
                            join lt in con.LocalLevelDetails on l.Id equals lt.LocalLevelId into group1
                            from g1 in group1.DefaultIfEmpty()
                            where l.Id == LocalLevelId
                            select new LocalLevelViewModel
                            {
                                Id = l.Id,
                                Name = l.Name,
                                Type = l.Type,
                                DistId = l.DistId,
                                MaxWardNo = l.MaxWardNo,
                                Area = g1.Area,
                                Density = g1.Density,
                                Population = g1.Population,
                                Website = g1.Website,
                                LocalLevelDetailsId = g1.Id
                            }).FirstOrDefault();
                return data;
            }
        }
        public bool InsertLocalLevel(LocalLevelViewModel model)
        {
            using (var con = new SifarishEntities())
            {
                if (model.Id > 0)
                {
                    var locallevel = con.LocalLevels.Where(x => x.Id == model.Id).FirstOrDefault();
                    if (locallevel != null)
                    {
                        locallevel.Name = model.Name;
                        locallevel.Type = model.Type;
                        locallevel.DistId = model.DistId;
                        locallevel.MaxWardNo = model.MaxWardNo;
                        con.Entry(locallevel).State = System.Data.Entity.EntityState.Modified;
                    }
                    if (model.LocalLevelDetailsId > 0)
                    {
                        var locallevelDetails = con.LocalLevelDetails.Where(x => x.Id == model.LocalLevelDetailsId).FirstOrDefault();
                        if (locallevelDetails != null)
                        {
                            locallevelDetails.Area = model.Area;
                            locallevelDetails.Density = model.Density;
                            locallevelDetails.Population = model.Population;
                            locallevelDetails.Website = model.Website;
                            con.Entry(locallevelDetails).State = System.Data.Entity.EntityState.Modified;
                        }
                    }
                    else
                    {
                        LocalLevelDetail locallevelDetails = new LocalLevelDetail()
                        {
                            Area = model.Area,
                            Density = model.Density,
                            Population = model.Population,
                            Website = model.Website,
                            LocalLevelId = model.Id
                        };
                        con.LocalLevelDetails.Add(locallevelDetails);
                    }
                    int i = con.SaveChanges();
                    if (i > 0)
                        return true;
                    else
                        return false;

                }
                else
                {
                    LocalLevelDetail locallevelDetails = new LocalLevelDetail()
                    {
                        Area = model.Area,
                        Density = model.Density,
                        Population = model.Population,
                        Website = model.Website,
                        LocalLevel = new LocalLevel()
                        {
                            Name = model.Name,
                            Type = model.Type,
                            DistId = model.DistId,
                            MaxWardNo = model.MaxWardNo
                        }
                    };
                    con.LocalLevelDetails.Add(locallevelDetails);
                    int i = con.SaveChanges();
                    if (i > 0)
                        return true;
                    else
                        return false;
                }
            }
        }

        public List<WardViewModel> GetAllWard()
        {
            using (var con = new SifarishEntities())
            {
                var data = (from w in con.Wards
                            join wt in con.WardDetails on w.Id equals wt.WardId into group1
                            from g1 in group1.DefaultIfEmpty()
                            select new WardViewModel
                            {
                                WardNo = w.WardNo,
                                LocalLevelId = w.LocalLevelId,
                                Area = g1.Area,
                                Density = g1.Density,
                                Popullation = g1.Popullation,
                            }).ToList();
                return data;
            }

        }
        public WardViewModel GetWardDetailsById(int WardId)
        {
            using (var con = new SifarishEntities())
            {
                var data = (from w in con.Wards
                            join wt in con.WardDetails on w.Id equals wt.WardId into group1
                            from g1 in group1.DefaultIfEmpty()
                            where w.Id == WardId
                            select new WardViewModel
                            {
                                WardNo = w.WardNo,
                                LocalLevelId = w.LocalLevelId,
                                Area = g1.Area,
                                Density = g1.Density,
                                Popullation = g1.Popullation,
                                wardDetailsId = g1.Id,
                            }).FirstOrDefault();
                return data;
            }

        }

        public bool InsertWard(WardViewModel model)
        {
            using (var con = new SifarishEntities())
            {
                if (model.Id > 0)
                {
                    var result = con.Wards.Where(x => x.Id == model.Id).FirstOrDefault();
                    if (result != null)
                    {
                        result.WardNo = model.WardNo;
                        //result.LocalLevelId = model.LocalLevelId;
                        con.Entry(result).State = System.Data.Entity.EntityState.Modified;
                    }
                    if (model.wardDetailsId > 0)
                    {
                        var details = con.WardDetails.Where(x => x.Id == model.wardDetailsId).FirstOrDefault();
                        if (details != null)
                        {
                            details.Area = model.Area;
                            details.Density = model.Density;
                            details.Popullation = model.Popullation;
                            con.Entry(details).State = System.Data.Entity.EntityState.Modified;
                        }
                    }
                    else
                    {
                        WardDetail warddetail = new WardDetail()
                        {
                            Area = model.Area,
                            Density = model.Density,
                            Popullation = model.Popullation,
                            WardId = model.Id,
                        };
                        con.WardDetails.Add(warddetail);
                    }
                }
                else
                {
                    WardDetail wardDetails = new WardDetail()
                    {
                        Area = model.Area,
                        Density = model.Density,
                        Popullation = model.Popullation,
                        Ward = new Ward()
                        {
                            WardNo = model.WardNo,
                            LocalLevelId = model.LocalLevelId
                        }
                    };
                    con.WardDetails.Add(wardDetails);
                }
                int i = con.SaveChanges();
                if (i > 0)
                    return true;
                else
                    return false;
            }
        }

        public List<roleViewModel> GetAllRole()
        {
            using (var con = new SifarishEntities())
            {
                var data = (from w in con.AspNetRoles
                            select new roleViewModel
                            {
                                id = w.Id,
                                name = w.Name,

                            }).ToList();
                return data;
            }

        }
        public roleViewModel GetRoleById(string id)
        {
            using (var con = new SifarishEntities())
            {
                var data = (from w in con.AspNetRoles
                            select new roleViewModel
                            {
                                id = w.Id,
                                name = w.Name,

                            }).Where(x => x.id == id).FirstOrDefault();
                return data;
            }

        }

        public List<RegisterBindingModel> getUserwithRole()
        {
            using (var con = new SifarishEntities())
            {
                List<RegisterBindingModel> list = new List<RegisterBindingModel>();
                var db = new ApplicationDbContext();
                var users = db.Users.ToList();
                foreach (var item in users)
                {
                    RegisterBindingModel data = new RegisterBindingModel
                    {
                        Email = item.Email,
                        UserId=item.Id,
                        //item.Id
                        RoleId = item.Roles.FirstOrDefault()!=null ? item.Roles.FirstOrDefault().RoleId : ""
                    

                };
                    list.Add(data);
                }
                return list;

            }


        }
        public RegisterBindingModel getUserwithRoleById(string id)
        {
            using (var con = new SifarishEntities())
            {
                List<RegisterBindingModel> list = new List<RegisterBindingModel>();
                var db = new ApplicationDbContext();
                var users = db.Users.Where(x=>x.Id== id).FirstOrDefault();

                if (users!=null)
                {
                    RegisterBindingModel data = new RegisterBindingModel
                    {
                        Email = users.Email,
                        RoleId = users.Roles.FirstOrDefault() != null ? users.Roles.FirstOrDefault().RoleId : "",
                        UserId=users.Id

                    };
                    return data;
                }

                return new RegisterBindingModel() ;
            }

        }
    }
}