using System;

namespace StudentPortal
{
    public partial class HtmlControlsDemo : System.Web.UI.Page
    {
        protected void btnSubmit_ServerClick(object sender, EventArgs e)
        {
            string name = txtStudent.Value.Trim();

            if (name == "")
            {
                spnResult.InnerText = "Please enter your name.";
                spnResult.Style["color"] = "red";
                return;
            }

            string card = chkLibrary.Checked ? "Yes" : "No";
            string city = selCity.Items[selCity.SelectedIndex].Text;

            spnResult.InnerText = "Name: " + name +
                " | Library Card: " + card +
                " | City: " + city +
                " (Code: " + selCity.Value + ")";
            spnResult.Style["color"] = "green";
        }
    }
}
