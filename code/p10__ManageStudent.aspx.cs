using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace StudentPortal
{
    public partial class ManageStudent : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["CollegeDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        // Shows all records in the grid, so every change can be seen at once
        private void BindGrid()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT RollNo, StudentName, Course, Semester, City, Marks FROM Student ORDER BY RollNo", cs);
            DataTable table = new DataTable();
            da.Fill(table);
            gvStudents.DataSource = table;
            gvStudents.DataBind();
        }

        // Runs an INSERT, UPDATE or DELETE statement and returns the number of rows changed
        private int Execute(string sql, bool allFields)
        {
            using (SqlConnection con = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@RollNo", txtRollNo.Text.Trim().ToUpper());
                if (allFields)
                {
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Course", ddlCourse.SelectedValue);
                    cmd.Parameters.AddWithValue("@Semester", int.Parse(ddlSemester.SelectedValue));
                    cmd.Parameters.AddWithValue("@City", txtCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@Marks", int.Parse(txtMarks.Text));
                }
                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            try
            {
                Execute("INSERT INTO Student (RollNo, StudentName, Course, Semester, City, Marks) " +
                        "VALUES (@RollNo, @Name, @Course, @Semester, @City, @Marks)", true);
                ShowMessage("Record inserted successfully.", true);
                BindGrid();
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627 || ex.Number == 2601)
                {
                    ShowMessage("A student with this roll number already exists.", false);
                }
                else
                {
                    ShowMessage("The record could not be saved.", false);
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            int rows = Execute("UPDATE Student SET StudentName = @Name, Course = @Course, " +
                               "Semester = @Semester, City = @City, Marks = @Marks " +
                               "WHERE RollNo = @RollNo", true);

            if (rows == 1)
            {
                ShowMessage("Record updated successfully.", true);
                BindGrid();
            }
            else
            {
                ShowMessage("No student found with this roll number.", false);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (txtRollNo.Text.Trim() == "")
            {
                ShowMessage("Enter the roll number of the record to delete.", false);
                return;
            }

            int rows = Execute("DELETE FROM Student WHERE RollNo = @RollNo", false);

            if (rows == 1)
            {
                ShowMessage("Record deleted successfully.", true);
                ClearFields();
                BindGrid();
            }
            else
            {
                ShowMessage("No student found with this roll number.", false);
            }
        }

        // Loads an existing record into the form, ready for Update or Delete
        protected void btnFind_Click(object sender, EventArgs e)
        {
            string rollNo = txtRollNo.Text.Trim().ToUpper();
            if (rollNo == "")
            {
                ShowMessage("Enter a roll number to find.", false);
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand(
                "SELECT StudentName, Course, Semester, City, Marks FROM Student WHERE RollNo = @RollNo", con))
            {
                cmd.Parameters.AddWithValue("@RollNo", rollNo);
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        txtName.Text = reader["StudentName"].ToString();
                        ddlCourse.SelectedValue = reader["Course"].ToString();
                        ddlSemester.SelectedValue = reader["Semester"].ToString();
                        txtCity.Text = reader["City"].ToString();
                        txtMarks.Text = reader["Marks"].ToString();
                        ShowMessage("Record found. Change the values and click Update, or click Delete.", true);
                    }
                    else
                    {
                        ShowMessage("No student found with this roll number.", false);
                    }
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearFields();
            lblMessage.Text = "";
        }

        private void ClearFields()
        {
            txtRollNo.Text = "";
            txtName.Text = "";
            ddlCourse.SelectedIndex = 0;
            ddlSemester.SelectedIndex = 0;
            txtCity.Text = "";
            txtMarks.Text = "";
        }

        private void ShowMessage(string message, bool success)
        {
            lblMessage.ForeColor = success ? System.Drawing.Color.Green : System.Drawing.Color.Red;
            lblMessage.Text = message;
        }
    }
}
