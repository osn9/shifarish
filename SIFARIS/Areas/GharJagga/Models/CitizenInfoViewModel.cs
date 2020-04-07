using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIFARIS.Areas.GharJagga.Models
{
    public class CitizenInfoViewModel
    {


        public int Id { get; set; }
        public Nullable<int> Citizen_id { get; set; }
        public string Citizenship_No { get; set; }
        public string Address { get; set; }
        public Nullable<int> District_Id { get; set; }
        public Nullable<int> Zone_Id { get; set; }
        public Nullable<int> Mun_Ward { get; set; }
        public Nullable<int> Sabik_Ward { get; set; }
        public string Father_Husband_Name { get; set; }
        public string GrandFatherName { get; set; }
        public string CitizenShip_Date { get; set; }
        public Nullable<int> CitizinShip_Zone { get; set; }

        //GharInfo

        public int Citizen_gharjaga_Id { get; set; }
        public Nullable<int> NumberOfHouse { get; set; }
        public string Area { get; set; }
        public string Kitta_No { get; set; }
        public string East { get; set; }
        public string West { get; set; }
        public string North { get; set; }
        public string South { get; set; }
        //
        public int jagaTarfa_id { get; set; }
        public string MulSadak { get; set; }
        public string sahayakSadaK { get; set; }
        public string KacchiSadak { get; set; }
        public string Goreto { get; set; }
        public string BatoNavaeko { get; set; }
        //

        public int Karlayatarfa_id { get; set; }
        public string Name { get; set; }
        public string KAddress { get; set; }
        public string Date { get; set; }
        public string KardartaFullName { get; set; }
        public Nullable<int> citizen_ID { get; set; }



    }
}