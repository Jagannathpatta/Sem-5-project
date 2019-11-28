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
    public partial class WebForm10 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if (!IsPostBack)
                {
                    //btnDelete.Enabled = false;

                    fillGridView();
                }
            }
           
        }

        void fillGridView()
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            SqlDataAdapter sqlCmd = new SqlDataAdapter("ViewClassesToTeacher", connection);
            sqlCmd.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlCmd.SelectCommand.Parameters.AddWithValue("@depid", Session["depId"]);
            sqlCmd.SelectCommand.Parameters.AddWithValue("@tid", Session["tid"]);
            DataTable dtb1 = new DataTable();
            sqlCmd.Fill(dtb1);
            connection.Close();
            GridView1.DataSource = dtb1;
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            Session["clsid"] =Convert.ToInt32( gr.Cells[0].Text);
            Session["year"]  = gr.Cells[1].Text;
            Session["sem"]  = Convert.ToInt32(gr.Cells[2].Text);
            Session["subcode"]  = gr.Cells[3].Text;
            Session["subname"]  = gr.Cells[4].Text;

            Response.Redirect("AddStudent.aspx");
        }
    }
}