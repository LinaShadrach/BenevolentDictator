using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;

namespace BenevolentDictator.Models
{
    public class BenevolentDictatorContext: IdentityDbContext<ApplicationUser>
    {
        public BenevolentDictatorContext() { }

        public virtual DbSet<Nation> Nations { get; set; }
        public virtual DbSet<Event> Events { get; set; }
        public virtual DbSet<Government> Governments { get; set; }
        public virtual DbSet<Economy> Economies { get; set; }
        public virtual DbSet<Geography> Geographies { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseSqlServer(@"Server=(localdb)\mssqllocaldb;Database=BenevolentDictatorDb;integrated security=True");
        }

        public BenevolentDictatorContext(DbContextOptions<BenevolentDictatorContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }
    }
}
