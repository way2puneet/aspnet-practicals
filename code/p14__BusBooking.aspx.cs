using System;
using System.Web.UI.WebControls;

namespace StudentPortal
{
    public partial class BusBooking : System.Web.UI.Page
    {
        // Runs for every day cell while the calendar is drawn
        protected void calJourney_DayRender(object sender, DayRenderEventArgs e)
        {
            // Past dates and dates more than 30 days ahead cannot be booked
            if (e.Day.Date < DateTime.Today || e.Day.Date > DateTime.Today.AddDays(30))
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.LightGray;
            }
        }

        protected void calJourney_SelectionChanged(object sender, EventArgs e)
        {
            lblDate.Text = "Selected: " + calJourney.SelectedDate.ToString("dd MMM yyyy (dddd)");
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            pnlTicket.Visible = false;
            lblError.Text = "";

            if (!Page.IsValid)
            {
                return;
            }

            // A Calendar cannot be checked by a validator, so it is checked here
            if (calJourney.SelectedDate == DateTime.MinValue)
            {
                lblError.Text = "Please select the journey date from the calendar.";
                return;
            }

            int seats = int.Parse(ddlSeats.SelectedValue);
            int farePerSeat = int.Parse(rblBusType.SelectedValue);
            int total = seats * farePerSeat;
            int concession = chkStudent.Checked ? total * 10 / 100 : 0;
            int payable = total - concession;

            Random random = new Random();
            string pnr = "PNR" + random.Next(100000, 1000000);

            lblTicket.Text =
                "&nbsp;PNR: <b>" + pnr + "</b><br />" +
                "&nbsp;Passenger: " + Server.HtmlEncode(txtName.Text.Trim()) +
                " (" + txtMobile.Text + ")<br />" +
                "&nbsp;Route: " + ddlFrom.SelectedValue + " to " + ddlTo.SelectedValue + "<br />" +
                "&nbsp;Date: " + calJourney.SelectedDate.ToString("dd MMM yyyy (dddd)") + "<br />" +
                "&nbsp;Bus Type: " + rblBusType.SelectedItem.Text + "<br />" +
                "&nbsp;Fare: " + seats + " x Rs. " + farePerSeat + " = Rs. " + total + "<br />" +
                "&nbsp;Student Concession: Rs. " + concession + "<br />" +
                "&nbsp;<b>Amount Payable: Rs. " + payable + "</b><br /><br />";

            pnlTicket.Visible = true;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtMobile.Text = "";
            ddlFrom.SelectedIndex = 0;
            ddlTo.SelectedIndex = 0;
            calJourney.SelectedDates.Clear();
            lblDate.Text = "No date selected.";
            rblBusType.ClearSelection();
            ddlSeats.SelectedIndex = 0;
            chkStudent.Checked = false;
            lblError.Text = "";
            pnlTicket.Visible = false;
        }
    }
}
