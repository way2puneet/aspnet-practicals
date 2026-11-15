<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidatedRegistration.aspx.cs" Inherits="StudentPortal.ValidatedRegistration" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration with Validation</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Student Registration Form</h2>
            <asp:ValidationSummary ID="vsErrors" runat="server" ForeColor="Red"
                HeaderText="Please correct the following errors:" DisplayMode="BulletList" />
            <table>
                <tr>
                    <td>Name:</td>
                    <td><asp:TextBox ID="txtName" runat="server" MaxLength="40"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                            Text="*" ErrorMessage="Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Roll Number:</td>
                    <td><asp:TextBox ID="txtRollNo" runat="server" MaxLength="6"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvRollNo" runat="server" ControlToValidate="txtRollNo" Text="*" ErrorMessage="Roll number is required."
                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revRollNo" runat="server" ControlToValidate="txtRollNo" ValidationExpression="[A-Z]{3}\d{3}" Text="*"
                            ErrorMessage="Roll number must have three capital letters followed by three digits (e.g. BCA101)." ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Age:</td>
                    <td><asp:TextBox ID="txtAge" runat="server" MaxLength="2"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="txtAge"
                            Text="*" ErrorMessage="Age is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvAge" runat="server" ControlToValidate="txtAge" MinimumValue="17" MaximumValue="30" Type="Integer" Text="*"
                            ErrorMessage="Age must be a whole number from 17 to 30." ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td>Course:</td>
                    <td>
                        <asp:DropDownList ID="ddlCourse" runat="server">
                            <asp:ListItem Text="-- Select Course --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="BCA" Value="BCA"></asp:ListItem>
                            <asp:ListItem Text="BSc IT" Value="BSc IT"></asp:ListItem>
                            <asp:ListItem Text="MCA" Value="MCA"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvCourse" runat="server" ControlToValidate="ddlCourse"
                            InitialValue="0" Text="*" ErrorMessage="Please select a course." ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>E-mail:</td>
                    <td><asp:TextBox ID="txtEmail" runat="server" MaxLength="50"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                            Text="*" ErrorMessage="E-mail is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Text="*"
                            ErrorMessage="Enter a valid e-mail address." ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Mobile Number:</td>
                    <td><asp:TextBox ID="txtMobile" runat="server" MaxLength="10"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile"
                            Text="*" ErrorMessage="Mobile number is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile"
                            ValidationExpression="[6-9]\d{9}" Text="*"
                            ErrorMessage="Enter a valid 10-digit mobile number." ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                            Text="*" ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvPassword" runat="server" ControlToValidate="txtPassword"
                            OnServerValidate="cvPassword_ServerValidate" Text="*"
                            ErrorMessage="Password must have at least 8 characters, including a letter and a digit."
                            ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password:</td>
                    <td><asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox></td>
                    <td>
                        <asp:CompareValidator ID="cvConfirm" runat="server" ControlToValidate="txtConfirm"
                            ControlToCompare="txtPassword" Operator="Equal" Type="String" Text="*"
                            ErrorMessage="Passwords do not match." ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CausesValidation="false" OnClick="btnReset_Click" />
                    </td>
                    <td></td>
                </tr>
            </table>
            <br />
            <asp:Label ID="lblResult" runat="server" ForeColor="Green" Font-Bold="True"></asp:Label>
        </div>
    </form>
</body>
</html>
