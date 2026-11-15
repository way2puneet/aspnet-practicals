<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="StudentPortal.Admin.Reports" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course Reports</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Course Reports (Administrator)</h2>
            <asp:SqlDataSource ID="sdsReport" runat="server"
                ConnectionString="<%$ ConnectionStrings:CollegeDB %>"
                SelectCommand="SELECT Course, COUNT(*) AS Students, AVG(Marks) AS AverageMarks FROM Student GROUP BY Course ORDER BY Course">
            </asp:SqlDataSource>
            <asp:GridView ID="gvReport" runat="server" DataSourceID="sdsReport" CellPadding="5">
                <HeaderStyle BackColor="LightSteelBlue" Font-Bold="True" />
            </asp:GridView>
            <br />
            <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Dashboard.aspx" Text="Back to Dashboard"></asp:HyperLink>
        </div>
    </form>
</body>
</html>
