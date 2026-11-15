using System;

namespace StudentPortal
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void txtComments_TextChanged(object sender, EventArgs e)
        {
            lblCount.Text = "Characters typed: " + txtComments.Text.Length;
        }

        protected void chkReply_CheckedChanged(object sender, EventArgs e)
        {
            pnlEmail.Visible = chkReply.Checked;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string rating = "Good";
            if (rbExcellent.Checked)
            {
                rating = "Excellent";
            }
            else if (rbAverage.Checked)
            {
                rating = "Average";
            }

            string message = "Thank you for your feedback. Your rating: " + rating + ".";

            if (chkReply.Checked && txtEmail.Text.Trim() != "")
            {
                message += " A reply will be sent to " + Server.HtmlEncode(txtEmail.Text.Trim()) + ".";
            }

            lblThanks.Text = message;
        }
    }
}
