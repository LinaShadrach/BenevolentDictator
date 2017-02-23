using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using BenevolentDictator.Models;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
using System.Diagnostics;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace BenevolentDictator.Controllers
{
    public class NationController : Controller
    {
        private INationRepository nationRepo;
        private IGovernmentRepository govRepo;
        private IGeographyRepository geoRepo;
        private IEconomyRepository econRepo;

        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        public NationController(
            UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager,
            INationRepository thisRepo = null, 
            IGovernmentRepository thisGovRepo = null,
            IGeographyRepository thisGeoRepo = null,
            IEconomyRepository thisEconRepo = null)
        {
            _userManager = userManager;
            _signInManager = signInManager;
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
            Nation nation = new Nation("", 1, 2, 1);
            Government newGov = govRepo.Governments.FirstOrDefault(g => g.Id == nation.GovernmentId);
            Geography newGeo = geoRepo.Geographies.FirstOrDefault(g => g.Id == nation.GeographyId);
            Economy newEcon = econRepo.Economies.FirstOrDefault(g => g.Id == nation.EconomyId);
            nation.AddInitialStats(nation, newGov, newGeo, newEcon);
            nationRepo.Save(nation);
            Nation thisNation = nationRepo.Nations
                .Include(n => n.Government)
                .Include(n => n.Geography)
                .Include(n => n.Economy)
                .FirstOrDefault(n => n.Id==nation.Id);
            ViewBag.UserId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            return View(thisNation);
        }
        public IActionResult AJAXCreate(string Name, int EconomyId, int GeographyId, int GovernmentId)
        {
            Debug.WriteLine("ajax***********************"+GeographyId);
            Government newGov = govRepo.Governments.FirstOrDefault(g => g.Id == GovernmentId);
            Geography newGeo = geoRepo.Geographies.FirstOrDefault(g => g.Id == GeographyId);
            Economy newEcon = econRepo.Economies.FirstOrDefault(g => g.Id == EconomyId);
            Nation nation = new Nation(Name, GovernmentId, EconomyId, GeographyId);
            nation.AddInitialStats(nation, newGov, newGeo, newEcon);
            nationRepo.Save(nation);
            Nation thisNation = nationRepo.Nations
                .Include(n => n.Government)
                .Include(n => n.Geography)
                .Include(n => n.Economy)
                .FirstOrDefault(n => n.Id == nation.Id);
            Debug.WriteLine("ajaxjson***********************" + Json(thisNation));

            return Json(thisNation);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Nation nation, string ApplicationUserId)
        {
            Government newGov = govRepo.Governments.FirstOrDefault(g => g.Id == nation.GovernmentId);
            Geography newGeo = geoRepo.Geographies.FirstOrDefault(g => g.Id == nation.GeographyId);
            Economy newEcon = econRepo.Economies.FirstOrDefault(g => g.Id == nation.EconomyId);
            nation.ApplicationUser = await _userManager.FindByIdAsync(ApplicationUserId);
            nation = nation.AddInitialStats(nation, newGov, newGeo, newEcon);
            nationRepo.Save(nation);

            return RedirectToAction("Index");
        }
    }
}
