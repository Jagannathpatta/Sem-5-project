using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace RB
{
    public partial class bttest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True ;MultipleActiveResultSets=True");

                connection.Open();
                try
                {
                    //string query = "SELECT * FROM Colleges WHERE collegeCode=@cc";
                    //SqlCommand sqlcmd = new SqlCommand(query, connection);
                    //sqlcmd.Parameters.AddWithValue("@cc", Session["clgCode"]);

                    //SqlDataReader dataReader = sqlcmd.ExecuteReader();

                    //dataReader.Read();

                    //Label1.Text = dataReader[1].ToString() + ".";
                    //dataReader.Close();

                    //string query2 = "SELECT * FROM Department WHERE deptID=@did";
                    //SqlCommand sqlcmd2 = new SqlCommand(query2, connection);
                    //sqlcmd2.Parameters.AddWithValue("@did", Session["depId"]);

                    //SqlDataReader dataReader2 = sqlcmd2.ExecuteReader();
                    //dataReader2.Read();


                    //Label2.Text = dataReader2[1].ToString() + "Department.";
                    //dataReader2.Close();

                    string query3 = "SELECT * FROM Students WHERE Uid=@uid";
                    SqlCommand sqlcmd3 = new SqlCommand(query3, connection);
                    sqlcmd3.Parameters.AddWithValue("@uid", Session["uid"]);

                    SqlDataReader dataReader3 = sqlcmd3.ExecuteReader();

                    dataReader3.Read();
                    Session["grno"] = Convert.ToInt32(dataReader3[6]);
                    Session["Fname"] = dataReader3[1].ToString();
                    Session["lname"] = dataReader3[2].ToString();
                    Session["stdid"] = Convert.ToInt32(dataReader3[0]);

                    Label1.Text = Session["Fname"].ToString();
                    dataReader3.Close();

                }
                catch (SqlException ex)
                {
                    Console.WriteLine(ex);
                }
            }
        }

        protected void btnview_Click(object sender, EventArgs e)
        {
            Session["sem"] = Convert.ToInt32( RadioButtonList1.SelectedValue);
            Response.Redirect("~/Reportcard.aspx");
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Server.Transfer("~/loginForm.aspx");
        }
    }
}