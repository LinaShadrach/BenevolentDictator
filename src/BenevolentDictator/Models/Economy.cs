using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BenevolentDictator.Models
{
    [Table("Economies")]
    public class Economy
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public float ResourceFactor { get; set; }
    }
}