<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowList.aspx.cs" Inherits="ShowTime.Theater.ShowList" %>

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
                            <asp:MenuItem Text="Screens" NavigateUrl="TheaterScreens.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Shows" NavigateUrl="ShowList.aspx"></asp:MenuItem>
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
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="ID">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                <asp:BoundField DataField="Movie" HeaderText="Movie" SortExpression="Movie" />
                <asp:BoundField DataField="Screen" HeaderText="Screen" SortExpression="Screen" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT class.seat_class AS Class, show_price.price as Price FROM class INNER JOIN show_price ON class.class_id = show_price.class_id INNER JOIN show ON show_price.show_id = show.show_id WHERE(show.show_id=@show_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="show_id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT show.show_id AS ID, show.show_date AS Date, show.show_time AS Time, movie.name AS Movie, screen.screen_no AS Screen FROM show INNER JOIN movie ON show.movie_id = movie.movie_id INNER JOIN screen ON show.screen_id = screen.screen_id ORDER BY Date DESC, Time DESC"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
