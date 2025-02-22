using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarApp.BusinessLayer.DTO
{
    public class ServiceTypeDTO:BaseDTO
    {
        public string Name { get; set; }
        public override string ToString()
        {
            return Name;
        }
    }
}
