<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentManager.aspx.cs" Inherits="StudentPortal.StudentManager" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Manager</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Student Manager</h2>

            <!-- One data source does all the database work for both controls -->
            <asp:SqlDataSource ID="sdsStudents" runat="server"
                ConnectionString="<%$ ConnectionStrings:CollegeDB %>"
                SelectCommand="SELECT StudentID, RollNo, StudentName, Course, Semester, City, Marks FROM Student"
                InsertCommand="INSERT INTO Student (RollNo, StudentName, Course, Semester, City, Marks) VALUES (@RollNo, @StudentName, @Course, @Semester, @City, @Marks)"
                UpdateCommand="UPDATE Student SET StudentName = @StudentName, Course = @Course, Semester = @Semester, City = @City, Marks = @Marks WHERE StudentID = @StudentID"
                DeleteCommand="DELETE FROM Student WHERE StudentID = @StudentID">
                <InsertParameters>
                    <asp:Parameter Name="RollNo" Type="String" />
                    <asp:Parameter Name="StudentName" Type="String" />
                    <asp:Parameter Name="Course" Type="String" />
                    <asp:Parameter Name="Semester" Type="Int32" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Marks" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StudentName" Type="String" />
                    <asp:Parameter Name="Course" Type="String" />
                    <asp:Parameter Name="Semester" Type="Int32" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Marks" Type="Int32" />
                    <asp:Parameter Name="StudentID" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="StudentID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>

            <!-- GridView: view, sort, page, edit and delete -->
            <asp:GridView ID="gvStudents" runat="server" DataSourceID="sdsStudents" DataKeyNames="StudentID"
                AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="4"
                CellPadding="5" OnRowUpdated="gvStudents_RowUpdated" OnRowDeleted="gvStudents_RowDeleted">
                <HeaderStyle BackColor="LightSteelBlue" Font-Bold="True" />
                <EditRowStyle BackColor="LightYellow" />
                <Columns>
                    <asp:BoundField DataField="RollNo" HeaderText="Roll No" SortExpression="RollNo" ReadOnly="True" />
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                    <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
                    <asp:BoundField DataField="Semester" HeaderText="Semester" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="Marks" HeaderText="Marks" SortExpression="Marks" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <br />

            <!-- DetailsView: insert a new record -->
            <h3>Add a New Student</h3>
            <asp:DetailsView ID="dvNewStudent" runat="server" DataSourceID="sdsStudents"
                DefaultMode="Insert" AutoGenerateRows="False" CellPadding="5"
                OnItemInserted="dvNewStudent_ItemInserted">
                <Fields>
                    <asp:BoundField DataField="RollNo" HeaderText="Roll No" />
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                    <asp:BoundField DataField="Course" HeaderText="Course" />
                    <asp:BoundField DataField="Semester" HeaderText="Semester" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:BoundField DataField="Marks" HeaderText="Marks" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <br />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
        </div>
    </form>
</body>
</html>
