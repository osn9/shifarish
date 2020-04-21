using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SIFARIS.Areas.GharJagga.Models;
using SIFARIS;

namespace SIFARIS.Areas.GharJagga.Provider
{
    public class CitizeninfoProvier
    {
        public bool Insert(CitizenInfoViewModel model)
        {
            using (var con = new SifarishEntities())
            {
                if (model.Id > 0)
                {
    //                var categorizedProducts = product
    //.Join(productcategory, p => p.Id, pc => pc.ProdId, (p, pc) => new { p, pc })
    //.Join(category, ppc => ppc.pc.CatId, c => c.Id, (ppc, c) => new { ppc, c })
    //.Select(m => new {
    //    ProdId = m.ppc.p.Id, // or m.ppc.pc.ProdId
    //    CatId = m.c.CatId
    //    // other assignments
    //})
                   // var update = con.Citizen_Info.Where(x => x.Id == model.Id).FirstOrDefault();
                    var data = con.Citizen_Info.Where(x => x.Id == model.Id).Join(con.Citizen_GharJagga_Info,
                                a => a.Id,
                                b => b.Citizen_Id,
                                (a, b) => new { Citizen_Info = a, Citizen_GharJagga_Info = b })
                                .Join(con.JaagaTarfas, ppc => ppc.Citizen_Info.Id, c => c.CitizenId, (ppc, c) => new { ppc, c })
                                .Join(con.Karlayatarfas, k => k.ppc.Citizen_Info.Id, z => z.citizen_ID, (k, z) => new { k, z })

                                .FirstOrDefault();
                    if (data != null)
                    {
                       // data.k.ppc.Citizen_Info.Id = model.Id;
                        data.k.ppc.Citizen_Info.Citizenship_No = model.Citizenship_No;
                        data.k.ppc.Citizen_Info.Address = model.Address;
                        data.k.ppc.Citizen_Info.CitizenName = model.CitizenName;
                        data.k.ppc.Citizen_Info.DeparmentId = model.DeparmentId;
                        data.k.ppc.Citizen_Info.District_Id = model.District_Id;
                        data.k.ppc.Citizen_Info.Zone_Id = model.Zone_Id;
                        data.k.ppc.Citizen_Info.Mun_Ward = model.Mun_Ward;
                        data.k.ppc.Citizen_Info.Sabik_Ward = model.Sabik_Ward;
                        data.k.ppc.Citizen_Info.Father_Husband_Name = model.Father_Husband_Name;
                        data.k.ppc.Citizen_Info.GrandFatherName = model.GrandFatherName;
                        data.k.ppc.Citizen_Info.CitizenShip_Date = model.CitizenShip_Date;
                        data.k.ppc.Citizen_Info.CitizinShip_Zone = model.CitizinShip_Zone;
                        //data.k.ppc.Citizen_GharJagga_Info.Citizen_gharjaga_Id = model.Id;
                        data.k.ppc.Citizen_GharJagga_Info.Citizen_Id = model.Id;
                        data.k.ppc.Citizen_GharJagga_Info.Area = model.Area;
                        data.k.ppc.Citizen_GharJagga_Info.NumberOfHouse = model.NumberOfHouse;
                        data.k.ppc.Citizen_GharJagga_Info.Kitta_No = model.Kitta_No;
                        data.k.ppc.Citizen_GharJagga_Info.East = model.East                            ;
                        data.k.ppc.Citizen_GharJagga_Info.West = model.West;
                        data.k.ppc.Citizen_GharJagga_Info.North = model.North;
                        data.k.ppc.Citizen_GharJagga_Info.South = model.South;
                        //data.k.c.CitizenId = model.Id;

                        data.k.c.MulSadak = model.MulSadak;
                        data.k.c.KacchiSadak = model.KacchiSadak;
                        data.k.c.Goreto = model.Goreto;
                        data.k.c.sahayakSadaK = model.sahayakSadaK;
                        data.k.c.BatoNavaeko = model.BatoNavaeko;
                        //data.z.citizen_ID = model.Id;
                        data.z.Name = model.Name;
                        data.z.Address = model.KAddress;
                        data.z.Date = model.Date;
                        data.z.KardartaFullName = model.KardartaFullName;
                        
                        
                        con.Entry(data.k.ppc.Citizen_Info).State = System.Data.Entity.EntityState.Modified;
                        con.Entry(data.k.ppc.Citizen_GharJagga_Info).State = System.Data.Entity.EntityState.Modified;

                        con.Entry(data.k.c).State = System.Data.Entity.EntityState.Modified;
                        con.Entry(data.z).State = System.Data.Entity.EntityState.Modified;



                        // var a=  con.SaveChanges();
                    }
                }
                else
                {
                    Citizen_Info cdata = new Citizen_Info()
                    {

                        Id = model.Id,
                        CitizenName=model.CitizenName,
                        DeparmentId=model.DeparmentId,
                    Citizenship_No = model.Citizenship_No,
                    Address = model.Address,
                    District_Id = model.District_Id,
                    Zone_Id = model.Zone_Id,
                    Mun_Ward = model.Mun_Ward,
                    Sabik_Ward = model.Sabik_Ward,
                    Father_Husband_Name = model.Father_Husband_Name,
                    GrandFatherName = model.GrandFatherName,
                    CitizenShip_Date = model.CitizenShip_Date,
                    CitizinShip_Zone = model.CitizinShip_Zone,
                };
                    con.Citizen_Info.Add(cdata);
                    Citizen_GharJagga_Info cgdata = new Citizen_GharJagga_Info()
                    {

                        //Citizen_gharjaga_Id = model.Citizen_gharjaga_Id,
                    Citizen_Id = cdata.Id,
                    Area = model.Area,
                    NumberOfHouse = model.NumberOfHouse,
                    Kitta_No = model.Kitta_No,
                    East = model.East,
                    West = model.West,
                    North = model.North,
                    South = model.South,
                };
                    con.Citizen_GharJagga_Info.Add(cgdata);

                    JaagaTarfa jdata = new JaagaTarfa()
                    {
                        CitizenId = cdata.Id,
                        BatoNavaeko=model.BatoNavaeko,
                        KacchiSadak=model.KacchiSadak,
                        sahayakSadaK=model.sahayakSadaK,
                        MulSadak=model.MulSadak,
                        Goreto=model.Goreto,
                        
                    };
                    con.JaagaTarfas.Add(jdata);

                    Karlayatarfa kdata = new Karlayatarfa()
                    {
                        citizen_ID = cdata.Id,
                        KardartaFullName = model.KardartaFullName,
                        Name = model.Name,
                        Address = model.KAddress,
                        Date = model.Date,
                        
                    };
                    con.Karlayatarfas.Add(kdata);


                }
                int i = con.SaveChanges();
                if (i > 0)
                    return true;
                else
                    return false;
            }
        }

