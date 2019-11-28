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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True ;MultipleActiveResultSets=True");

                connection.Open();

                string query = "SELECT * FROM Colleges WHERE collegeCode=@cc";
                SqlCommand sqlcmd = new SqlCommand(query, connection);
                sqlcmd.Parameters.AddWithValue("@cc", Convert.ToInt32(Session["clgCode"]));

                SqlDataReader dataReader = sqlcmd.ExecuteReader();

                dataReader.Read();
                Label1.Text = dataReader[1].ToString() + ".";

                string query2 = "SELECT * FROM Department WHERE deptID=@did";
                SqlCommand sqlcmd2 = new SqlCommand(query2, connection);
                sqlcmd2.Parameters.AddWithValue("@did", Convert.ToInt32(Session["depId"]));

                SqlDataReader dataReader2 = sqlcmd2.ExecuteReader();
                dataReader2.Read();


                Label2.Text = dataReader2[1].ToString() + " Department.";
            }
        }
    }
}