using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BenevolentDictator.Models
{
    public interface IGeographyRepository
    {
        IQueryable<Geography> Geographies { get; }
        void DeleteAll();
    }
}
