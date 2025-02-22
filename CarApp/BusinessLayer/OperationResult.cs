using CarApp.BusinessLayer.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarApp.BusinessLayer
{
    public class OperationResult
    {
        public bool IsSuccessful => Errors.Count == 0;
        public List<string> Errors = new List<string>() { };
        public IEnumerable<BaseDTO> Data = new List<BaseDTO>() { };
    }
}
