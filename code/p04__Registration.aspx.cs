using System;

namespace StudentPortal
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string rollNo = txtRollNo.Text.Trim();

            if (name == "" || rollNo == "")
            {
                lblSummary.ForeColor = System.Drawing.Color.Red;
                lblSummary.Text = "Name and Roll Number are required.";
                return;
            }

            string gender = "Not selected";
            if (rbMale.Checked)
            {
                gender = "Male";
            }
            else if (rbFemale.Checked)
            {
                gender = "Female";
            }

            string facilities = "";
            if (chkHostel.Checked)
            {
                facilities += "Hostel ";
            }
            if (chkTransport.Checked)
            {
                facilities += "College Transport";
            }
            if (facilities == "")
            {
                facilities = "None";
            }

            lblSummary.ForeColor = System.Drawing.Color.Green;
            lblSummary.Text = "<b>Registration Successful</b><br />" +
                "Name: " + Server.HtmlEncode(name) + "<br />" +
                "Roll Number: " + Server.HtmlEncode(rollNo) + "<br />" +
                "Gender: " + gender + "<br />" +
                "Address: " + Server.HtmlEncode(txtAddress.Text.Trim()) + "<br />" +
                "Facilities: " + facilities;
        }
    }
}
