using CarApp.BusinessLayer.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace CarApp.BusinessLayer.Operations
{
    public class GetServices:EfOperation
    {
        public string Keyword { get; set; }
        public override OperationResult Execute()
        {
            var query = Entities.ServiceSchedules.AsQueryable();

            if (!string.IsNullOrEmpty(Keyword))
            {
                query = query.Where(x => x.Vehicle.Model.Name.Contains(Keyword) ||
                                         x.Vehicle.Label.Contains(Keyword) ||
                                         x.Vehicle.Model.Manufacturer.Name.Contains(Keyword));
            }
            return new OperationResult
            {
                Data = query.Select(x => new ServiceDTO
                {
                    Id = x.Id,
                    AdditionalInfo = x.AdditionalInfo,
                    FinishedAt = x.FinishedAt,
                    Price = x.Price,
                    ServiceDate = x.ScheduledFor,
                    VehicleLabel = x.Vehicle.Label,
                    Model = x.Vehicle.Model.Name,
                    Manufacturer = x.Vehicle.Model.Manufacturer.Name,
                    ServiceType = x.ServiceType.Name,
                }).ToList()
            };
        }
    }
}
