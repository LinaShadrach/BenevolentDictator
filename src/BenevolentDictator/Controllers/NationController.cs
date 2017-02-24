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
        private IEventRepository eventRepo;

        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        public NationController(
            UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager,
            INationRepository thisRepo = null, 
            IGovernmentRepository thisGovRepo = null,
            IGeographyRepository thisGeoRepo = null,
            IEconomyRepository thisEconRepo = null,
            IEventRepository thisEventRepo = null)
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
            if (thisEventRepo == null)
            {
                this.eventRepo = new EFEventRepository();
            }
            else
            {
                this.eventRepo = thisEventRepo;
            }
        }

        // GET: /<controller>/
        public IActionResult Create()
        {

            ViewBag.Governments = govRepo.Governments.ToList();
            ViewBag.Geographies = geoRepo.Geographies.ToList();
            ViewBag.Economies = econRepo.Economies.ToList();
            Nation nation = new Nation("", 1, 5, 1);
            Government newGov = govRepo.Governments.FirstOrDefault(g => g.Id == nation.GovernmentId);
            Geography newGeo = geoRepo.Geographies.FirstOrDefault(g => g.Id == nation.GeographyId);
            Economy newEcon = econRepo.Economies.FirstOrDefault(g => g.Id == nation.EconomyId);
            nation.ApplicationUserId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            nation.AddInitialStats(nation, newGov, newGeo, newEcon);
            nationRepo.Save(nation);
            nation = nationRepo.Nations
                .Include(n => n.Government)
                .Include(n => n.Geography)
                .Include(n => n.Economy)
                .Include(n => n.ApplicationUser)
                .FirstOrDefault(n => n.Id==nation.Id);
            return View(nation);
        }
        public IActionResult AJAXCreate(int nationId, int EconomyId, int GeographyId, int GovernmentId)
        {
            Government newGov = govRepo.Governments.FirstOrDefault(g => g.Id == GovernmentId);
            Geography newGeo = geoRepo.Geographies.FirstOrDefault(g => g.Id == GeographyId);
            Economy newEcon = econRepo.Economies.FirstOrDefault(g => g.Id == EconomyId);
            Nation nation = nationRepo.Nations.FirstOrDefault(n => n.Id == nationId);
            nation.EconomyId = EconomyId;
            nation.GeographyId = GeographyId;
            nation.GovernmentId = GovernmentId;
            nation.AddInitialStats(nation, newGov, newGeo, newEcon);
            nationRepo.Edit(nation);
            nation = nationRepo.Nations.FirstOrDefault(n => n.Id == nationId);

            return Json(nation);
        }

        [HttpPost]
        public IActionResult Create(int nationId, string Name)
        {
            Nation thisNation = nationRepo.Nations.FirstOrDefault(n => n.Id == nationId);
            thisNation.Name = Name;
            nationRepo.Edit(thisNation);

            return RedirectToAction("Index", new { id = nationId });
        }
        public IActionResult Index(int id)
        {
            Nation thisNation = nationRepo.Nations.FirstOrDefault(n => n.Id == id);
            return View(thisNation);
        }
        [HttpPost]
        public IActionResult PassTime(int nationId)
        {
            Nation thisNation = nationRepo.Nations.FirstOrDefault(n => n.Id == nationId);
            int eventId = thisNation.CheckForEvent();
            string message = "10 years passed!";
            if(eventId!=0)
            {
                Event thisEvent = eventRepo.Events.FirstOrDefault(e => e.Id == eventId);
                thisNation.EventHappens(thisEvent);
                message += " and "+ thisEvent.Name + " happened";
            }
            thisNation.PassTime();
            bool gameOver = thisNation.CheckGameOver();
            nationRepo.Edit(thisNation);
            if(gameOver)
            {
                message += "and your country collasped!";
            }
            Dictionary<string, object> results = new Dictionary<string, object> () { };
            results.Add("message", message);
            results.Add("nation", thisNation);
            results.Add("gameOver", gameOver);
            return Json(results);
        }
        [HttpPost]
        public IActionResult ToggleTrade(int nationId)
        {
            Nation thisNation = nationRepo.Nations.FirstOrDefault(n => n.Id == nationId);
            thisNation.ToggleTrade();
            nationRepo.Edit(thisNation);
            string result = "Normal";
            if (thisNation.TradeHigh)
            {
                result = "High Trade";
            }
            return Json(result);
        }

    }
}
