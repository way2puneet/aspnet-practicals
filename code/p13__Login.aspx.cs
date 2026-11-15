using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace StudentPortal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.IsAuthenticated && Request.QueryString["ReturnUrl"] != null)
            {
                lblMessage.Text = "You do not have permission to open the requested page. " + "Sign in with an account that has access.";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string userName = txtUserName.Text.Trim().ToLower();
            string salt = null, storedHash = null;

            string cs = ConfigurationManager.ConnectionStrings["CollegeDB"].ConnectionString;
            string sql = "SELECT PasswordSalt, PasswordHash FROM AppUser WHERE UserName = @UserName";

            using (SqlConnection con = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@UserName", userName);
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        salt = reader.GetString(0);
                        storedHash = reader.GetString(1);
                    }
                }
            }

            if (salt != null && PasswordHelper.VerifyPassword(txtPassword.Text, salt, storedHash))
            {
                FormsAuthentication.RedirectFromLoginPage(userName, chkRemember.Checked);
            }
            else
            {
                lblMessage.Text = "Invalid user name or password.";
            }
        }
    }
}
