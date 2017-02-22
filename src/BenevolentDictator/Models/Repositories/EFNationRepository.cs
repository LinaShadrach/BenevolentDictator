using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BenevolentDictator.Models
{ 
    public class EFNationRepository : INationRepository
    {
        BenevolentDictatorContext db = new BenevolentDictatorContext();

        public EFNationRepository(BenevolentDictatorContext connection = null)
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

        public IQueryable<Nation> Nations
        { get { return db.Nations; } }
        public IQueryable<Government> Governments
        { get { return db.Governments; } }

        public Nation Save(Nation nation)
        {
            db.Nations.Add(nation);
            db.SaveChanges();
            return nation;
        }

        public Nation Edit(Nation nation)
        {
            db.Entry(nation).State = EntityState.Modified;
            db.SaveChanges();
            return nation;
        }

        public void Remove(Nation nation)
        {
            db.Nations.Remove(nation);
            db.SaveChanges();
        }
        public void DeleteAll()
        {
            db.RemoveRange(db.Nations);
            db.SaveChanges();
        }
    }
}