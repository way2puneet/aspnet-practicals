using System;
using System.Web.UI.WebControls;

namespace StudentPortal
{
    public partial class StudentManager : System.Web.UI.Page
    {
        // The SqlDataSource does the actual insert, update, delete, sorting and paging.
        // The three handlers below only report what happened.

        protected void dvNewStudent_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                ShowMessage("Record not added. Fill every field, use a new roll number, " +
                            "and enter numbers for semester and marks (0 to 100).", false);
                e.ExceptionHandled = true;      // show our message instead of an error page
                e.KeepInInsertMode = true;      // keep the typed values on the screen
            }
            else
            {
                ShowMessage("New record added.", true);
            }
        }

        protected void gvStudents_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                ShowMessage("Record not updated. Semester must be a number and marks 0 to 100.", false);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else
            {
                ShowMessage("Record updated.", true);
            }
        }

        protected void gvStudents_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                ShowMessage("Record could not be deleted.", false);
                e.ExceptionHandled = true;
            }
            else
            {
                ShowMessage("Record deleted.", true);
            }
        }

        private void ShowMessage(string message, bool success)
        {
            lblMessage.ForeColor = success ? System.Drawing.Color.Green : System.Drawing.Color.Red;
            lblMessage.Text = message;
        }
    }
}
