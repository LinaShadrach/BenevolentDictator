using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BenevolentDictator.Models
{ 
    public class EFGeographyRepository : IGeographyRepository
    {
        BenevolentDictatorContext db = new BenevolentDictatorContext();

        public EFGeographyRepository(BenevolentDictatorContext connection = null)
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

        public IQueryable<Geography> Geographies
        { get { return db.Geographies; } }
        
        public void DeleteAll()
        {
            db.RemoveRange(db.Geographies);
            db.SaveChanges();
        }
    }
}