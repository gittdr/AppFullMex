using AppFullMex.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppFullMex
{
    public partial class DeleteR : System.Web.UI.Page
    {
        public static FacLabControle facLabControle = new FacLabControle();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id_num = Request.QueryString["idnum"];
            valida(id_num);

        }
        public void valida(string id_num)
        {
            //TextBox1.Value = folio;
            facLabControle.IFpagoDelet(id_num);
            string msg = "Se elimino el registro: " + id_num;
            ScriptManager.RegisterStartupScript(this, GetType(), "swal", "swal('" + msg + "', 'Eliminación exitosa ', 'success');setTimeout(function(){window.location.href ='Catalogo.aspx'}, 2000)", true);
        }
    }
}