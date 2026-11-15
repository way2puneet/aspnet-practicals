using System;
using System.IO;
using System.Xml;

namespace StudentPortal
{
    public partial class XmlWriterDemo : System.Web.UI.Page
    {
        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/App_Data/Courses.xml");

            string[] codes = { "BCA", "BSc IT", "MCA" };
            string[] names = { "Bachelor of Computer Applications",
                    "B.Sc. Information Technology",
                    "Master of Computer Applications" };
            int[] years = { 3, 3, 2 };
            int[] fees = { 45000, 40000, 60000 };

            XmlWriterSettings settings = new XmlWriterSettings();
            settings.Indent = true;

            using (XmlWriter writer = XmlWriter.Create(path, settings))
            {
                writer.WriteStartDocument();
                writer.WriteComment("Courses offered by the college");
                writer.WriteStartElement("Courses");

                for (int i = 0; i < codes.Length; i++)
                {
                    writer.WriteStartElement("Course");
                    writer.WriteAttributeString("Code", codes[i]);
                    writer.WriteElementString("Name", names[i]);
                    writer.WriteElementString("DurationYears", years[i].ToString());
                    writer.WriteElementString("AnnualFee", fees[i].ToString());
                    writer.WriteEndElement();     // </Course>
                }

                writer.WriteEndElement();         // </Courses>
                writer.WriteEndDocument();
            }

            lblMessage.Text = "Courses.xml created with " + codes.Length + " courses.";
            litXml.Text = File.ReadAllText(path);
        }
    }
}
