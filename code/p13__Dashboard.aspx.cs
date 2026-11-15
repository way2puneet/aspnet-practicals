using System;
using System.Web;
using System.Web.Security;

namespace StudentPortal
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblWelcome.Text = "Welcome, " + HttpUtility.HtmlEncode(User.Identity.Name) +
                "! You are signed in.";

            // Showing the link only to the administrator is a convenience;
            // the Admin folder is protected by the rules in Web.config.
            lnkReports.Visible = (User.Identity.Name == "admin");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}
