<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="StudentPortal.Dashboard" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Student Portal Dashboard</h2>
            <asp:Label ID="lblWelcome" runat="server" Font-Bold="True"></asp:Label>
            <br /><br />
            <asp:HyperLink ID="lnkReports" runat="server" NavigateUrl="~/Admin/Reports.aspx"
                Text="Course Reports (Administrator)"></asp:HyperLink>
            <br /><br />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </div>
    </form>
</body>
</html>
