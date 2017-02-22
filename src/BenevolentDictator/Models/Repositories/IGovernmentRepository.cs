using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BenevolentDictator.Models
{
    public interface IGovernmentRepository
    {
        IQueryable<Government> Governments { get; }
        void DeleteAll();
    }
}
