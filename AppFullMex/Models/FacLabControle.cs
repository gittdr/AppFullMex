using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Web;

namespace AppFullMex.Models
{

    public class FacLabControle
    {
        public ModelFact modelFact = new ModelFact();
        public void PostCat(string billto, string fechaInicial, string fechaFinal, decimal precioBase, decimal cre, decimal rendimiento, string factor)
        {
            this.modelFact.PostCat(billto, fechaInicial, fechaFinal, precioBase, cre, rendimiento, factor);
        }
        public void IFpagoDelet(string idnum)
        {
            this.modelFact.IFpagoDelet(idnum);
        }
        public DataTable GetCat()
        {
            return this.modelFact.GetCat();
        }
        public DataTable ValidaCat(string billto, string fechaInicial, string fechaFinal)
        {
            return this.modelFact.ValidaCat(billto, fechaInicial, fechaFinal);
        }
        public DataTable ValidaCatFac(string billto, string fechaInicial, string fechaFinal)
        {
            return this.modelFact.ValidaCatFac(billto, fechaInicial, fechaFinal);
        }
        public DataTable ValidaCatFacR(string billto, string fechaInicial, string fechaFinal)
        {
            return this.modelFact.ValidaCatFacR(billto, fechaInicial, fechaFinal);
        }
        public int GetKms(string billto, string fechaInicial, string fechaFinal)
        {
            return this.modelFact.GetKms(billto, fechaInicial, fechaFinal);
        }
        public void WFMonto(string id_num, string mont)
        {
            this.modelFact.WFMonto(id_num, mont);
        }

    }
}