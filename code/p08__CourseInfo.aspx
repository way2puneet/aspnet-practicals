<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseInfo.aspx.cs" Inherits="StudentPortal.CourseInfo" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course Information</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Course Information</h2>
            Select Course:
            <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True"
                OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
            </asp:DropDownList>
            <br /><br />

            <asp:Panel ID="pnlDetails" runat="server" Visible="false">
                Course Name:
                <asp:Label ID="lblName" runat="server" Font-Bold="True" Text='<%# CourseName %>'></asp:Label>
                <br />
                Duration:
                <asp:Label ID="lblDuration" runat="server" Text='<%# Duration + " years" %>'></asp:Label>
                <br />
                Annual Fee:
                <asp:Label ID="lblFee" runat="server" Text='<%# "Rs. " + AnnualFee.ToString("N0") %>'></asp:Label>
                <br /><br />
                Students in this course:<br />
                <asp:ListBox ID="lstStudents" runat="server" Rows="4" Width="250px"></asp:ListBox>
                <br />
                <asp:Label ID="lblCount" runat="server"></asp:Label>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