        public List<CitizenInfoViewModel> GetAll()
        {
            using (var con = new SifarishEntities())
            {
                var result = con.Citizen_Info.Join(con.Citizen_GharJagga_Info,
                                a => a.Id,
                                b => b.Citizen_Id,
                                (a, b) => new { Citizen_Info = a, Citizen_GharJagga_Info = b })
                                .Join(con.JaagaTarfas, ppc => ppc.Citizen_Info.Id, c => c.CitizenId, (ppc, c) => new { ppc, c })
                                .Join(con.Karlayatarfas, k => k.ppc.Citizen_Info.Id, z => z.citizen_ID, (k, z) => new { k, z })

                                .Select(x => new CitizenInfoViewModel()
                                {
                                    Id = x.k.ppc.Citizen_Info.Id,
                                    Citizenship_No = x.k.ppc.Citizen_Info.Citizenship_No,
                                    CitizenName = x.k.ppc.Citizen_Info.CitizenName,
                                    DeparmentId = x.k.ppc.Citizen_Info.DeparmentId,
                Address = x.k.ppc.Citizen_Info.Address,
                District_Id = x.k.ppc.Citizen_Info.District_Id,
                Zone_Id = x.k.ppc.Citizen_Info.Zone_Id,
                Mun_Ward = x.k.ppc.Citizen_Info.Mun_Ward,
                Sabik_Ward = x.k.ppc.Citizen_Info.Sabik_Ward,
                Father_Husband_Name = x.k.ppc.Citizen_Info.Father_Husband_Name,
                GrandFatherName = x.k.ppc.Citizen_Info.GrandFatherName,
                CitizenShip_Date = x.k.ppc.Citizen_Info.CitizenShip_Date,
                CitizinShip_Zone = x.k.ppc.Citizen_Info.CitizinShip_Zone,
                // data.k.ppc.Citizen_GharJagga_Info.Citizen_gharjaga_Id = model.Citizen_gharjaga_Id,
                //   data.k.ppc.Citizen_GharJagga_Info.Citizen_Id = model.Id,
                Area = x.k.ppc.Citizen_GharJagga_Info.Area,
                NumberOfHouse = x.k.ppc.Citizen_GharJagga_Info.NumberOfHouse,
                Kitta_No = x.k.ppc.Citizen_GharJagga_Info.Kitta_No,
                East = x.k.ppc.Citizen_GharJagga_Info.East,
                West = x.k.ppc.Citizen_GharJagga_Info.West,
                North = x.k.ppc.Citizen_GharJagga_Info.North,
                South = x.k.ppc.Citizen_GharJagga_Info.South,
                MulSadak = x.k.c.MulSadak,
                KacchiSadak = x.k.c.KacchiSadak,
                Goreto = x.k.c.Goreto,
                sahayakSadaK = x.k.c.sahayakSadaK,
                BatoNavaeko = x.k.c.BatoNavaeko,
                Name = x.z.Name,
                KAddress = x.z.Address,
                Date = x.z.Date,
                KardartaFullName = x.z.KardartaFullName,

            }).ToList();
                return result;
            }
        }

