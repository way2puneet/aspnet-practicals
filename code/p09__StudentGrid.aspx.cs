using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace StudentPortal
{
    public partial class StudentGrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid("");
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            BindGrid("");
        }

        private void BindGrid(string nameFilter)
        {
            string cs = ConfigurationManager.ConnectionStrings["CollegeDB"].ConnectionString;
            string sql = "SELECT StudentID, RollNo, StudentName, Course, Semester, City, Marks " + "FROM Student WHERE StudentName LIKE @Name ORDER BY StudentName";

            using (SqlConnection con = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@Name", "%" + nameFilter + "%");

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                da.Fill(table);
                gvStudents.DataSource = table;
                gvStudents.DataBind();

                lblCount.Text = "Records found: " + table.Rows.Count;
            }
        }
    }
}
