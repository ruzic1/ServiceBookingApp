using CarApp.BusinessLayer.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace CarApp.BusinessLayer.Operations
{
    public class GetServiceTypes:EfOperation
    {
        public GetServiceTypes()
        {
            
        }
        public override OperationResult Execute()
        {
            return new OperationResult
            {
                Data = Entities.ServiceTypes.Select(x => new ServiceTypeDTO
                {
                    Id = x.Id,
                    Name = x.Name,

                }).ToList()
            };
            

            //Console.WriteLine("Uspesno je usao u Execute metod kog poziva GetServiceTypes");
            //return null;
        }
    }
}
