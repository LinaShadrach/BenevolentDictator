using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BenevolentDictator.Models
{ 
    public class EFEventRepository : IEventRepository
    {
        BenevolentDictatorContext db = new BenevolentDictatorContext();

        public EFEventRepository(BenevolentDictatorContext connection = null)
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

        public IQueryable<Event> Events
        { get { return db.Events; } }

        public void DeleteAll()
        {
            db.RemoveRange(db.Events);
            db.SaveChanges();
        }
    }
}