using System;
using System.IO;

namespace StudentPortal
{
    public partial class UploadAssignment : System.Web.UI.Page
    {
        private const int MaxFileSize = 2 * 1024 * 1024;     // 2 MB in bytes
        private readonly string[] allowedExtensions = { ".pdf", ".doc", ".docx" };

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            if (!Page.IsValid)
            {
                return;
            }

            if (!fuAssignment.HasFile)
            {
                ShowMessage("Please select a file to upload.", false);
                return;
            }

            string originalName = Path.GetFileName(fuAssignment.FileName);
            string extension = Path.GetExtension(originalName).ToLower();

            if (Array.IndexOf(allowedExtensions, extension) < 0)
            {
                ShowMessage("Only PDF and Word files (.pdf, .doc, .docx) are allowed.", false);
                return;
            }

            int size = fuAssignment.PostedFile.ContentLength;
            if (size > MaxFileSize)
            {
                ShowMessage("The file is larger than 2 MB. Please upload a smaller file.", false);
                return;
            }

            string folder = Server.MapPath("~/App_Data/Uploads");
            string savedName = txtRollNo.Text.Trim() + extension;

            try
            {
                Directory.CreateDirectory(folder);
                fuAssignment.SaveAs(Path.Combine(folder, savedName));

                ShowMessage("Assignment uploaded successfully.<br />" +
                    "Original file: " + Server.HtmlEncode(originalName) + "<br />" + "Saved as: " + savedName + "<br />" +
                    "Size: " + (size / 1024.0).ToString("0.0") + " KB", true);
            }
            catch (Exception ex)
            {
                ShowMessage("The file could not be saved: " + Server.HtmlEncode(ex.Message), false);
            }
        }

        private void ShowMessage(string message, bool success)
        {
            lblMessage.ForeColor = success ? System.Drawing.Color.Green : System.Drawing.Color.Red;
            lblMessage.Text = message;
        }
    }
}
