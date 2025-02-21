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
        public string Exec(Operation o)
        {
            try
            {
                var rezultat = o.Execute();
                if (rezultat != null) {
                    return "Uspesno izvrsavanje!!!";
                }
                else
                {
                    return "rezultat je null";
                }
            }
            catch (Exception ex)
            {
                return "pojavila se neka greska";
            }
        }
    }
}
