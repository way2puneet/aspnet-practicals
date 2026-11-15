<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentGrid.aspx.cs" Inherits="StudentPortal.StudentGrid" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Records</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Student Records</h2>
            Search by name:
            <asp:TextBox ID="txtSearch" runat="server" MaxLength="50"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            <asp:Button ID="btnShowAll" runat="server" Text="Show All" OnClick="btnShowAll_Click" />
            <br /><br />

            <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False"
                DataKeyNames="StudentID" CellPadding="5" EmptyDataText="No matching students found.">
                <HeaderStyle BackColor="Navy" ForeColor="White" Font-Bold="True" />
                <AlternatingRowStyle BackColor="#EEEEEE" />
                <Columns>
                    <asp:BoundField DataField="RollNo" HeaderText="Roll No" />
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                    <asp:BoundField DataField="Course" HeaderText="Course" />
                    <asp:BoundField DataField="Semester" HeaderText="Semester" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:BoundField DataField="Marks" HeaderText="Marks" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="lblCount" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
