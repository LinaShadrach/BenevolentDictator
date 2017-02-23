using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BenevolentDictator.Models
{
    [Table("Nations")]
    public class Nation
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public int GovernmentId { get; set; }
        public virtual Government Government { get; set; }
        public int EconomyId { get; set; }
        public virtual Economy Economy { get; set; }
        public int GeographyId { get; set; }
        public virtual Geography Geography { get; set; }
        public int Capital { get; set; }
        public int Population { get; set; }
        public int Resources { get; set; }
        public int Stability { get; set; }
        public float DisasterResistance { get; set; }
        public int ResourceGain { get; set; }
        public int PopulationGain { get; set; }
        public int CapitalGain { get; set; }
        public bool TradeHigh { get; set; }
        public virtual ApplicationUser ApplicationUser { get; set; }
        public Nation(string name, int governmentId, int economyId, int geographyId)
        {
            Name = name;
            GovernmentId = governmentId;
            EconomyId = economyId;
            GeographyId = geographyId;
        }
        public Nation() { }

        public Nation AddInitialStats(Nation nation, Government newGov, Geography newGeo, Economy newEcon)
        {
            nation.Capital = 1000;
            nation.Population = 1000;
            nation.Resources = 1000;
            nation.Stability = 100;
            nation.DisasterResistance = 1;
            nation.ResourceGain = 100;
            nation.PopulationGain = 100;
            nation.CapitalGain = 100;
            nation.TradeHigh = false;

            float resourceFactor = (newEcon.ResourceFactor + newGeo.ResourceFactor) / 2;
            nation.Population = (int)Math.Floor(nation.Population * newGeo.PopulationFactor);
            nation.Resources = (int)Math.Floor(nation.Resources * resourceFactor);
            nation.DisasterResistance = nation.DisasterResistance * newGov.DisasterFactor;

            return (nation);
        }
    }  
}