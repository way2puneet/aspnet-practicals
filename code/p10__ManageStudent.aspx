<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageStudent.aspx.cs" Inherits="StudentPortal.ManageStudent" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Students</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Manage Student Records</h2>
            <table>
                <tr>
                    <td>Roll No:</td>
                    <td>
                        <asp:TextBox ID="txtRollNo" runat="server" MaxLength="6"></asp:TextBox>
                        <asp:Button ID="btnFind" runat="server" Text="Find" CausesValidation="false" OnClick="btnFind_Click" />
                        <asp:RequiredFieldValidator ID="rfvRollNo" runat="server" ControlToValidate="txtRollNo"
                            ErrorMessage="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                            ErrorMessage="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Course:</td>
                    <td>
                        <asp:DropDownList ID="ddlCourse" runat="server">
                            <asp:ListItem>BCA</asp:ListItem>
                            <asp:ListItem>BSc IT</asp:ListItem>
                            <asp:ListItem>MCA</asp:ListItem>
                        </asp:DropDownList>
                        Semester:
                        <asp:DropDownList ID="ddlSemester" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server" MaxLength="30"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
                            ErrorMessage="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Marks:</td>
                    <td>
                        <asp:TextBox ID="txtMarks" runat="server" MaxLength="3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMarks" runat="server" ControlToValidate="txtMarks"
                            ErrorMessage="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvMarks" runat="server" ControlToValidate="txtMarks"
                            MinimumValue="0" MaximumValue="100" Type="Integer"
                            ErrorMessage="0 to 100 only" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CausesValidation="false"
                            OnClientClick="return confirm('Delete this record?');" OnClick="btnDelete_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" CausesValidation="false" OnClick="btnClear_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
            <br /><br />
            <asp:GridView ID="gvStudents" runat="server" CellPadding="5">
                <HeaderStyle BackColor="LightSteelBlue" Font-Bold="True" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
