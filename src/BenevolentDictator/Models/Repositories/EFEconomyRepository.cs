using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BenevolentDictator.Models
{ 
    public class EFEconomyRepository : IEconomyRepository
    {
        BenevolentDictatorContext db = new BenevolentDictatorContext();

        public EFEconomyRepository(BenevolentDictatorContext connection = null)
        {
            if (connection == null)
            {
                this.db = new BenevolentDictatorContext();
            }
            else
            {
                this.db = connection;
            }
        }

        public IQueryable<Economy> Economies
        { get { return db.Economies; } }
        
        public void DeleteAll()
        {
            db.RemoveRange(db.Economies);
            db.SaveChanges();
        }
    }
}