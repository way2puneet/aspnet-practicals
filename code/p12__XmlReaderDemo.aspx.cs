using System;
using System.Text;
using System.Web;
using System.Xml;

namespace StudentPortal
{
    public partial class XmlReaderDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/App_Data/Students.xml");
            StringBuilder html = new StringBuilder();
            html.Append("<table border='1' cellpadding='5'>");
            html.Append("<tr><th>Roll No</th><th>Name</th><th>Course</th><th>City</th><th>Marks</th></tr>");

            XmlReaderSettings settings = new XmlReaderSettings();
            settings.IgnoreWhitespace = true;
            settings.IgnoreComments = true;

            string currentElement = "";
            string rollNo = "", name = "", course = "", city = "", marks = "";
            int count = 0;

            using (XmlReader reader = XmlReader.Create(path, settings))
            {
                while (reader.Read())
                {
                    if (reader.NodeType == XmlNodeType.Element)
                    {
                        currentElement = reader.Name;
                        if (currentElement == "Student")
                        {
                            rollNo = reader.GetAttribute("RollNo");
                        }
                    }
                    else if (reader.NodeType == XmlNodeType.Text)
                    {
                        switch (currentElement)
                        {
                            case "Name": name = reader.Value; break;
                            case "Course": course = reader.Value; break;
                            case "City": city = reader.Value; break;
                            case "Marks": marks = reader.Value; break;
                        }
                    }
                    else if (reader.NodeType == XmlNodeType.EndElement && reader.Name == "Student")
                    {
                        html.Append("<tr><td>" + HttpUtility.HtmlEncode(rollNo) + "</td><td>" +
                            HttpUtility.HtmlEncode(name) + "</td><td>" +
                            HttpUtility.HtmlEncode(course) + "</td><td>" +
                            HttpUtility.HtmlEncode(city) + "</td><td>" +
                            HttpUtility.HtmlEncode(marks) + "</td></tr>");
                        count++;
                    }
                }
            }

            html.Append("</table><p>Students read: " + count + "</p>");
            litStudents.Text = html.ToString();
        }
    }
}
