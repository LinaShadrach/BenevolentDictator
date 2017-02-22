using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BenevolentDictator.Models
{
    public interface INationRepository
    {
        IQueryable<Nation> Nations { get; }
        Nation Save(Nation nation);
        Nation Edit(Nation nation);
        void Remove(Nation nation);
        void DeleteAll();
    }
}
