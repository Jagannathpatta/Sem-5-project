using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

namespace RB
{
    public partial class loginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session.Abandon();
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            if (txt_Password.Text.Equals("") || txt_UserName.Text.Equals(""))
                status.Text = "*Invalid Credentials";
            else
            {
                SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True");

                connection.Open();

                string query = "SELECT COUNT(1) FROM Logins WHERE userName=@un AND password =@p";
                SqlCommand sqlcmd = new SqlCommand(query, connection);
                sqlcmd.Parameters.AddWithValue("@un", txt_UserName.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@p", txt_Password.Text.Trim());

                int count = Convert.ToInt32(sqlcmd.ExecuteScalar());

                if (count == 1)
                {
                    string query2 = "SELECT * FROM Logins WHERE userName=@un AND password =@p";
                    SqlCommand sqlcmd2 = new SqlCommand(query2, connection);
                    sqlcmd2.Parameters.AddWithValue("@un", txt_UserName.Text.Trim());
                    sqlcmd2.Parameters.AddWithValue("@p", txt_Password.Text.Trim());
                    SqlDataReader dataReader = sqlcmd2.ExecuteReader();
                    dataReader.Read();
                    string role = dataReader[5].ToString();
                    Session["uid"] = Convert.ToDouble(dataReader[2]);
                    Session["email"] = dataReader[4].ToString();
                    Session["clgCode"] = Convert.ToInt32(dataReader[6]);
                    Session["depId"] = Convert.ToInt32(dataReader[7]);
                    Console.WriteLine(role);

                    if (role == "HOD")
                    {
                        Session["Username"] = txt_UserName.Text.Trim();
                        Server.Transfer("~/hodHome.aspx", false);
                    }
                    else if (role == "Teacher")
                    {
                        Session["Username"] = txt_UserName.Text.Trim();
                        Response.Redirect("~/teacherHome.aspx", false);
                    }
                    else if (role == "Student")
                    {
                        Session["Username"] = txt_UserName.Text.Trim();
                        Response.Redirect("~/StudentHome.aspx",false);
                    }

                }

                else
                {
                    status.Text = "*Invalid Credentials";
                }
            }
            
           
        }

        protected void btn_forgetPass_Click(object sender, EventArgs e)
        {
            
            Panel1.Visible = false;
            Panel2.Visible = true;
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
            Panel1.Visible = true;
        }

        protected void btnsnpd_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Equals("") || TextBox2.Text.Equals(""))
                Label8.Text = "*Invalid Credentials";
            else
            {
                String password;             
                String myquery = "Select * from Logins where userName='" + TextBox1.Text + "' and email='" + TextBox2.Text + "'";
                SqlConnection con = new SqlConnection("Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    //Label3.Text = "Data Found";

                    password = ds.Tables[0].Rows[0]["password"].ToString();
                    sendpassword(password, TextBox2.Text);
                    Label8.Text = "Your Password Has Been Sent to Registered Email Address. Check Your Mail Inbox";

                }
                else
                {
                    Label8.Text = "Your Username is Not Valid or Email Not Registered";

                }
                con.Close();
            }
        }

        private void sendpassword(String password, String email)
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("rajbatra080@gmail.com", "r@jb@tr@");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Recovered Password ( ResultBuilder )";
            msg.Body = "Dear " + TextBox1.Text + ", Your Password is  " + password + "\n\n\nThanks & Regards\nResult Builder Team";
            string toaddress = TextBox2.Text;
            msg.To.Add(toaddress);
            string fromaddress = "ResultBuilder <rajbatra080@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);


            }
            catch
            {
                throw;
            }
        }


    }
}