        public CitizenInfoViewModel GetById(int id)
        {
            using (var con = new SifarishEntities())
            {
                var result = con.Citizen_Info.Join(con.Citizen_GharJagga_Info,
                                a => a.Id,
                                b => b.Citizen_Id,
                                (a, b) => new { Citizen_Info = a, Citizen_GharJagga_Info = b })
                                .Join(con.JaagaTarfas, ppc => ppc.Citizen_Info.Id, c => c.CitizenId, (ppc, c) => new { ppc, c })
                                .Join(con.Karlayatarfas, k => k.ppc.Citizen_Info.Id, z => z.citizen_ID, (k, z) => new { k, z })

                                .Select(x => new CitizenInfoViewModel()
                                {
                                    Id = x.k.ppc.Citizen_Info.Id,
                                    Citizenship_No = x.k.ppc.Citizen_Info.Citizenship_No,
                                    CitizenName = x.k.ppc.Citizen_Info.CitizenName,
                                    DeparmentId = x.k.ppc.Citizen_Info.DeparmentId,
                                    Address = x.k.ppc.Citizen_Info.Address,
                                    District_Id = x.k.ppc.Citizen_Info.District_Id,
                                    Zone_Id = x.k.ppc.Citizen_Info.Zone_Id,
                                    Mun_Ward = x.k.ppc.Citizen_Info.Mun_Ward,
                                    Sabik_Ward = x.k.ppc.Citizen_Info.Sabik_Ward,
                                    Father_Husband_Name = x.k.ppc.Citizen_Info.Father_Husband_Name,
                                    GrandFatherName = x.k.ppc.Citizen_Info.GrandFatherName,
                                    CitizenShip_Date = x.k.ppc.Citizen_Info.CitizenShip_Date,
                                    CitizinShip_Zone = x.k.ppc.Citizen_Info.CitizinShip_Zone,
                                    // data.k.ppc.Citizen_GharJagga_Info.Citizen_gharjaga_Id = model.Citizen_gharjaga_Id,
                                    //   data.k.ppc.Citizen_GharJagga_Info.Citizen_Id = model.Id,
                                    Area = x.k.ppc.Citizen_GharJagga_Info.Area,
                                    NumberOfHouse = x.k.ppc.Citizen_GharJagga_Info.NumberOfHouse,
                                    Kitta_No = x.k.ppc.Citizen_GharJagga_Info.Kitta_No,
                                    East = x.k.ppc.Citizen_GharJagga_Info.East,
                                    West = x.k.ppc.Citizen_GharJagga_Info.West,
                                    North = x.k.ppc.Citizen_GharJagga_Info.North,
                                    South = x.k.ppc.Citizen_GharJagga_Info.South,
                                    MulSadak = x.k.c.MulSadak,
                                    KacchiSadak = x.k.c.KacchiSadak,
                                    Goreto = x.k.c.Goreto,
                                    sahayakSadaK = x.k.c.sahayakSadaK,
                                    BatoNavaeko = x.k.c.BatoNavaeko,
                                    Name = x.z.Name,
                                    KAddress = x.z.Address,
                                    Date = x.z.Date,
                                    KardartaFullName = x.z.KardartaFullName,

                                }).Where(x=>x.Id==id).FirstOrDefault();
                return result;
            }
        }
    }
}