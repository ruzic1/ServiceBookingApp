using CarApp.BusinessLayer.Operations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarApp.BusinessLayer
{
    public class OperationManager
    {
        public OperationResult Exec(Operation o)
        {
            try
            {
                var rezultat = o.Execute();
                return rezultat;
                //if (rezultat != null) {
                //    return rezultat;
                //}
                //else
                //{
                //    return "rezultat je null";
                //}
            }
            catch (Exception ex)
            {
                return new OperationResult
                {
                    Errors = new List<string> { ex.Message }
                };
            }
        }
    }
}
