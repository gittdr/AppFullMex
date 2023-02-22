using AppFullMex.Models;
using ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppFullMex
{
    public partial class Consulta : System.Web.UI.Page
    {
        public static FacLabControle facLabControle = new FacLabControle();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id_num = Request.QueryString["id_num"];
            string rbillto = Request.QueryString["rbillto"];
            string fini = Request.QueryString["fini"];
            string ffin = Request.QueryString["ffin"];
            string pbase = Request.QueryString["pbase"];
            string cre = Request.QueryString["cre"];
            string rendi = Request.QueryString["rendi"];
            string factor = Request.QueryString["factor"];
            string mont = Request.QueryString["monto"];

            rbilltos.Text = rbillto;
            finis.Text = fini;
            ffins.Text = ffin;
            pbases.Text = pbase;
            cres.Text = cre;
            rendis.Text = rendi;
            factors.Text = factor;
            montos.Text = "$" + mont;
            

            facLabControle.WFMonto(id_num, mont);

        }
        protected void DM(object sender, EventArgs e)
        {
            string idd = Request.QueryString["id_num"];
            string cadena2 = @"Data source=172.24.16.112; Initial Catalog=TMWSuite; User ID=sa; Password=tdr9312;Trusted_Connection=false;MultipleActiveResultSets=true";
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(cadena2))
            {
                connection.Open();
                using (SqlCommand selectCommand = new SqlCommand("usp_SFullMexCat", connection))
                {

                    selectCommand.CommandType = CommandType.StoredProcedure;
                    selectCommand.CommandTimeout = 100000;
                    selectCommand.Parameters.AddWithValue("@id_num", (object)Int32.Parse(idd));
                    selectCommand.ExecuteNonQuery();
                    using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectCommand))
                    {
                        try
                        {
                            //selectCommand.Connection.Open();
                            sqlDataAdapter.Fill(dataTable);
                            using (XLWorkbook wb = new XLWorkbook())
                            {
                                wb.Worksheets.Add(dataTable, "2023");

                                Response.Clear();
                                Response.Buffer = true;
                                Response.Charset = "";
                                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                                Response.AddHeader("content-disposition", "attachment;filename=FullMexMonto.xlsx");
                                using (MemoryStream MyMemoryStream = new MemoryStream())
                                {
                                    wb.SaveAs(MyMemoryStream);
                                    MyMemoryStream.WriteTo(Response.OutputStream);
                                    Response.Flush();
                                    Response.End();
                                }
                            }
                        }
                        catch (SqlException ex)
                        {
                            connection.Close();
                            string message = ex.Message;
                        }
                    }
                }
            }


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
                        Response.Redirect("FullMex.aspx", false); ;
                    

        }
    }
}