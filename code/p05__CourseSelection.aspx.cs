using System;
using System.Web.UI.WebControls;

namespace StudentPortal
{
    public partial class CourseSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCourse.Items.Add(new ListItem("-- Select Course --", ""));
                ddlCourse.Items.Add(new ListItem("BCA", "BCA"));
                ddlCourse.Items.Add(new ListItem("MCA", "MCA"));
            }
        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            lstSubjects.Items.Clear();

            if (ddlCourse.SelectedValue == "BCA")
            {
                lstSubjects.Items.Add("Programming in C");
                lstSubjects.Items.Add("Programming in ASP.NET");
                lstSubjects.Items.Add("Database Management Systems");
                lstSubjects.Items.Add("Computer Networks");
            }
            else if (ddlCourse.SelectedValue == "MCA")
            {
                lstSubjects.Items.Add("Advanced Web Programming");
                lstSubjects.Items.Add("Data Mining");
                lstSubjects.Items.Add("Software Engineering");
                lstSubjects.Items.Add("Cloud Computing");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlCourse.SelectedIndex == 0 || rblSemester.SelectedIndex == -1)
            {
                lblSummary.Text = "Please select a course and a semester.";
                return;
            }

            string subjects = "";
            foreach (int index in lstSubjects.GetSelectedIndices())
            {
                subjects += "<br />&nbsp;&nbsp;- " + lstSubjects.Items[index].Text;
            }

            if (subjects == "")
            {
                subjects = " None";
            }

            lblSummary.Text = "Course: " + ddlCourse.SelectedItem.Text +
                "<br />Semester: " + rblSemester.SelectedValue +
                "<br />Selected Subjects:" + subjects;
        }
    }
}
