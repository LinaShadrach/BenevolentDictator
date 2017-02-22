using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using BenevolentDictator.Models;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace BenevolentDictator.Controllers
{
    public class NationController : Controller
    {
        private INationRepository nationRepo;
        private IGovernmentRepository govRepo;
        private IGeographyRepository geoRepo;
        private IEconomyRepository econRepo;


        public NationController(
            INationRepository thisRepo = null, 
            IGovernmentRepository thisGovRepo = null,
            IGeographyRepository thisGeoRepo = null,
            IEconomyRepository thisEconRepo = null)
        {
            if (thisRepo == null)
            {
                this.nationRepo = new EFNationRepository();
            }
            else
            {
                this.nationRepo = thisRepo;
            }       
            if (thisGovRepo == null)
            {
                this.govRepo = new EFGovernmentRepository();
            }
            else
            {
                this.govRepo = thisGovRepo;
            }
            if (thisGeoRepo == null)
            {
                this.geoRepo = new EFGeographyRepository();
            }
            else
            {
                this.geoRepo = thisGeoRepo;
            }
            if (thisEconRepo == null)
            {
                this.econRepo = new EFEconomyRepository();
            }
            else
            {
                this.econRepo = thisEconRepo;
            }
        }

        // GET: /<controller>/
        public IActionResult Create()
        {
            ViewBag.Governments = govRepo.Governments.ToList();
            ViewBag.Geographies = geoRepo.Geographies.ToList();
            ViewBag.Economies = econRepo.Economies.ToList();
            return View();
        }

        [HttpPost]
        public IActionResult Create(Nation nationForm)
        {
            Nation nation = new Models.Nation(nationForm.Name, nationForm.GovernmentId, nationForm.EconomyId, nationForm.GeographyId);

            Government thisGovt = govRepo.Governments.FirstOrDefault(g => g.Id == nation.GovernmentId);
            Economy thisEcon = econRepo.Economies.FirstOrDefault(e => e.Id == nation.EconomyId);
            Geography thisGeo = geoRepo.Geographies.FirstOrDefault(g => g.Id == nation.GeographyId);

            float resourceFactor = (thisEcon.ResourceFactor + thisGeo.ResourceFactor) / 2;
            nation.Population = (int) Math.Floor(nation.Population * thisGeo.PopulationFactor);
            nation.Resources = (int) Math.Floor(nation.Resources * resourceFactor);
            nation.DisasterResistance = nation.DisasterResistance * thisGovt.DisasterFactor;

            nationRepo.Save(nation);
            return RedirectToAction("Index");
        }
    }
}
