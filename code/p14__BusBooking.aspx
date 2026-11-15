<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusBooking.aspx.cs" Inherits="StudentPortal.BusBooking" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bus Ticket Reservation</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Bus Ticket Reservation</h2>
            <asp:ValidationSummary ID="vsErrors" runat="server" ForeColor="Red"
                HeaderText="Please correct the following:" />
            <table>
                <tr>
                    <td>Passenger Name:</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" MaxLength="40"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                            Text="*" ErrorMessage="Passenger name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Mobile Number:</td>
                    <td>
                        <asp:TextBox ID="txtMobile" runat="server" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile"
                            Text="*" ErrorMessage="Mobile number is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile"
                            ValidationExpression="[6-9]\d{9}" Text="*"
                            ErrorMessage="Enter a valid 10-digit mobile number." ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>From:</td>
                    <td>
                        <asp:DropDownList ID="ddlFrom" runat="server">
                            <asp:ListItem Value="">-- Select --</asp:ListItem>
                            <asp:ListItem>Ludhiana</asp:ListItem>
                            <asp:ListItem>Amritsar</asp:ListItem>
                            <asp:ListItem>Jalandhar</asp:ListItem>
                            <asp:ListItem>Chandigarh</asp:ListItem>
                            <asp:ListItem>Delhi</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvFrom" runat="server" ControlToValidate="ddlFrom"
                            Text="*" ErrorMessage="Select the starting city." ForeColor="Red"></asp:RequiredFieldValidator>
                        To:
                        <asp:DropDownList ID="ddlTo" runat="server">
                            <asp:ListItem Value="">-- Select --</asp:ListItem>
                            <asp:ListItem>Ludhiana</asp:ListItem>
                            <asp:ListItem>Amritsar</asp:ListItem>
                            <asp:ListItem>Jalandhar</asp:ListItem>
                            <asp:ListItem>Chandigarh</asp:ListItem>
                            <asp:ListItem>Delhi</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvTo" runat="server" ControlToValidate="ddlTo"
                            Text="*" ErrorMessage="Select the destination city." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvRoute" runat="server" ControlToValidate="ddlTo"
                            ControlToCompare="ddlFrom" Operator="NotEqual" Text="*"
                            ErrorMessage="From and To cannot be the same city." ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>Journey Date:</td>
                    <td>
                        <asp:Calendar ID="calJourney" runat="server" FirstDayOfWeek="Monday"
                            TitleStyle-BackColor="LightSteelBlue" SelectedDayStyle-BackColor="Navy"
                            OnDayRender="calJourney_DayRender" OnSelectionChanged="calJourney_SelectionChanged">
                        </asp:Calendar>
                        <asp:Label ID="lblDate" runat="server" Text="No date selected."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Bus Type:</td>
                    <td>
                        <asp:RadioButtonList ID="rblBusType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="350">Ordinary (Rs. 350)</asp:ListItem>
                            <asp:ListItem Value="600">AC (Rs. 600)</asp:ListItem>
                            <asp:ListItem Value="900">AC Sleeper (Rs. 900)</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvBusType" runat="server" ControlToValidate="rblBusType"
                            Text="*" ErrorMessage="Select the bus type." ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Number of Seats:</td>
                    <td>
                        <asp:DropDownList ID="ddlSeats" runat="server">
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
                    <td></td>
                    <td><asp:CheckBox ID="chkStudent" runat="server" Text="I am a student (10% concession)" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnBook" runat="server" Text="Book Ticket" OnClick="btnBook_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CausesValidation="false" OnClick="btnReset_Click" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>

            <asp:Panel ID="pnlTicket" runat="server" Visible="false" BorderStyle="Dashed" BorderWidth="1px" Width="360px">
                <h3>&nbsp;Ticket Confirmed</h3>
                <asp:Label ID="lblTicket" runat="server"></asp:Label>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
