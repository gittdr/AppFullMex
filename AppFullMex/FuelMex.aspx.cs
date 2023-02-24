using AppFullMex.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppFullMex
{
    public partial class FuelMex : System.Web.UI.Page
    {
        public static FacLabControle facLabControle = new FacLabControle();
        protected void Page_Load(object sender, EventArgs e)
        {
            //card1.Visible= true;
            //card2.Visible= false;
           
            

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string billto = Billto.Text;
            string fechaInicial = datepicker.Text;
            string fechaFinal = datepicker2.Text;

            DataTable mprv = facLabControle.ValidaCatFac(billto, fechaInicial, fechaFinal);
            if (mprv.Rows.Count > 0)
            {
                int mp = facLabControle.GetKms(billto, fechaInicial, fechaFinal);
                if (mp > 0)
                {
                    DataTable mpr = facLabControle.ValidaCatFac(billto, fechaInicial, fechaFinal);
                    if (mpr.Rows.Count > 0)
                    {
                        foreach (DataRow item in mpr.Rows)
                        {
                            int id_num = Int32.Parse(item["id_num"].ToString());
                            string rbillto = item["billto"].ToString();
                            string fini = item["fechainicial"].ToString();
                            string ffin = item["fechafinal"].ToString();
                            string pbase = item["preciobase"].ToString();
                            string cre = item["cre"].ToString();
                            string rendi = item["rendimiento"].ToString();
                            string factor = item["factor"].ToString();
                            decimal rest = Decimal.Parse(item["factor"].ToString());
                            decimal Monto = (decimal)(mp * rest);
                            decimal Value = decimal.Round(Monto, 2, MidpointRounding.AwayFromZero);
                            string mont = Value.ToString();
                            Response.Redirect("Consulta.aspx?id_num=" + id_num + "&rbillto=" + rbillto + "&fini=" + fini + "&ffin=" + ffin + "&pbase=" + pbase + "&cre=" + cre + "&rendi=" + rendi + "&factor=" + factor + "&monto=" + mont, false);
                        }

                    }
                }
            }
            else
            {
                string msg = "El registro no existe";
                //Rcartaporte.Value = msg;
                ScriptManager.RegisterStartupScript(this, GetType(), "swal", "swal('" + msg + "', 'Ingrese los datos correctos', 'error');setTimeout(function(){window.location.href ='FuelMex.aspx'}, 4000)", true);

            }




        }
    }
}