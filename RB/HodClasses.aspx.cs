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
    public partial class WebForm4 : System.Web.UI.Page
    {
       
        
        SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=ResultsBuilder;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
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
            String ay = "" + clsyr.SelectedItem.ToString() + " " + yr.SelectedItem.ToString() +" - " + (Convert.ToInt32(yr.SelectedItem.ToString())+1)+"";
            txtAY.Text = ay;

        }
        //protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
           
            
        //    List<DropDownList> ddl = new List<DropDownList>();
        //    ddl.Add(DDLteachers1);
        //    ddl.Add(DDLteachers2);
        //    ddl.Add(DDLteachers3);
        //    ddl.Add(DDLteachers4);
        //    ddl.Add(DDLteachers5);
        //    ddl.Add(DDLteachers6);
        //    ddl.Add(DDLteachers7);

        //    for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        //    {
        //        if (CheckBoxList1.Items[i].Selected)
        //        {
        //            ddl[i].Enabled = true;
                   
        //            ADDClass(ddl[i]);

        //        }
        //        else
        //            ddl[i].Enabled = false;
        //    }
        //}

        public void clear()
        {
            txtCid.Text = txtAY.Text = "";
            sem.SelectedIndex = -1;
            clsyr.SelectedIndex = yr.SelectedIndex = -1;
            RadioButtonList1.SelectedIndex = DropDownList1.SelectedIndex = -1;
            btnSave.Text = "Save";
            Panel1.Visible = true;
            Panel2.Visible = false;
            btnDelete.Enabled = false;
            susTxt.Text = failTxt.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            int count= 1;
            if (btnSave.Text.Equals("Save"))
            {
                string query = "SELECT COUNT(1) FROM Classes WHERE year=@year AND subCode =@sc AND  collegeCode=@clgcode ";
                SqlCommand sqlcmd = new SqlCommand(query, connection);
                sqlcmd.Parameters.AddWithValue("@year", txtAY.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@sc", RadioButtonList1.SelectedValue);
                sqlcmd.Parameters.AddWithValue("@clgcode", Session["clgCode"]);
                //sqlcmd.Parameters.AddWithValue("@clsid", (HiddenField1.Value == "" ? 0 : Convert.ToInt32(HiddenField1.Value)));


                count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            }
            
            if(count == 0)
            {
                adddata(RadioButtonList1.SelectedValue.ToString());
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
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        void adddata(String Subcode)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            SqlCommand sqlCmd = new SqlCommand("classCreateOrUpdate", connection);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@classID", (HiddenField1.Value == "" ? 0 : Convert.ToInt32(HiddenField1.Value)));
            sqlCmd.Parameters.AddWithValue("@year", txtAY.Text);
            sqlCmd.Parameters.AddWithValue("@deptID", Session["depId"]);
            sqlCmd.Parameters.AddWithValue("@sem", sem.SelectedValue);
            sqlCmd.Parameters.AddWithValue("@Tid", Convert.ToInt32( DropDownList1.SelectedValue));
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

        //protected void btnview_Click(object sender , EventArgs e)
        //{

        //        string[] arg = new string[3];
        //        arg = ((LinkButton)sender).CommandArgument.ToString().Split(';');
        //        //Convert.ToInt32((sender as LinkButton).CommandArgument);
        //        int deptid = Convert.ToInt32(arg[0]);
        //        string subcode = arg[1];
        //        int classid = Convert.ToInt32(arg[2]);
        //        if (connection.State == ConnectionState.Closed)
        //            connection.Open();

        //        SqlDataAdapter sqlCmd = new SqlDataAdapter("classViewById", connection);
        //        sqlCmd.SelectCommand.CommandType = CommandType.StoredProcedure;
        //        sqlCmd.SelectCommand.Parameters.AddWithValue("@classID", classid);
        //        sqlCmd.SelectCommand.Parameters.AddWithValue("@subCode", subcode);
        //        DataTable dtb1 = new DataTable();
        //        sqlCmd.Fill(dtb1);
        //        connection.Close();
        //        txtDeptId.Text = dtb1.Rows[0]["classID"].ToString();
        //        txtyear.Text = dtb1.Rows[0]["year"].ToString();
        //        sem.Items.FindByValue(dtb1.Rows[0]["sem"].ToString()).Selected = true;
        //        DDLteachers.Items.FindByValue(dtb1.Rows[0]["Tid"].ToString()).Selected = true;
        //        btnSave.Text = "Update";
        //        btnDelete.Enabled = true;


        //}

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
            }catch(Exception ex)
            {
                failTxt.Text = ex.Message.ToString();
            }
            Page.Response.Redirect(Page.Request.Url.ToString(), true);

        }

        protected void grid_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = grid.SelectedRow;
            txtCid.Text = gr.Cells[0].Text;
            txtAY.Text = gr.Cells[1].Text;
            HiddenField1.Value = gr.Cells[0].Text;
            sem.SelectedValue = gr.Cells[2].Text;
            clsyr.Enabled = false;
            yr.Enabled = false;
            Panel1.Visible = false;
            Panel2.Visible = true;
            txtsubcode.Text = gr.Cells[3].Text;
            txtsub.Text = gr.Cells[4].Text;
            DropDownList1.SelectedIndex = -1;
            DropDownList1.Items.FindByText(gr.Cells[5].Text).Selected = true;
           // DropDownList1.SelectedItem.Text = gr.Cells[5].Text;
            btnSave.Text = "Update";
            btnDelete.Enabled = true;
        }



        //protected void DDLteachers1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ADDClass(DDLteachers1);
        //}

        //protected void DDLteachers2_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ADDClass(DDLteachers2);
        //}

        //protected void DDLteachers3_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ADDClass(DDLteachers3);
        //}

        //protected void DDLteachers4_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ADDClass(DDLteachers4);
        //}

        //protected void DDLteachers5_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ADDClass(DDLteachers5);
        //}

        //protected void DDLteachers6_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ADDClass(DDLteachers6);
        //}

        //protected void DDLteachers7_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ADDClass(DDLteachers7);
        //}

        //protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //   if (e.CommandName == "View")
        //    {
        // int deptid = Convert.ToInt32(e.CommandArgument.ToString());

        //string subcode = arg[1];
        // int classid = Convert.ToInt32(arg[2]);
        //if (connection.State == ConnectionState.Closed)
        //    connection.Open();

        //SqlDataAdapter sqlCmd = new SqlDataAdapter("classViewById", connection);
        //sqlCmd.SelectCommand.CommandType = CommandType.StoredProcedure;
        //sqlCmd.SelectCommand.Parameters.AddWithValue("@classID", classid);
        //sqlCmd.SelectCommand.Parameters.AddWithValue("@subCode", subcode);
        //DataTable dtb1 = new DataTable();
        //sqlCmd.Fill(dtb1);
        //connection.Close();
        //txtDeptId.Text = dtb1.Rows[0]["classID"].ToString();
        //txtyear.Text = dtb1.Rows[0]["year"].ToString();
        //sem.Items.FindByValue(dtb1.Rows[0]["sem"].ToString()).Selected = true;
        //DDLteachers.Items.FindByValue(dtb1.Rows[0]["Tid"].ToString()).Selected = true;
        //btnSave.Text = "Update";
        //btnDelete.Enabled = true;
        // }
        // }
    }
}