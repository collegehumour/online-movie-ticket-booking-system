<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AfterBooking.aspx.cs" Inherits="ShowTime.User.AfterBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>After Booking</title>
        <link rel="stylesheet" type="text/css" href="../CSS/Style.css" runat="server"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Table ID="Table1" runat="server"  Width="100%">
            <asp:TableRow Height="100px">
                <asp:TableCell>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/logo.png"/>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" Font-Names="Calibri" Font-Size="X-Large"  Width="100%">
                        <Items>
                            <asp:MenuItem ImageUrl="~/Admin/home1.png" NavigateUrl="ClientHome.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Movies" NavigateUrl="MovieList.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Profile" NavigateUrl="UserInfo.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Sign Out" NavigateUrl="~/Home.aspx"></asp:MenuItem>
                        </Items>
                    </asp:Menu>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center">
                    <br /><br />
                    <asp:Label ID="Label1" runat="server" CssClass="labels" Text="Your Ticket is booked.<br/>You will get an Email of all Details.<br/>Show that Email to Theater."></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>       
    </div>
    </form>
</body>
</html>
