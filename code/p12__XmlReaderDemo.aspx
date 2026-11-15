<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XmlReaderDemo.aspx.cs" Inherits="StudentPortal.XmlReaderDemo" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reading XML with XmlReader</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Students (Read with XmlReader)</h2>
            <asp:Literal ID="litStudents" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
