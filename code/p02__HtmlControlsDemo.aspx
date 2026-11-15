<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HtmlControlsDemo.aspx.cs" Inherits="StudentPortal.HtmlControlsDemo" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HTML Server Controls</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Library Membership</h2>
            Name: <input type="text" id="txtStudent" runat="server" maxlength="40" />
            <br /><br />
            <input type="checkbox" id="chkLibrary" runat="server" /> Library Card Required
            <br /><br />
            City:
            <select id="selCity" runat="server">
                <option value="LDH">Ludhiana</option>
                <option value="ASR">Amritsar</option>
                <option value="JAL">Jalandhar</option>
            </select>
            <br /><br />
            <input type="submit" id="btnSubmit" runat="server" value="Submit"
                onserverclick="btnSubmit_ServerClick" />
            <br /><br />
            <span id="spnResult" runat="server"></span>
        </div>
    </form>
</body>
</html>
