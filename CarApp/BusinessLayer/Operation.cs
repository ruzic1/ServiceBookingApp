using CarApp.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarApp.BusinessLayer.Operations
{
    public abstract class Operation
    {
        public abstract OperationResult Execute();
    }
    public abstract class EfOperation : Operation
    {
        protected CsLabEntities Entities { get; }
        protected EfOperation()
        {
            Entities = new CsLabEntities();
        }
    }
}
