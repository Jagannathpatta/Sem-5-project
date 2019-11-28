using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace RB
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            fillGridView();
            if (Convert.ToInt32(Session["depId"]) == 120)
            {
                lbprg.Text = "Bachelor of Science (B.Sc.) in Computer Science";
            }
            else if (Convert.ToInt32(Session["depId"]) == 140)
            {
                lbprg.Text = "Bachelor of Science (B.Sc.) in Information Technology";
            }
            lbsem.Text = Session["sem"].ToString();
            lbprn.Text = Session["grno"].ToString();
            lbstno.Text = Session["stdid"].ToString();
            lbname.Text = Session["Fname"].ToString() +"  " + Session["lname"].ToString();
            if (Convert.ToInt32(Session["sem"]) == 1)
            {
                if(GridView1.Rows.Count == 8)
                {
                    lbremark.Text = "Successful";
                    lbces1.Text = "" ;
                    lbsgpiS1.Text = "";
                }
                else
                {
                    lbremark.Text = "Not Successful";
                    lbces1.Text = "--";
                    lbsgpiS1.Text = "--";
                }
                
            }
            else if (Convert.ToInt32(Session["sem"]) == 2)
            {
                if (GridView1.Rows.Count == 8)
                {
                    lbremark.Text = "Successful";
                    lbces1.Text = "";
                    lbsgpiS1.Text = "";
                    lbces2.Text = "";
                    lbsgpiS2.Text = "";
                }
                else
                {
                    lbremark.Text = "Not Successful";
                    lbces1.Text = "--";
                    lbsgpiS1.Text = "--";
                    lbces2.Text = "--";
                    lbsgpiS2.Text = "--";
                }

            }
            else if (Convert.ToInt32(Session["sem"]) == 3)
            {
                if (GridView1.Rows.Count == 8)
                {
                    lbremark.Text = "Successful";
                    lbces1.Text = "";
                    lbsgpiS1.Text = "";
                    lbces2.Text = "";
                    lbsgpiS2.Text = "";
                    lbces3.Text = "";
                    lbsgpiS3.Text = "";
                }
                else
                {
                    lbremark.Text = "Not Successful";
                    lbces1.Text = "--";
                    lbsgpiS1.Text = "--";
                    lbces2.Text = "--";
                    lbsgpiS2.Text = "--";
                    lbces3.Text = "--";
                    lbsgpiS3.Text = "--";
                }

            }
            else if (Convert.ToInt32(Session["sem"]) == 4)
            {
                if (GridView1.Rows.Count == 8)
                {
                    lbremark.Text = "Successful";
                    lbces1.Text = "";
                    lbsgpiS1.Text = "";
                    lbces2.Text = "";
                    lbsgpiS2.Text = "";
                    lbces3.Text = "";
                    lbsgpiS3.Text = "";
                    lbces4.Text = "";
                    lbsgpiS4.Text = "";
                }
                else
                {
                    lbremark.Text = "Not Successful";
                    lbces1.Text = "--";
                    lbsgpiS1.Text = "--";
                    lbces2.Text = "--";
                    lbsgpiS2.Text = "--";
                    lbces3.Text = "--";
                    lbsgpiS3.Text = "--";
                    lbces4.Text = "--";
                    lbsgpiS4.Text = "--";
                }

            }
            
        }


        void fillGridView()
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            SqlDataAdapter sqlCmd = new SqlDataAdapter("GenerateResult", connection);
            sqlCmd.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlCmd.SelectCommand.Parameters.AddWithValue("@grno", Session["grno"]);
            sqlCmd.SelectCommand.Parameters.AddWithValue("@sem", Session["sem"]);
            DataTable dtb1 = new DataTable();
            sqlCmd.Fill(dtb1);
            connection.Close();
            GridView1.DataSource = dtb1;
            GridView1.DataBind();

        }

        protected void print_Click(object sender, EventArgs e)
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "PrintOperation", "printing()", true);
            //exportpdf();
        }
        //private void exportpdf()
        //{
        //    //Rectangle envelope = new Rectangle(432, 252);
        //    Response.ContentType = "application/pdf";
        //    Response.AddHeader("content-disposition", "attachment;filename=reportcard.pdf");
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    StringWriter sw = new StringWriter();
        //    HtmlTextWriter hw = new HtmlTextWriter(sw);
        //    Panel1.RenderControl(hw);
        //    StringReader sr = new StringReader(sw.ToString());
        //    Document pdfDoc = new Document(PageSize.A4.Rotate(), 10f, 10f, 100f, 0f);
        //    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        //    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        //    pdfDoc.Open();
        //    htmlparser.Parse(sr);
        //    pdfDoc.Close();
        //    Response.Write(pdfDoc);
        //    Response.End();
        //}
    }
}