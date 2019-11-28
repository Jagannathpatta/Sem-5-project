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
    public partial class WebForm12 : System.Web.UI.Page
    {
        int clsid, sem;
        String year, subcode, subname;
        String connectionString = @"Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                clsid = Convert.ToInt32(Server.UrlDecode(Request.QueryString["clsid"]));
                sem = Convert.ToInt32(Server.UrlDecode(Request.QueryString["sem"]));
                year = Server.UrlDecode(Request.QueryString["year"]);
                subcode = Server.UrlDecode(Request.QueryString["subcode"]);
                subname = Server.UrlDecode(Request.QueryString["subname"]);
                lblyear.Text = Session["year"].ToString();
                lblSubname.Text =Session["subname"].ToString();
                populateGridView();
            }
          
        }
        void populateGridView()
        {
            DataTable dtd1 = new DataTable();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter("ViewMarks", conn);
                sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlda.SelectCommand.Parameters.AddWithValue("@subcode", Session["subcode"]);
                sqlda.SelectCommand.Parameters.AddWithValue("@clsid", Session["clsid"]);
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
                String OG = null;
                String IG = intcalc(Convert.ToDouble((GridView1.Rows[e.RowIndex].FindControl("internalsTextBox") as TextBox).Text.Trim()));
                String TG = thcalc(Convert.ToDouble((GridView1.Rows[e.RowIndex].FindControl("theoryTextBox") as TextBox).Text.Trim()));
                String PG = prcalc(Convert.ToDouble((GridView1.Rows[e.RowIndex].FindControl("practiclesTextBox") as TextBox).Text.Trim()));
                int GP = 0;

                if( IG.Equals("F") || TG.Equals("F") || PG.Equals("F"))
                {
                    OG = null;
                    GP = 0;
                }
                else
                {
                    OG = ovallcalc((Convert.ToDouble((GridView1.Rows[e.RowIndex].FindControl("internalsTextBox") as TextBox).Text.Trim())) + (Convert.ToDouble((GridView1.Rows[e.RowIndex].FindControl("theoryTextBox") as TextBox).Text.Trim())));
                    GP = GradptCalc(OG);
                }
           
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("UpdateIntoMarks", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@grno", Convert.ToInt32(GridView1.Rows[e.RowIndex].Cells[0].Text.Trim()));
                    cmd.Parameters.AddWithValue("@subcode", Session["subcode"]/*(GridView1.Rows[e.RowIndex].FindControl("roleTextBox") as TextBox).Text.Trim()*/);
                    cmd.Parameters.AddWithValue("@internal", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("internalsTextBox") as TextBox).Text.Trim()));
                    cmd.Parameters.AddWithValue("@theory", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("theoryTextBox") as TextBox).Text.Trim()));
                    cmd.Parameters.AddWithValue("@pract", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("practiclesTextBox") as TextBox).Text.Trim()));
                    cmd.Parameters.AddWithValue("@ig", IG);
                    cmd.Parameters.AddWithValue("@tg", TG);
                    cmd.Parameters.AddWithValue("@pg", PG);
                    cmd.Parameters.AddWithValue("@og", OG);
                    cmd.Parameters.AddWithValue("@ce", 2);
                    cmd.Parameters.AddWithValue("@gp", GP);
                    //cmd.Parameters.AddWithValue("@password", (GridView1.Rows[e.RowIndex].FindControl("passwordTextBox") as TextBox).Text.Trim());
                    //cmd.Parameters.AddWithValue("@phone", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("phoneTextBox") as TextBox).Text.Trim()));
                    //cmd.Parameters.AddWithValue("@email", (GridView1.Rows[e.RowIndex].FindControl("emailTextBox") as TextBox).Text.Trim());
                    //cmd.Parameters.AddWithValue("@stdID", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("stdIDTextBox") as TextBox).Text.Trim()));
                    //cmd.Parameters.AddWithValue("@FirstName", (GridView1.Rows[e.RowIndex].FindControl("FirstNameTextBox") as TextBox).Text.Trim());
                    //cmd.Parameters.AddWithValue("@LastName", (GridView1.Rows[e.RowIndex].FindControl("LastNameTextBox") as TextBox).Text.Trim());
                    //cmd.Parameters.AddWithValue("@GRno", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("GRno_Label1") as Label).Text.Trim()));
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
                fm.Text = ex.Message.ToString(); //"Updation of GRno. and Uid is prohibited. You should Delete the current one and then add the new Record.";
            }

        }

        private String ovallcalc(double v)
        {
            String grd;
            if (v >= 80 && v <= 100)
            {
                grd = "O";
            }
            else if (v >= 70 && v < 80)
            {
                grd = "A+";
            }
            else if (v >= 60 && v < 70)
            {
                grd = "A";
            }
            else if (v >= 55 && v < 60)
            {
                grd = "B+";
            }
            else if (v >= 50 && v < 55)
            {
                grd = "B";
            }
            else if (v >= 45 && v < 50)
            {
                grd = "C";
            }
            else if (v >= 40 && v < 45)
            {
                grd = "D";
            }
            else if (v > 0 && v < 40)
            {
                grd = "F";
            }
            else
            {
                grd = null;
            }
            return grd;
        }

        private String prcalc(double v)
        {
            String grd;
            if (v >= 40 && v <= 50)
            {
                grd = "O";
            }
            else if (v >= 35 && v < 40)
            {
                grd = "A+";
            }
            else if (v >= 30 && v < 35)
            {
                grd = "A";
            }
            else if (v >= 27.5 && v < 30)
            {
                grd = "B+";
            }
            else if (v >= 25 && v < 27.5)
            {
                grd = "B";
            }
            else if (v >= 22.5 && v < 25)
            {
                grd = "C";
            }
            else if (v >= 20 && v < 22.5)
            {
                grd = "D";
            }
            else if (v > 0 && v < 20)
            {
                grd = "F";
            }
            else
            {
                grd = null;
            }
            return grd;
        }

        private String thcalc(double v)
        {
            String grd;
            if (v >= 60 && v <= 75)
            {
                grd = "O";
            }
            else if (v >= 52.5 && v < 60)
            {
                grd = "A+";
            }
            else if (v >= 45 && v < 52.5)
            {
                grd = "A";
            }
            else if (v >= 41.25 && v < 45)
            {
                grd = "B+";
            }
            else if (v >= 37.5 && v < 41.25)
            {
                grd = "B";
            }
            else if (v >= 33.75 && v < 37.5)
            {
                grd = "C";
            }
            else if (v >= 30 && v < 33.75)
            {
                grd = "D";
            }
            else if (v > 0 && v < 30)
            {
                grd = "F";
            }
            else
            {
                grd = null;
            }
            return grd;
        }

        private String intcalc(double v)
        {
            String grd;
            if (v >= 20 && v <= 25)
            {
                grd = "O";
            }
            else if (v >= 17.5 && v < 20)
            {
                grd = "A+";
            }
            else if (v >= 15 && v < 17.5)
            {
                grd = "A";
            }
            else if (v >= 13.75 && v < 15)
            {
                grd = "B+";
            }
            else if (v >= 12.5 && v < 13.75)
            {
                grd = "B";
            }
            else if (v >= 11.25 && v < 12.5)
            {
                grd = "C";
            }
            else if (v >= 10 && v < 11.25)
            {
                grd = "D";
            }
            else if (v > 0 && v < 10)
            {
                grd = "F";
            }
            else
            {
                grd = null;
            }
            return grd;
        }

        private int GradptCalc(String v)
        {
            int pt = 0;

            if (v.Equals("O"))
            {
                pt = 10;
            }
            else if (v.Equals("A+"))
            {
                pt = 9;
            }
            else if (v.Equals("A"))
            {
                pt = 8;
            }
            else if (v.Equals("B+"))
            {
                pt = 7;
            }
            else if (v.Equals("B"))
            {
                pt = 6;
            }
            else if (v.Equals("C"))
            {
                pt = 5;
            }
            else if (v.Equals("D"))
            {
                pt = 4;
            }
            else if (v.Equals("F"))
            {
                pt = 0;
            }


            return pt;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            try
            {


                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    if (conn.State == ConnectionState.Closed)
                        conn.Open();

                    SqlCommand sqlCmd = new SqlCommand("DeleteFromMarks", conn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@grno",Convert.ToInt32( GridView1.Rows[e.RowIndex].Cells[0].Text));// Convert.ToInt32(gr.Cells[0].Text));
                    sqlCmd.Parameters.AddWithValue("@clgcode", Session["clgCode"]);
                    sqlCmd.Parameters.AddWithValue("@subcode", Session["subcode"]);
                    sqlCmd.Parameters.AddWithValue("@clsid", Session["clsid"]);
                    sqlCmd.Parameters.AddWithValue("@sem", Session["sem"]);
                    sqlCmd.ExecuteNonQuery();
                    conn.Close();
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    sm.Text = "student Sucessfully Deleted";
                     fm.Text = "";
                }
            }
            // catch (Exception ex)
            //   {
            //      Panel2.Visible = true;
            //      flbl.Text = ex.Message.ToString();
            //  }

            //try
            //{
            //    using (SqlConnection conn = new SqlConnection(connectionString))
            //    {
            //        conn.Open();
            //        SqlCommand cmd = new SqlCommand("StudentDeleteByID", conn);
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        cmd.Parameters.AddWithValue("@GRno", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("GRno_Label") as Label).Text.Trim()));
            //        cmd.Parameters.AddWithValue("@Uid", Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("UidLabel") as Label).Text.Trim()));
            //        cmd.ExecuteNonQuery();
            //        populateGridView();
            //        
            //    }
            //}
            catch (Exception ex)
            {
                sm.Text = "";
                fm.Text = ex.Message;
            }
        }
    }
}