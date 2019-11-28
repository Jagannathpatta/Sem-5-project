using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace RB
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        int clsid, sem;
        String year, subcode, subname;
        SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True");

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView2.SelectedRow;
           // try
           // {
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand sqlCmd = new SqlCommand("DeleteFromMarks", connection);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@grno", Convert.ToInt32(gr.Cells[0].Text));
                sqlCmd.Parameters.AddWithValue("@clgcode", Session["clgCode"]);
                sqlCmd.Parameters.AddWithValue("@subcode", Session["subcode"]);
                sqlCmd.Parameters.AddWithValue("@clsid", Session["clsid"]);
                sqlCmd.Parameters.AddWithValue("@sem", Session["sem"]);
                sqlCmd.ExecuteNonQuery();
                connection.Close();
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
          //  }
           // catch (Exception ex)
         //   {
          //      Panel2.Visible = true;
          //      flbl.Text = ex.Message.ToString();
          //  }


        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                clsid = Convert.ToInt32( Session["clsid"]); /*Convert.ToInt32(Server.UrlDecode(Request.QueryString["clsid"]));*/
                sem = Convert.ToInt32(Session["sem"]);/*Server.UrlDecode(Request.QueryString["sem"])*/
                year = Session["year"].ToString(); /*Server.UrlDecode(Request.QueryString["year"]);*/
                subcode = Session["subcode"].ToString(); /*Server.UrlDecode(Request.QueryString["subcode"]);*/
                subname = Session["subname"].ToString(); /*Server.UrlDecode(Request.QueryString["subname"]);*/
                lblyear.Text = year;
                lblSubname.Text = subname;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;

            try
            {
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand sqlCmd = new SqlCommand("InsertIntoMarks", connection);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@grno", Convert.ToInt32(gr.Cells[0].Text));
                sqlCmd.Parameters.AddWithValue("@clgcode", Session["clgCode"]);
                sqlCmd.Parameters.AddWithValue("@subcode", Session["subcode"]);
                sqlCmd.Parameters.AddWithValue("@clsid", Session["clsid"]);
                sqlCmd.Parameters.AddWithValue("@sem", Session["sem"]);
                sqlCmd.ExecuteNonQuery();
                connection.Close();
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            catch(Exception ex)
            {
                Panel2.Visible = true;
                flbl.Text = ex.Message.ToString();
            }

           
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
        }
    }
}