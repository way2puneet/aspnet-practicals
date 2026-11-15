using System;

namespace StudentPortal
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected void btnShow_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();

            if (name == "")
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter your name.";
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Welcome, " + Server.HtmlEncode(name) +
                    "! You have successfully created your first Web Form.";
            }
        }
    }
}
