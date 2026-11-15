<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudentPortal.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Student Portal Login</h2>
            <table>
                <tr>
                    <td>User Name:</td>
                    <td><asp:TextBox ID="txtUserName" runat="server" MaxLength="30"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUserName" runat="server"
                            ControlToValidate="txtUserName" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Required" ForeColor="Red">
                    </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:CheckBox ID="chkRemember" runat="server" Text="Remember me on this computer" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /></td>
                </tr>
            </table>
            <br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
