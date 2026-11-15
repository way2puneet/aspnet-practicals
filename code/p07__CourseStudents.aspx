<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseStudents.aspx.cs" Inherits="StudentPortal.CourseStudents" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Students by Course</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Students by Course</h2>
            Course:
            <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True">
                <asp:ListItem>BCA</asp:ListItem>
                <asp:ListItem>BSc IT</asp:ListItem>
                <asp:ListItem>MCA</asp:ListItem>
            </asp:DropDownList>
            <br /><br />

            <asp:SqlDataSource ID="sdsStudents" runat="server"
                ConnectionString="<%$ ConnectionStrings:CollegeDB %>"
                SelectCommand="SELECT RollNo, StudentName, Semester, City, Marks FROM Student WHERE Course = @Course ORDER BY RollNo">
                <SelectParameters>
                    <asp:ControlParameter Name="Course" ControlID="ddlCourse" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="gvStudents" runat="server" DataSourceID="sdsStudents"
                CellPadding="5" EmptyDataText="No students found.">
                <HeaderStyle BackColor="LightSteelBlue" Font-Bold="True" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
