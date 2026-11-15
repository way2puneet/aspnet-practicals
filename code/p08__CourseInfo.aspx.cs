using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace StudentPortal
{
    public partial class CourseInfo : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["CollegeDB"].ConnectionString;

        // These values are shown on the page through <%# %> expressions
        protected string CourseName = "";
        protected int Duration = 0;
        protected decimal AnnualFee = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT CourseCode, CourseName FROM Course ORDER BY CourseCode", cs);
                DataTable courses = new DataTable();
                da.Fill(courses);

                // List binding: one list item for each row of the table
                ddlCourse.DataSource = courses;
                ddlCourse.DataTextField = "CourseName";     // shown to the user
                ddlCourse.DataValueField = "CourseCode";    // returned by SelectedValue
                ddlCourse.DataBind();

                ddlCourse.Items.Insert(0, new ListItem("-- Select Course --", ""));
            }
        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            string code = ddlCourse.SelectedValue;
            if (code == "")
            {
                pnlDetails.Visible = false;
                return;
            }

            // 1. Read the selected course into the three fields
            using (SqlConnection con = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand(
                "SELECT CourseName, DurationYears, AnnualFee FROM Course WHERE CourseCode = @Code", con))
            {
                cmd.Parameters.AddWithValue("@Code", code);
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        CourseName = reader.GetString(0);
                        Duration = reader.GetInt32(1);
                        AnnualFee = reader.GetDecimal(2);
                    }
                }
            }

            // 2. Read the students of the course into a table
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT RollNo, StudentName FROM Student WHERE Course = @Code ORDER BY StudentName", cs);
            da.SelectCommand.Parameters.AddWithValue("@Code", code);
            DataTable students = new DataTable();
            da.Fill(students);

            lstStudents.DataSource = students;
            lstStudents.DataTextField = "StudentName";
            lstStudents.DataValueField = "RollNo";

            // 3. One call binds everything inside the panel:
            //    the three labels (simple binding) and the list box (list binding)
            pnlDetails.Visible = true;
            pnlDetails.DataBind();

            lblCount.Text = "Total students: " + students.Rows.Count;
        }
    }
}
