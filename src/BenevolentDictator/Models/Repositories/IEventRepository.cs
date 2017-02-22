using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BenevolentDictator.Models
{
    public interface IEventRepository
    {
        IQueryable<Event> Events { get; }
        void DeleteAll();
    }
}
