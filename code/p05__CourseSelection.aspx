<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseSelection.aspx.cs" Inherits="StudentPortal.CourseSelection" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course Selection</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Course Selection Form</h2>
            Course:
            <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True"
                OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
            </asp:DropDownList>
            <br /><br />
            Semester:
            <asp:RadioButtonList ID="rblSemester" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="1">Semester 1</asp:ListItem>
                <asp:ListItem Value="3">Semester 3</asp:ListItem>
                <asp:ListItem Value="5">Semester 5</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Subjects (hold Ctrl to select more than one):<br />
            <asp:ListBox ID="lstSubjects" runat="server" SelectionMode="Multiple" Rows="4" Width="250px"></asp:ListBox>
            <br /><br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            <br /><br />
            <asp:Label ID="lblSummary" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
