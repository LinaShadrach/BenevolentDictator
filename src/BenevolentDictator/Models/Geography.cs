using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BenevolentDictator.Models
{
    [Table("Geographies")]
    public class Geography
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public float PopulationFactor { get; set; }
        public float ResourceFactor { get; set; }
    }
}