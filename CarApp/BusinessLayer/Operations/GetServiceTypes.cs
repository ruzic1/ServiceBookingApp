using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarApp.BusinessLayer.Operations
{
    public class GetServiceTypes:Operation
    {
        public GetServiceTypes()
        {
            
        }
        public override OperationResult Execute()
        {
            Console.WriteLine("Uspesno je usao u Execute metod kog poziva GetServiceTypes");
            return null;
        }
    }
}
