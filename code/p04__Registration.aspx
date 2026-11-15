<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="StudentPortal.Registration" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Student Registration Form</h2>
            <table>
                <tr>
                    <td>Student Name:</td>
                    <td><asp:TextBox ID="txtName" runat="server" MaxLength="40"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Roll Number:</td>
                    <td><asp:TextBox ID="txtRollNo" runat="server" MaxLength="10"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>
                        <asp:RadioButton ID="rbMale" runat="server" Text="Male" GroupName="Gender" />
                        <asp:RadioButton ID="rbFemale" runat="server" Text="Female" GroupName="Gender" />
                    </td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" Columns="30"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Facilities:</td>
                    <td>
                        <asp:CheckBox ID="chkHostel" runat="server" Text="Hostel" />
                        <asp:CheckBox ID="chkTransport" runat="server" Text="College Transport" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" /></td>
                </tr>
            </table>
            <br />
            <asp:Label ID="lblSummary" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
