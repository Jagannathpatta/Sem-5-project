using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RB
{
    public partial class test3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            //Int32 tid = Convert.ToInt32(gr.Cells[0].Text);
            TextBox1.Text = gr.Cells[0].Text;
            //TextBox2.Text = gr.Cells[1].Text;
            //TextBox3.Text = gr.Cells[2].Text;
            //TextBox4.Text = gr.Cells[3].Text;
            //TextBox5.Text = gr.Cells[4].Text;
            TextBox6.Text = gr.Cells[5].Text;
            
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<DropDownList> ddl = new List<DropDownList>();
            ddl.Add(DDLteachers1);
            ddl.Add(DDLteachers2);
            ddl.Add(DDLteachers3);
            ddl.Add(DDLteachers4);
            ddl.Add(DDLteachers5);
            ddl.Add(DDLteachers6);
            ddl.Add(DDLteachers7);

            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    ddl[i].Visible = true;
                }
                else
                    ddl[i].Visible = false;
            }
        }
    }
}