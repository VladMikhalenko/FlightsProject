using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class masterPages_GlobalMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] == null)
        {
            lbUser.Text = "Гость";
            btnLogout.Text = "Войти";
            Menu2.Visible = false;
            Menu1.DataSourceID = "SiteMapDataSource1";
        }
        else
        {
            if (Convert.ToInt32(Session["Role"]) != 3)
                Menu2.Visible = false;
            else Menu2.Visible = true;

            lbUser.Text = Convert.ToString(Session["Login"]);
            btnLogout.Text = "Выйти";
            
            Menu1.DataSourceID = "SiteMapDataSource3";
        }

    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        if (Session["Login"] == null)
            Response.Redirect("LoginPage.aspx");
        else
        {
            Session.RemoveAll();
            Response.Redirect("FlightsPage.aspx");
        }
            
    }
}
