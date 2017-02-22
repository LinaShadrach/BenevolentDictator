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
            Capital = 1000;
            Population = 1000;
            Resources = 1000;
            Stability = 100;
            DisasterResistance = 1;
            ResourceGain = 100;
            PopulationGain = 100;
            CapitalGain = 100;
            TradeHigh = false;
        }
        public Nation() { }
    }  
}