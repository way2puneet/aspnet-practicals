<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XmlWriterDemo.aspx.cs" Inherits="StudentPortal.XmlWriterDemo" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Writing XML with XmlWriter</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Create Courses.xml</h2>
            <asp:Button ID="btnCreate" runat="server" Text="Create XML File" OnClick="btnCreate_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
            <pre><asp:Literal ID="litXml" runat="server" Mode="Encode"></asp:Literal></pre>
        </div>
    </form>
</body>
</html>
