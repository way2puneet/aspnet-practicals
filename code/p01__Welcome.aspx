<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="StudentPortal.Welcome" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Welcome Page</h2>
            Enter your name:
            <asp:TextBox ID="txtName" runat="server" MaxLength="40"></asp:TextBox>
            <asp:Button ID="btnShow" runat="server" Text="Show Message" OnClick="btnShow_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" Font-Bold="True"></asp:Label>
        </div>
    </form>
</body>
</html>
