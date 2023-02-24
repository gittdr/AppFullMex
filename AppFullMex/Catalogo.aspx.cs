using AppFullMex.Models;
using ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppFullMex
{
    public partial class Catalogo : System.Web.UI.Page
    {
        public static FacLabControle facLabControle = new FacLabControle();
        protected void Page_Load(object sender, EventArgs e)
        {
            //card2.Visible = false;
            GetCat();

        }
        //protected void DC(object sender, EventArgs e)
        //{
        //    //string idd = Request.QueryString["id_num"];
        //    string cadena2 = @"Data source=172.24.16.112; Initial Catalog=TMWSuite; User ID=sa; Password=tdr9312;Trusted_Connection=false;MultipleActiveResultSets=true";
        //    DataTable dataTable = new DataTable();
        //    using (SqlConnection connection = new SqlConnection(cadena2))
        //    {
        //        connection.Open();
        //        using (SqlCommand selectCommand = new SqlCommand("usp_CatFullMexCat", connection))
        //        {

        //            selectCommand.CommandType = CommandType.StoredProcedure;
        //            selectCommand.CommandTimeout = 100000;

        //            selectCommand.ExecuteNonQuery();
        //            using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectCommand))
        //            {
        //                try
        //                {
        //                    //selectCommand.Connection.Open();
        //                    sqlDataAdapter.Fill(dataTable);
        //                    using (XLWorkbook wb = new XLWorkbook())
        //                    {
        //                        wb.Worksheets.Add(dataTable, "2023");

        //                        Response.Clear();
        //                        Response.Buffer = true;
        //                        Response.Charset = "";
        //                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        //                        Response.AddHeader("content-disposition", "attachment;filename=CatalogoFuelMex.xlsx");
        //                        using (MemoryStream MyMemoryStream = new MemoryStream())
        //                        {
        //                            wb.SaveAs(MyMemoryStream);
        //                            MyMemoryStream.WriteTo(Response.OutputStream);
        //                            Response.Flush();
        //                            Response.End();
        //                        }
        //                    }
        //                }
        //                catch (SqlException ex)
        //                {
        //                    connection.Close();
        //                    string message = ex.Message;
        //                }
        //            }
        //        }
        //    }


        //}
        protected void Button1_Click(object sender, EventArgs e)
        {
            string billto = Billto.Text;
            string fechaInicial = datepicker.Text;
            string fechaFinal = datepicker2.Text;
            decimal precioBase = Decimal.Parse(PrecioBase.Text);
            decimal cre = Decimal.Parse(CRE.Text);
            decimal rendimiento = Decimal.Parse(Rendimiento.Text);
            decimal resultado = (cre - precioBase) / rendimiento;
            decimal re2 = resultado;
            string factor = re2.ToString();

            //Aqui lleno el catalogo
            DataTable mp = facLabControle.ValidaCat(billto,fechaInicial,fechaFinal);
            if (mp.Rows.Count == 0)
            {
                facLabControle.PostCat(billto, fechaInicial, fechaFinal, precioBase, cre, rendimiento, factor);
                string msg = "Registro exitoso";
                //Rcartaporte.Value = msg;
                ScriptManager.RegisterStartupScript(this, GetType(), "swal", "swal('" + msg + "', 'Registro agregado', 'success');setTimeout(function(){window.location.href ='Catalogo.aspx'}, 2000)", true);

            }
            else
            {
                string msg = "El registro ya existe";
                //Rcartaporte.Value = msg;
                ScriptManager.RegisterStartupScript(this, GetType(), "swal", "swal('" + msg + "', 'El registro ya existe', 'error');setTimeout(function(){window.location.href ='Catalogo.aspx'}, 2000)", true);

            }





            


        }
       
        private void GetCat()
        {

            DataTable cargaStops = facLabControle.GetCat();
            //cargaStops.AsDataView().RowFilter("");
            int numCells = 8;
            int rownum = 0;
            //cargaStops = cargaStops.Orde
            foreach (DataRow row in cargaStops.Rows)
            {
                TableRow r = new TableRow();
                for (int i = 0; i < numCells; i++)
                {
                    if (i == 0)
                    {
                       
                        
                        HyperLink hp1 = new HyperLink();

                        hp1.ID = "hpIndex" + rownum.ToString();
                        hp1.Text = "<i class='fa fa-minus-square btn btn-danger' aria-hidden='true'></i>";
                        hp1.NavigateUrl = "DeleteR.aspx?idnum=" + row[i].ToString();
                        //hp1.Text = "<button type='button' class='btn btn-primary'>" + row[i].ToString() + "</button>";
                        //hp1.NavigateUrl = "DetallesComplemento.aspx?factura=" + row[i].ToString();
                        TableCell c = new TableCell();
                        c.Controls.Add(hp1);
                        r.Cells.Add(c);

                    }
                    else
                    {
                        TableCell c = new TableCell();
                        c.Controls.Add(new LiteralControl("row "
                            + rownum.ToString() + ", cell " + i.ToString()));
                        c.Text = row[i].ToString();
                        r.Cells.Add(c);
                    }
                }


                tablaStops.Rows.Add(r);
                rownum++;

            }

        }
        


    }
}