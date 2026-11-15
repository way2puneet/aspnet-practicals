using System;

namespace StudentPortal
{
    public partial class DateSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                calDOB.VisibleDate = new DateTime(2006, 1, 1);
            }
        }

        protected void calDOB_SelectionChanged(object sender, EventArgs e)
        {
            DateTime dob = calDOB.SelectedDate;
            lblDate.Text = "Date of Birth: " + dob.ToString("dd MMMM yyyy") +
                " (" + dob.DayOfWeek + ")";
        }
    }
}
