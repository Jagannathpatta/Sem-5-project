using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RB
{
    public partial class Hodsite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if (Session["Username"] == null)
               Response.Redirect("~/loginForm.aspx");

        }

        protected void LogOut(object sender, EventArgs e)
        {
            Session.Abandon();
            Server.Transfer("~/index.aspx");
        }
    }
}