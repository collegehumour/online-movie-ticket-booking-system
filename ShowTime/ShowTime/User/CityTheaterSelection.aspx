<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CityTheaterSelection.aspx.cs" Inherits="ShowTime.User.CityTheaterSelection" %>

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
                                <asp:MenuItem ImageUrl="~/Admin/home1.png" NavigateUrl="TheaterHome.aspx"></asp:MenuItem>
                                <asp:MenuItem Text="Movies" NavigateUrl="MovieList.aspx"></asp:MenuItem>                 
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
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="search" placeholder="Search Here..."></asp:TextBox> 
                        <asp:Button ID="Button3" runat="server" Text="Search"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>                          
            </div>

              
            <asp:Table ID="Table3" runat="server" HorizontalAlign="Center">
                <asp:TableRow Height="80px">
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:Label ID="Label1" runat="server" CssClass="labels" Text="City : "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="city" DataValueField="city"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [city] FROM [theater_user] "></asp:SqlDataSource>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="80px">
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:Label ID="Label2" runat="server" CssClass="labels" Text="Theater : "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="name"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT name FROM [user] INNER JOIN [theater_user] ON [user].user_id = [theater_user].user_id WHERE (theater_user.city = @city)" >
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="city" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="80px">
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:Label ID="Label3" CssClass="labels" runat="server" Text="Date : "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="left">
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="80px">
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Button ID="Button1" runat="server" Text="Next" OnClick="Button1_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>            
    </div>
    </form>
</body>
</html>
