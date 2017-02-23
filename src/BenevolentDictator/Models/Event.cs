using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BenevolentDictator.Models
{
    [Table("Events")]
    public class Event
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public int CapitalEffect { get; set; }
        public int PopulationEffect { get; set; }
        public int ResourceEffect { get; set; }
        public int StabilityEffect { get; set; }
        public float ResourceFactor { get; set; }
        public float PopulationFactor { get; set; }

    }
}