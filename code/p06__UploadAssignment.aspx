<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadAssignment.aspx.cs" Inherits="StudentPortal.UploadAssignment" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload Assignment</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Assignment Submission</h2>
            Roll Number:
            <asp:TextBox ID="txtRollNo" runat="server" MaxLength="6"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvRollNo" runat="server" ControlToValidate="txtRollNo" ErrorMessage="Roll number is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revRollNo" runat="server" ControlToValidate="txtRollNo"
                ValidationExpression="[A-Z]{3}\d{3}" ErrorMessage="Enter a roll number such as BCA101."
                ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
            <br /><br />
            Assignment File (PDF or Word, maximum 2 MB):
            <asp:FileUpload ID="fuAssignment" runat="server" />
            <br /><br />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
