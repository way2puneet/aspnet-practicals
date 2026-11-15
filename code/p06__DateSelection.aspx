<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DateSelection.aspx.cs" Inherits="StudentPortal.DateSelection" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Date Selection</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Select Your Date of Birth</h2>
            <asp:Calendar ID="calDOB" runat="server" FirstDayOfWeek="Monday"
                TitleStyle-BackColor="LightSteelBlue" SelectedDayStyle-BackColor="Navy"
                OnSelectionChanged="calDOB_SelectionChanged">
            </asp:Calendar>
            <br />
            <asp:Label ID="lblDate" runat="server" Text="No date selected."></asp:Label>
        </div>
    </form>
</body>
</html>
