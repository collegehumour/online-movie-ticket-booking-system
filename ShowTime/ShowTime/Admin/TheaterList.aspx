<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TheaterList.aspx.cs" Inherits="ShowTime.Admin.TheaterList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                            <asp:MenuItem ImageUrl="~/Admin/home1.png" NavigateUrl="AdminHome.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Movies" NavigateUrl="MovieList.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Theaters" NavigateUrl="TheaterList.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="PROFILE" NavigateUrl="UserInfo.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Sign Out" NavigateUrl="~/Logout.aspx"></asp:MenuItem>
                        </Items>
                    </asp:Menu>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <div class="search">
        <asp:Table ID="Table2" runat="server" Width="100%">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center">
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="search" placeholder="Search Here..."></asp:TextBox> 
                    <asp:Button ID="Button3" runat="server" Text="Search"/>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>                          
        </div>
        <asp:Label ID="Label1" runat="server" Text="Theaters"></asp:Label><br /><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="user_id" HeaderText="user_id" ReadOnly="True" SortExpression="user_id" />
                <asp:BoundField DataField="contact_no" HeaderText="contact_no" SortExpression="contact_no" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                <asp:BoundField DataField="pin_code" HeaderText="pin_code" SortExpression="pin_code" />
                <asp:BoundField DataField="payment" HeaderText="payment" SortExpression="payment" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [user_id], [contact_no], [address], [city], [state], [pin_code], [payment] FROM [theater_user]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
