using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RB
{
    public partial class ttt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //intern.Text = intcalc(Convert.ToDouble(intern.Text));
           // th.Text = thcalc(Convert.ToDouble(th.Text));
            //prcalc(Convert.ToDouble(intern.Text));
           th.Text = ovallcalc((Convert.ToDouble(intern.Text))+(Convert.ToDouble(th.Text)));
            intern.Text = Convert.ToString(GradptCalc(th.Text.ToString()));

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
            if (v>=60 && v<=75)
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
            int pt=0;
            
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
    }
}