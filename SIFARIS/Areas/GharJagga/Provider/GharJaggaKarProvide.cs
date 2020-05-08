using SIFARIS.Areas.GharJagga.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Provider
{
    public class GharJaggaKarProvide
    {

        public bool Insert(GharJaggaKarViewModel model)
        {
            using (var con = new SifarishEntities())
            {
                if (model.id > 0)
                {

                    var data = con.GharJaggaKars.Where(x => x.id == model.id).FirstOrDefault();
                    if (data != null)
                    {
                        data.ward = model.ward;
                        data.gharNo = model.gharNo;

                        data.kittaNo = model.kittaNo;
                        data.Address = model.Address;
                        data.Area = model.Area;
                        data.BuildDate = model.BuildDate;
                        data.Length = model.Length;
                        data.breadth = model.breadth;
                        data.Height = model.Height;
                        data.GharDesigin = model.GharDesigin;
                        data.Road = model.Road;
                        data.roadType = model.roadType;
                        data.NibedakName = model.NibedakName;
                        data.NibedakAddress = model.NibedakAddress;
                        data.phone = model.phone;
                        data.marphatName = model.marphatName;
                        data.Date = model.Date;
                        data.dateAd = model.dateAd;
                        data.PrintDate = model.PrintDate;
                        data.printDateAd = model.printDateAd;
                        data.createby = model.createby;
                        data.CreatedDae = model.CreatedDae;
                        data.deltedDate = model.deltedDate;
                        data.deletedby = model.deletedby;

                

                        con.Entry(data).State = System.Data.Entity.EntityState.Modified;



                        // var a=  con.SaveChanges();
                    }
                }
                else
                {
                    GharJaggaKar cdata = new GharJaggaKar()
                    {
                        ward = model.ward,
                    gharNo = model.gharNo,

                    kittaNo = model.kittaNo,
                    Address = model.Address,
                    Area = model.Area,
                    BuildDate = model.BuildDate,
                    Length = model.Length,
                    breadth = model.breadth,
                    Height = model.Height,
                    GharDesigin = model.GharDesigin,
                    Road = model.Road,
                    roadType = model.roadType,
                    NibedakName = model.NibedakName,
                    NibedakAddress = model.NibedakAddress,
                    phone = model.phone,
                    marphatName = model.marphatName,
                    Date = model.Date,
                    dateAd = model.dateAd,
                    PrintDate = model.PrintDate,
                    printDateAd = model.printDateAd,
                    createby = model.createby,
                    CreatedDae = model.CreatedDae,
                    deltedDate = model.deltedDate,
                    deletedby = model.deletedby,

                };
                    con.GharJaggaKars.Add(cdata);




                }
                int i = con.SaveChanges();
                if (i > 0)
                    return true;
                else
                    return false;
            }
        }
        public List<GharJaggaKarViewModel> GetAll()
        {
            using (var con = new SifarishEntities())
            {
                var result = con.GharJaggaKars


                                .Select(x => new  GharJaggaKarViewModel()
                                {
                                    id =x.id,
                                    ward = x.ward,
                                    gharNo = x.gharNo,

                                    kittaNo = x.kittaNo,
                                    Address = x.Address,
                                    Area = x.Area,
                                    BuildDate = x.BuildDate,
                                    Length = x.Length,
                                    breadth = x.breadth,
                                    Height = x.Height,
                                    GharDesigin = x.GharDesigin,
                                    Road = x.Road,
                                    roadType = x.roadType,
                                    NibedakName = x.NibedakName,
                                    NibedakAddress = x.NibedakAddress,
                                    phone = x.phone,
                                    marphatName = x.marphatName,
                                    Date = x.Date,
                                    dateAd = x.dateAd,
                                    PrintDate = x.PrintDate,
                                    printDateAd = x.printDateAd,
                                    createby = x.createby,
                                    CreatedDae = x.CreatedDae,
                                    deltedDate = x.deltedDate,
                                    deletedby = x.deletedby,

                                }).ToList();
                return result;
            }
        }

        public GharJaggaKarViewModel GetById(int id)
        {
            using (var con = new SifarishEntities())
            {
                var result = con.GharJaggaKars

                                .Select(x => new GharJaggaKarViewModel()
                                {
                                    id = x.id,
                                    ward = x.ward,
                                    gharNo = x.gharNo,

                                    kittaNo = x.kittaNo,
                                    Address = x.Address,
                                    Area = x.Area,
                                    BuildDate = x.BuildDate,
                                    Length = x.Length,
                                    breadth = x.breadth,
                                    Height = x.Height,
                                    GharDesigin = x.GharDesigin,
                                    Road = x.Road,
                                    roadType = x.roadType,
                                    NibedakName = x.NibedakName,
                                    NibedakAddress = x.NibedakAddress,
                                    phone = x.phone,
                                    marphatName = x.marphatName,
                                    Date = x.Date,
                                    dateAd = x.dateAd,
                                    PrintDate = x.PrintDate,
                                    printDateAd = x.printDateAd,
                                    createby = x.createby,
                                    CreatedDae = x.CreatedDae,
                                    deltedDate = x.deltedDate,
                                    deletedby = x.deletedby,

                                }).Where(x => x.id == id).FirstOrDefault();
                return result;
            }
        }

        //save file on db
        public bool InsertFile(GhraJaggaKarFileViewModle model)
        {
            using (var con = new SifarishEntities())
            {
                {
                    GharjaggakarFile cdata = new GharjaggakarFile()
                    {
                        FileName = model.FileName,
                        FilePath = model.FilePath,

                        Status = model.Status,
                        GhraJaggaKarId = model.GhraJaggaKarId,
                        

                    };
                    con.GharjaggakarFiles.Add(cdata);




                }
                int i = con.SaveChanges();
                if (i > 0)
                    return true;
                else
                    return false;
            }
        }

        public List<GhraJaggaKarFileViewModle> GetFilesById(int id)
        {
            using (var con = new SifarishEntities())
            {
                var result = con.GharjaggakarFiles

                                .Select(x => new GhraJaggaKarFileViewModle()
                                {
                                    id = x.id,
                                    FileName = x.FileName,
                                    FilePath=x.FilePath,
                                    GhraJaggaKarId = x.GhraJaggaKarId,
                                    Status =x.Status,
                                    

                                }).Where(x => x.GhraJaggaKarId == id).ToList();
                return result;
            }
        }

        public GhraJaggaKarFileViewModle GetFilesByIdDownload(int id)
        {
            using (var con = new SifarishEntities())
            {
                var result = con.GharjaggakarFiles

                                .Select(x => new GhraJaggaKarFileViewModle()
                                {
                                    id = x.id,
                                    FileName = x.FileName,
                                    FilePath = x.FilePath,
                                    GhraJaggaKarId = x.GhraJaggaKarId,
                                    Status = x.Status,


                                }).Where(x => x.id == id).FirstOrDefault();
                return result;
            }
        }
    }
}