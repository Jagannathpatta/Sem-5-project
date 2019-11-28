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
    public partial class WebForm8 : System.Web.UI.Page
    {
        String connectionString = @"Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True";
        SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                //txtUN.Text = "";
                //txtpass.Text = "";
                if (!IsPostBack)
                {

                    btnDelete.Enabled = false;

                    fillGridView();
                }
            }

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            SqlCommand sqlCmd = new SqlCommand("StudentCreateOrUpdate", connection);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@Uid", Convert.ToDouble(txtUid.Text.Trim()) /*(hiddenTid.Value == "" ? 0 : Convert.ToInt32(hiddenTid.Value))*/);
            sqlCmd.Parameters.AddWithValue("@role", "Student" );
            sqlCmd.Parameters.AddWithValue("@collegeCode", Session["clgCode"] );
            sqlCmd.Parameters.AddWithValue("@deptID", Session["depId"] );
            sqlCmd.Parameters.AddWithValue("@userName", txtUN.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@password", txtpass.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@phone", Convert.ToDouble(txtphone.Text.Trim()));
            sqlCmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim() );
            sqlCmd.Parameters.AddWithValue("@stdID", Convert.ToDouble(txtsid.Text.Trim()));
            sqlCmd.Parameters.AddWithValue("@FirstName", txtFN.Text.Trim() );
            sqlCmd.Parameters.AddWithValue("@LastName", txtLN.Text.Trim() );
            sqlCmd.Parameters.AddWithValue("@GRno", Convert.ToDouble(txtGRno.Text.Trim()));
            sqlCmd.ExecuteNonQuery();
            connection.Close();
            string hiddenval = hiddenTid.Value.ToString();
            clear();
            if (hiddenval == "")
                txtSuc.Text = "Save sucessfully";
            else
                txtSuc.Text = "Updated Sucessfully";
            fillGridView();
        } 

        void fillGridView()
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            SqlDataAdapter sqlCmd = new SqlDataAdapter("StudentViewAll", connection);
            sqlCmd.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlCmd.SelectCommand.Parameters.AddWithValue("@deptID", Session["depId"]);
            sqlCmd.SelectCommand.Parameters.AddWithValue("@collegeCode", Session["clgCode"]);
            DataTable dtb1 = new DataTable();
            sqlCmd.Fill(dtb1);
            connection.Close();
            grid.DataSource = dtb1;
            grid.DataBind();

        }

        public void clear()
        {
            hiddenTid.Value = "";
            txtFN.Text = txtLN.Text = txtEmail.Text = txtphone.Text = txtUid.Text = txtUN.Text = txtpass.Text = txtconPass.Text = txtGRno.Text = "";
            txtsid.Text = "";
            btnSave.Text = "Submit";
            btnDelete.Enabled = false;
            txtGRno.Enabled = true;
            txtUid.Enabled = true;
            txtSuc.Text = txtFail.Text = "";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //Int32 tid = Convert.ToInt32(hiddenTid.Value);
            try
            {
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                SqlCommand sqlcmd = new SqlCommand("StudentDeleteByID", connection);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@GRno", hiddenTid.Value);
                sqlcmd.Parameters.AddWithValue("@Uid", Convert.ToDouble(txtUid.Text));
                sqlcmd.ExecuteNonQuery();
                connection.Close();
                clear();
                fillGridView();
                txtSuc.Text = "Deleted Sucessfully";
            }catch(Exception ex)
            {
                txtFail.Text = ex.Message.ToString();
            }
            

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }


        


        protected void grid_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = grid.SelectedRow;
            txtUid.Text = gr.Cells[4].Text;
            hiddenTid.Value = txtGRno.Text = gr.Cells[0].Text;
            txtGRno.Enabled = false;
            txtUid.Enabled = false;
            
            //Int32 tid =Convert.ToInt32(grid.SelectedRow.Cells[0].Text);
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            SqlDataAdapter sqlCmd = new SqlDataAdapter("StudentViewById", connection);
            sqlCmd.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlCmd.SelectCommand.Parameters.AddWithValue("@GRno", hiddenTid.Value);
            sqlCmd.SelectCommand.Parameters.AddWithValue("@Uid", Convert.ToDouble(txtUid.Text));
            DataTable dtb1 = new DataTable();
            sqlCmd.Fill(dtb1);
            connection.Close();
           
            //hiddenTid.Value = tid.ToString();
            txtFN.Text = dtb1.Rows[0]["FirstName"].ToString();
            txtLN.Text = dtb1.Rows[0]["LastName"].ToString();
            txtGRno.Text = dtb1.Rows[0]["GRno"].ToString();
            txtsid.Text = dtb1.Rows[0]["stdID"].ToString();
            txtUid.Text = dtb1.Rows[0]["Uid"].ToString();
            txtphone.Text = dtb1.Rows[0]["phone"].ToString();
            txtEmail.Text = dtb1.Rows[0]["email"].ToString();
            txtUN.Text = dtb1.Rows[0]["userName"].ToString();
            txtpass.Text = dtb1.Rows[0]["password"].ToString();
            txtconPass.Text = dtb1.Rows[0]["password"].ToString();
            btnSave.Text = "Update";
            btnDelete.Enabled = true;

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            Int32 GRno;
            Double uid;
            Int32 Stdid;
            Double phone;
            String lname;
            String fname;
            String email;
            String uname;
            String pass;           
            try{
                string path = Path.GetFileName(FileUpload1.FileName);
                path = path.Replace(" ", "");
                FileUpload1.SaveAs(Server.MapPath("~/ExcelFile/") + path);
                String ExcelPath = Server.MapPath("~/ExcelFile/") + path;
                OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + ExcelPath + "; Extended Properties=Excel 8.0; Persist Security Info = False");
                mycon.Open();

                OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", mycon);
                OleDbDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    // Response.Write("<br/>"+dr[0].ToString());
                    GRno = Convert.ToInt32(dr[0].ToString());
                    uid = Convert.ToDouble(dr[1].ToString());
                    Stdid = Convert.ToInt32(dr[2].ToString());
                    fname = dr[3].ToString();
                    lname = dr[4].ToString();
                    email = dr[5].ToString();
                    phone = Convert.ToDouble(dr[6].ToString());
                    uname = dr[7].ToString();
                    pass = dr[8].ToString();
                    savedata(GRno, uid, Stdid, fname, lname, email, phone, uname, pass);                    
                }
                Panel1.Visible = true;
            }catch(Exception ex)
            {
                Panel2.Visible = true;
                flbl.Text = ex.Message.ToString();
            }
            fillGridView();           
        }
        private void savedata(Int32 GRno, Double uid, Int32 Stdid, String fname, String lname, String email, Double phone, String uname, String pass)
        {
            //String query = "insert into studentdetail(rollno,sname,fathername,mothername) values(" + rollno1 + ",'" + sname1 + "','" + fname1 + "','" + mname1 + "')";
            //String mycon = "Data Source=HP-PC\\SQLEXPRESS; Initial Catalog=ExcelDatabase; Integrated Security=true";
            //SqlConnection con = new SqlConnection(mycon);
            //con.Open();
            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandText = query;
            //cmd.Connection = con;
            //cmd.ExecuteNonQuery();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("StudentCreateOrUpdate", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Uid", uid);
                cmd.Parameters.AddWithValue("@role", "Student" /*(GridView1.FooterRow.FindControl("roleTextBoxfooter") as TextBox).Text.Trim()*/);
                cmd.Parameters.AddWithValue("@collegeCode", Session["clgCode"] /*Convert.ToInt32((GridView1.FooterRow.FindControl("collegeCodeTextBoxfooter") as TextBox).Text.Trim())*/);
                cmd.Parameters.AddWithValue("@deptID", Session["depId"] /*Convert.ToInt32((GridView1.FooterRow.FindControl("deptIDTextBoxfooter") as TextBox).Text.Trim())*/);
                cmd.Parameters.AddWithValue("@userName", uname);
                cmd.Parameters.AddWithValue("@password", pass);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@stdID", Stdid);
                cmd.Parameters.AddWithValue("@FirstName", fname);
                cmd.Parameters.AddWithValue("@LastName", lname);
                cmd.Parameters.AddWithValue("@GRno", GRno);
                cmd.ExecuteNonQuery();


            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/octect-stream";
            Response.AppendHeader("content-disposition", "filename=StudentInfoTemplet.xltx");
            Response.TransmitFile(Server.MapPath("~/ExcelFile/StudentInfoTemplet.xltx"));
            Response.End();
        }
    }
}