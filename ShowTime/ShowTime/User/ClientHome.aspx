<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientHome.aspx.cs" Inherits="ShowTime.User.ClientHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Home</title>
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
            </asp:Table>
        <div class="search">
        <asp:Table ID="Table3" runat="server" Width="100%">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center">
                    <asp:TextBox ID="TextBox6" runat="server" TextMode="Search" placeholder="Search Here..."></asp:TextBox> 
                    <asp:Button ID="Button3" runat="server" Text="Search" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>                          
        </div>
        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1" GroupPlaceholderID="GroupContainer" GroupItemCount="4" ItemPlaceholderID="ItemContainer">
            <LayoutTemplate>
                <table>
                    <asp:PlaceHolder ID="GroupContainer" runat="server"></asp:PlaceHolder>
                </table>
                <div class="search">
                <asp:Table ID="Table3" runat="server" HorizontalAlign="Center">
                    <asp:TableRow>
                        <asp:TableCell>                   
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="8">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowLastPageButton="true" ShowNextPageButton ="true"/>
                                </Fields>
                            </asp:DataPager>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                </div>   
            </LayoutTemplate>
            <GroupTemplate>
                <tr>
                    <asp:PlaceHolder ID="ItemContainer" runat="server"></asp:PlaceHolder>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td>
                    <asp:Table ID="Table1" runat="server" Width="330px" CssClass="listview">
                        <asp:TableRow >
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/User/MovieDetails.aspx?id="+Eval("movie_id")%>'>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Admin/Posters/"+Eval("movie_id")+".png" %>' Width="180px" Height="240px"/>
                                </asp:HyperLink>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Center" CssClass="name">
                                <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("name") %>' NavigateUrl='<%# "~/User/MovieDetails.aspx?id="+Eval("movie_id")%>'></asp:HyperLink>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </td>
            </ItemTemplate>
        </asp:ListView><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [movie] WHERE ([name] LIKE '%' + @name + '%') ORDER BY [release_date] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox6" Name="name" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Latest Movies" CssClass="labels"></asp:Label>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" GroupPlaceholderID="GroupContainer" GroupItemCount="4" ItemPlaceholderID="ItemContainer">
            <LayoutTemplate>
                <table>
                    <asp:PlaceHolder ID="GroupContainer" runat="server"></asp:PlaceHolder>
                </table>
                <div class="search">
                <asp:Table ID="Table3" runat="server" HorizontalAlign="Center">
                    <asp:TableRow>
                        <asp:TableCell>                   
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="8">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowLastPageButton="true" ShowNextPageButton ="true"/>
                                </Fields>
                            </asp:DataPager>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                </div>   
            </LayoutTemplate>
            <GroupTemplate>
                <tr>
                    <asp:PlaceHolder ID="ItemContainer" runat="server"></asp:PlaceHolder>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td>
                    <asp:Table ID="Table1" runat="server" Width="330px" CssClass="listview">
                        <asp:TableRow >
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/User/MovieDetails.aspx?id="+Eval("movie_id")%>'>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Admin/Posters/"+Eval("movie_id")+".png" %>' Width="180px" Height="240px"/>
                                </asp:HyperLink>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Center" CssClass="name">
                                <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("name") %>' NavigateUrl='<%# "~/User/MovieDetails.aspx?id="+Eval("movie_id")%>'></asp:HyperLink>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </td>
            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [movie]  WHERE  DATEDIFF (DAY,release_date, GETDATE ()) &lt; 15 AND DATEDIFF (DAY,release_date, GETDATE ()) &gt; -15 ORDER BY [movie_id] DESC"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
