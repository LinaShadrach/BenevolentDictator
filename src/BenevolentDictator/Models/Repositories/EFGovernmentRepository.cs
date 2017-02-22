using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BenevolentDictator.Models
{ 
    public class EFGovernmentRepository : IGovernmentRepository
    {
        BenevolentDictatorContext db = new BenevolentDictatorContext();

        public EFGovernmentRepository(BenevolentDictatorContext connection = null)
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

        public IQueryable<Government> Governments
        { get { return db.Governments; } }

        public void DeleteAll()
        {
            db.RemoveRange(db.Governments);
            db.SaveChanges();
        }
    }
}