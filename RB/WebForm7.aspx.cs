using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Data.OleDb;
namespace RB
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True");
        String connectionString = @"Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            //populateGridView();
            if (Session["Username"] != null)
            {
                if (!IsPostBack)
                {
                    int year = DateTime.Now.Year;
                    for (int i = year; i <= year + 4; i++)
                    {
                        ListItem li = new ListItem(i.ToString());
                        yr.Items.Add(li);
                    }
                    btnDelete.Enabled = false;

                    fillGridView();
                }
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
        protected void yr_SelectedIndexChanged(object sender, EventArgs e)
        {
            String ay = "" + clsyr.SelectedItem.ToString() + " " + yr.SelectedItem.ToString() + " - " + (Convert.ToInt32(yr.SelectedItem.ToString()) + 1) + "";
            txtAY.Text = ay;

        }
        public void clear()
        {
            txtCid.Text = txtAY.Text = "";
            sem.SelectedIndex = -1;
            clsyr.SelectedIndex = yr.SelectedIndex = -1;
           // RadioButtonList1.SelectedIndex = DropDownList1.SelectedIndex = -1;
            btnSave.Text = "Save";
           // Panel1.Visible = true;
            Panel2.Visible = false;
            btnDelete.Enabled = false;
            susTxt.Text = failTxt.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            int count = 1;
            if (btnSave.Text.Equals("Save"))
            {
                string query = "SELECT COUNT(1) FROM Classes WHERE year=@year AND subCode =@sc AND  collegeCode=@clgcode";
                SqlCommand sqlcmd = new SqlCommand(query, connection);
                sqlcmd.Parameters.AddWithValue("@year", txtAY.Text.Trim());
             //   sqlcmd.Parameters.AddWithValue("@sc", RadioButtonList1.SelectedValue);
                sqlcmd.Parameters.AddWithValue("@clgcode", Session["clgCode"]);

                count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            }

            if (count == 0)
            {
                //adddata(RadioButtonList1.SelectedValue.ToString());
                clear();
                susTxt.Text = "Save sucessfully";

            }
            else if (count == 1)
            {
                adddata(txtsubcode.Text);
                clear();
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
                susTxt.Text = "Updated Sucessfully";
            }
            else
            {
                susTxt.Text = "";
                failTxt.Text = "Teacher to this subject is already assigned.";
            }

            fillGridView();

        }

        void adddata(String Subcode)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            SqlCommand sqlCmd = new SqlCommand("classCreateOrUpdate", connection);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@classID", (HiddenField1.Value == "" ? 0 : Convert.ToInt32(HiddenField1.Value)));
            sqlCmd.Parameters.AddWithValue("@year", txtAY.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@deptID", Session["depId"]);
            sqlCmd.Parameters.AddWithValue("@sem", sem.SelectedValue);
         //   sqlCmd.Parameters.AddWithValue("@Tid", Convert.ToInt32(DropDownList1.SelectedValue));
            sqlCmd.Parameters.AddWithValue("@subCode", Subcode);
            sqlCmd.Parameters.AddWithValue("@clgcode", Session["clgCode"]);
            sqlCmd.ExecuteNonQuery();
            connection.Close();


            clear();

        }

        void fillGridView()
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            SqlDataAdapter sqlCmd = new SqlDataAdapter("classViewAll", connection);
            sqlCmd.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlCmd.SelectCommand.Parameters.AddWithValue("@clgcode", Session["clgCode"]);
            sqlCmd.SelectCommand.Parameters.AddWithValue("@depid", Session["depId"]);            
            DataTable dtb1 = new DataTable();
            sqlCmd.Fill(dtb1);
            connection.Close();
            grid.DataSource = dtb1;
            grid.DataBind();

        }

        protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid.PageIndex = e.NewPageIndex;
            fillGridView();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                SqlCommand sqlcmd = new SqlCommand("classDeleteById", connection);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@classID", Convert.ToInt32(HiddenField1.Value));
                sqlcmd.Parameters.AddWithValue("@subCode", grid.SelectedRow.Cells[3].Text);
                sqlcmd.ExecuteNonQuery();
                connection.Close();
                clear();
                fillGridView();
                susTxt.Text = "Deleted Sucessfully";
            }
            catch (Exception ex)
            {
                failTxt.Text = ex.Message.ToString();
            }
            Page.Response.Redirect(Page.Request.Url.ToString(), true);

        }

        protected void sem_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            String query = "Select subCode , subName from Subjects where deptID = @did And sem =@sem";
            SqlDataAdapter sqlCmd = new SqlDataAdapter(query, connection);
            //sqlCmd.SelectCommand.CommandType = CommandType.StoredProcedure;
            //SqlCommand cmd = new SqlCommand(query, connection);
            sqlCmd.SelectCommand.Parameters.AddWithValue("@did", Session["depId"]);
            sqlCmd.SelectCommand.Parameters.AddWithValue("@sem", sem.SelectedValue);
            DataTable dtb1 = new DataTable();
            sqlCmd.Fill(dtb1);
            connection.Close();
            GridView1.DataSource = dtb1;
            GridView1.DataBind();
        }
        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Int32 GRno;
        //    Int32 uid;
        //    Int32 Stdid;
        //    Int32 phone;
        //    String lname;
        //    String fname;
        //    String email;
        //    String uname;
        //    String pass;
        //    string path = Path.GetFileName(FileUpload1.FileName);
        //    path = path.Replace(" ", "");
        //    FileUpload1.SaveAs(Server.MapPath("~/ExcelFile/") + path);
        //    String ExcelPath = Server.MapPath("~/ExcelFile/") + path;
        //    OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + ExcelPath + "; Extended Properties=Excel 8.0; Persist Security Info = False");
        //    mycon.Open();
        //    OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", mycon);
        //    OleDbDataReader dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        // Response.Write("<br/>"+dr[0].ToString());
        //        GRno = Convert.ToInt32(dr[0].ToString());
        //        uid = Convert.ToInt32(dr[1].ToString());
        //        Stdid = Convert.ToInt32(dr[2].ToString());
        //        fname = dr[3].ToString();
        //        lname = dr[4].ToString();
        //        email = dr[5].ToString();
        //        phone = Convert.ToInt32(dr[6].ToString());
        //        uname = dr[7].ToString();
        //        pass = dr[8].ToString();

        //        savedata(GRno,uid,Stdid,fname,lname,email,phone,uname,pass);


        //    }
        //    Label2.Text = "Data Has Been Saved Successfully";
        //}

        //private void savedata(Int32 GRno,Int32 uid, Int32 Stdid,String fname, String lname, String email, Int32 phone, String uname, String pass)
        //{
        //    //String query = "insert into studentdetail(rollno,sname,fathername,mothername) values(" + rollno1 + ",'" + sname1 + "','" + fname1 + "','" + mname1 + "')";
        //    //String mycon = "Data Source=HP-PC\\SQLEXPRESS; Initial Catalog=ExcelDatabase; Integrated Security=true";
        //    //SqlConnection con = new SqlConnection(mycon);
        //    //con.Open();
        //    //SqlCommand cmd = new SqlCommand();
        //    //cmd.CommandText = query;
        //    //cmd.Connection = con;
        //    //cmd.ExecuteNonQuery();
        //    using (SqlConnection conn = new SqlConnection(connectionString))
        //    {
        //        conn.Open();
        //        SqlCommand cmd = new SqlCommand("StudentCreateOrUpdate", conn);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@Uid",uid);
        //        cmd.Parameters.AddWithValue("@role", "Student" /*(GridView1.FooterRow.FindControl("roleTextBoxfooter") as TextBox).Text.Trim()*/);
        //        cmd.Parameters.AddWithValue("@collegeCode", Session["clgCode"] /*Convert.ToInt32((GridView1.FooterRow.FindControl("collegeCodeTextBoxfooter") as TextBox).Text.Trim())*/);
        //        cmd.Parameters.AddWithValue("@deptID", Session["depId"] /*Convert.ToInt32((GridView1.FooterRow.FindControl("deptIDTextBoxfooter") as TextBox).Text.Trim())*/);
        //        cmd.Parameters.AddWithValue("@userName", uname );
        //        cmd.Parameters.AddWithValue("@password", pass);
        //        cmd.Parameters.AddWithValue("@phone", phone );
        //        cmd.Parameters.AddWithValue("@email", email);
        //        cmd.Parameters.AddWithValue("@stdID",Stdid);
        //        cmd.Parameters.AddWithValue("@FirstName",fname);
        //        cmd.Parameters.AddWithValue("@LastName", lname);
        //        cmd.Parameters.AddWithValue("@GRno", GRno);
        //        cmd.ExecuteNonQuery();


        //    }
        //}
        //void populateGridView()
        //{
        //    DataTable dtd1 = new DataTable();
        //    using (SqlConnection conn = new SqlConnection(connectionString))
        //    {
        //        conn.Open();
        //        SqlDataAdapter sqlda = new SqlDataAdapter("StudentViewAll", conn);
        //        sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
        //        sqlda.SelectCommand.Parameters.AddWithValue("@deptID", Session["depId"]);
        //        sqlda.SelectCommand.Parameters.AddWithValue("@collegeCode", Session["clgCode"]);
        //        sqlda.Fill(dtd1);
        //    }
        //    GridView1.DataSource = dtd1;
        //    GridView1.DataBind();
        //}
    }
}