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
    public partial class WebForm6 : System.Web.UI.Page
    {
        String connectionString = @"Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { populateGridView(); }

        }

        void populateGridView()
        {
            DataTable dtd1 = new DataTable();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter("StudentViewAll", conn);
                sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlda.SelectCommand.Parameters.AddWithValue("@deptID", Session["depId"]);
                sqlda.SelectCommand.Parameters.AddWithValue("@collegeCode", Session["clgCode"]);
                sqlda.Fill(dtd1);
            }
            GridView1.DataSource = dtd1;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand("StudentCreateOrUpdate", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Uid", Convert.ToInt32((GridView1.FooterRow.FindControl("UidTextBoxfooter") as TextBox).Text.Trim()));
                        cmd.Parameters.AddWithValue("@role", "Student" /*(GridView1.FooterRow.FindControl("roleTextBoxfooter") as TextBox).Text.Trim()*/);
                        cmd.Parameters.AddWithValue("@collegeCode", Session["clgCode"] /*Convert.ToInt32((GridView1.FooterRow.FindControl("collegeCodeTextBoxfooter") as TextBox).Text.Trim())*/);
                        cmd.Parameters.AddWithValue("@deptID", Session["depId"] /*Convert.ToInt32((GridView1.FooterRow.FindControl("deptIDTextBoxfooter") as TextBox).Text.Trim())*/);
                        cmd.Parameters.AddWithValue("@userName", (GridView1.FooterRow.FindControl("userNameTextBoxfooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@password", (GridView1.FooterRow.FindControl("passwordTextBoxfooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@phone", Convert.ToInt32((GridView1.FooterRow.FindControl("phoneTextBoxfooter") as TextBox).Text.Trim()));
                        cmd.Parameters.AddWithValue("@email", (GridView1.FooterRow.FindControl("emailTextBoxfooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@stdID", Convert.ToInt32((GridView1.FooterRow.FindControl("stdIDTextBoxfooter") as TextBox).Text.Trim()));
                        cmd.Parameters.AddWithValue("@FirstName", (GridView1.FooterRow.FindControl("FirstNameTextBoxfooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@LastName", (GridView1.FooterRow.FindControl("LastNameTextBoxfooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@GRno", Convert.ToInt32((GridView1.FooterRow.FindControl("GRno_TextBox") as TextBox).Text.Trim()));
                        cmd.ExecuteNonQuery();
                        populateGridView();
                        sm.Text = "student Sucessfully Added";
                        fm.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                sm.Text = "";
                fm.Text = ex.Message;
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            populateGridView();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            populateGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("StudentCreateOrUpdate", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Uid", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("Uidlabel1") as Label).Text.Trim()));
                    cmd.Parameters.AddWithValue("@role", "Student"/*(GridView1.Rows[e.RowIndex].FindControl("roleTextBox") as TextBox).Text.Trim()*/);
                    cmd.Parameters.AddWithValue("@collegeCode", Session["clgCode"] /*Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("collegeCodeTextBox") as TextBox).Text.Trim())*/);
                    cmd.Parameters.AddWithValue("@deptID", Session["depId"] /*Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("deptIDTextBox") as TextBox).Text.Trim())*/);
                    cmd.Parameters.AddWithValue("@userName", (GridView1.Rows[e.RowIndex].FindControl("userNameTextBox") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@password", (GridView1.Rows[e.RowIndex].FindControl("passwordTextBox") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@phone", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("phoneTextBox") as TextBox).Text.Trim()));
                    cmd.Parameters.AddWithValue("@email", (GridView1.Rows[e.RowIndex].FindControl("emailTextBox") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@stdID", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("stdIDTextBox") as TextBox).Text.Trim()));
                    cmd.Parameters.AddWithValue("@FirstName", (GridView1.Rows[e.RowIndex].FindControl("FirstNameTextBox") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@LastName", (GridView1.Rows[e.RowIndex].FindControl("LastNameTextBox") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@GRno", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("GRno_Label1") as Label).Text.Trim()));
                    cmd.ExecuteNonQuery();
                    GridView1.EditIndex = -1;
                    populateGridView();
                    sm.Text = "student Sucessfully Updated";
                    fm.Text = "";
                }
            }
            catch (Exception ex)
            {
                sm.Text = "";
                fm.Text = "Updation of GRno. and Uid is prohibited. You should Delete the current one and then add the new Record.";
            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("StudentDeleteByID", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@GRno", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("GRno_Label") as Label).Text.Trim()));
                    cmd.Parameters.AddWithValue("@Uid", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("UidLabel") as Label).Text.Trim()));
                    cmd.ExecuteNonQuery();
                    populateGridView();
                    sm.Text = "student Sucessfully Deleted";
                    fm.Text = "";
                }
            }
            catch (Exception ex)
            {
                sm.Text = "";
                fm.Text = ex.Message;
            }
        }
    }
}