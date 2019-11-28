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
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if (!IsPostBack)
                {
                    btnDelete.Enabled = false;
                    fillGridView();
                }
            }
               
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand sqlCmd = new SqlCommand("TeacherCreateOrUpdate", connection);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@Tid", (hiddenTid.Value == "" ? 0 : Convert.ToInt32(hiddenTid.Value)));
                sqlCmd.Parameters.AddWithValue("@FirstName", txtFN.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@LastName", txtLN.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Uid", Convert.ToDouble(txtUid.Text.Trim()));
                sqlCmd.Parameters.AddWithValue("@role", role.SelectedValue);
                sqlCmd.Parameters.AddWithValue("@collegeCode", Session["clgCode"]);
                sqlCmd.Parameters.AddWithValue("@deptID", Session["depId"]);
                sqlCmd.Parameters.AddWithValue("@userName", txtUN.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@password", txtpass.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@phone", Convert.ToDouble(txtphone.Text.Trim()));
                sqlCmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
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
            catch (Exception ex)
            {
                txtFail.Text = ex.Message.ToString();
            }
            
        }

        void fillGridView()
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            SqlDataAdapter sqlCmd = new SqlDataAdapter("TeachersViewAll", connection);
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
            txtFN.Text = txtLN.Text = txtEmail.Text = txtphone.Text = txtUid.Text = txtUN.Text = txtpass.Text = txtconPass.Text= "";
            txtUid.Enabled = true;
            role.SelectedIndex = -1;
            btnSave.Text = "Submit";
            btnDelete.Enabled = false;
            txtSuc.Text = txtFail.Text = "";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //Int32 tid = Convert.ToInt32(hiddenTid.Value);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            SqlCommand sqlcmd = new SqlCommand("TeacherDeleteById", connection);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@Tid", hiddenTid.Value);
            sqlcmd.Parameters.AddWithValue("@Uid",Convert.ToDouble(txtUid.Text));
            sqlcmd.ExecuteNonQuery();
            connection.Close();
            clear();
            fillGridView();
            txtSuc.Text = "Deleted Sucessfully";

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }

        

        protected void grid_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = grid.SelectedRow;
            txtUid.Text = gr.Cells[3].Text;
            hiddenTid.Value = gr.Cells[0].Text;
            txtUid.Enabled = false;
            //Int32 tid =Convert.ToInt32(grid.SelectedRow.Cells[0].Text);
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            SqlDataAdapter sqlCmd = new SqlDataAdapter("TeacherViewById", connection);
            sqlCmd.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlCmd.SelectCommand.Parameters.AddWithValue("@Tid", hiddenTid.Value);
            sqlCmd.SelectCommand.Parameters.AddWithValue("@Uid", Convert.ToDouble(txtUid.Text));
            DataTable dtb1 = new DataTable();
            sqlCmd.Fill(dtb1);
            connection.Close();
            role.SelectedIndex = -1;
            //hiddenTid.Value = tid.ToString();
            txtFN.Text = dtb1.Rows[0]["FirstName"].ToString();
            txtLN.Text = dtb1.Rows[0]["LastName"].ToString();
            role.Items.FindByValue(dtb1.Rows[0]["role"].ToString()).Selected = true;
            txtUid.Text = dtb1.Rows[0]["Uid"].ToString();
            txtphone.Text = dtb1.Rows[0]["phone"].ToString();
            txtEmail.Text = dtb1.Rows[0]["email"].ToString();
            txtUN.Text = dtb1.Rows[0]["userName"].ToString();
            txtpass.Text = dtb1.Rows[0]["password"].ToString();
            txtconPass.Text = dtb1.Rows[0]["password"].ToString();
            btnSave.Text = "Update";
            btnDelete.Enabled = true;

        }

       
    }
}