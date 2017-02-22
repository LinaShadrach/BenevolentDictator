using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BenevolentDictator.Models
{
    [Table("Governments")]
    public class Government
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public float StabilityFactor { get; set; }
        public float DisasterFactor { get; set; }
    }
}