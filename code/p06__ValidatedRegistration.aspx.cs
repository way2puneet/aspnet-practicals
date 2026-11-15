using System;
using System.Web.UI.WebControls;

namespace StudentPortal
{
    public partial class ValidatedRegistration : System.Web.UI.Page
    {
        protected void cvPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string password = args.Value;
            bool hasLetter = false, hasDigit = false;

            foreach (char ch in password)
            {
                if (char.IsLetter(ch)) hasLetter = true;
                if (char.IsDigit(ch)) hasDigit = true;
            }

            args.IsValid = password.Length >= 8 && hasLetter && hasDigit;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblResult.Text = "";
                return;
            }

            lblResult.Text = "Registration successful for " + Server.HtmlEncode(txtName.Text.Trim()) +
                " (Roll No. " + txtRollNo.Text + ", " + ddlCourse.SelectedValue + ").";
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtRollNo.Text = "";
            txtAge.Text = "";
            ddlCourse.SelectedIndex = 0;
            txtEmail.Text = "";
            txtMobile.Text = "";
            lblResult.Text = "";
        }
    }
}
