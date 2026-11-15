<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="StudentPortal.Feedback" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Feedback Form</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Course Feedback Form</h2>

            Rate the course:
            <asp:RadioButton ID="rbExcellent" runat="server" Text="Excellent" GroupName="Rating" />
            <asp:RadioButton ID="rbGood" runat="server" Text="Good" GroupName="Rating" Checked="true" />
            <asp:RadioButton ID="rbAverage" runat="server" Text="Average" GroupName="Rating" />
            <br /><br />

            Comments:<br />
            <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Rows="4" Columns="40"
                AutoPostBack="True" OnTextChanged="txtComments_TextChanged"></asp:TextBox>
            <br />
            <asp:Label ID="lblCount" runat="server" Text="Characters typed: 0"></asp:Label>
            <br /><br />

            <asp:CheckBox ID="chkReply" runat="server" Text="I would like a reply by e-mail"
                AutoPostBack="True" OnCheckedChanged="chkReply_CheckedChanged" />
            <br />
            <asp:Panel ID="pnlEmail" runat="server" Visible="false">
                E-mail Address:
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="50"></asp:TextBox>
            </asp:Panel>
            <br />

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" OnClick="btnSubmit_Click" />
            <br /><br />
            <asp:Label ID="lblThanks" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>
