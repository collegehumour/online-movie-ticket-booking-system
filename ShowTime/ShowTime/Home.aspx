<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ShowTime.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" type="text/css" href="CSS/Style.css" runat="server"/>
    <title>Home</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       
        <asp:Table ID="Table2" runat="server"  Width="100%">
            <asp:TableRow Height="100px">
                <asp:TableCell>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/logo.png"/>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    
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
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Admin/MovieDetails.aspx?id="+Eval("movie_id")%>'>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Admin/Posters/"+Eval("movie_id")+".png" %>' Width="180px" Height="240px"/>
                                </asp:HyperLink>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Center"  CssClass="name">
                                <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("name") %>' NavigateUrl='<%# "~/Admin/MovieDetails.aspx?id="+Eval("movie_id")%>'></asp:HyperLink>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </td>
            </ItemTemplate>
        </asp:ListView><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [movie] WHERE ([name] LIKE '%' + @name + '%') ORDER BY [release_date] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox6" Name="name" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Table ID="Table1" runat="server" HorizontalAlign="Right" Width="100%">
            <asp:TableRow Height="80px">
                <asp:TableCell HorizontalAlign="Right">
                    <asp:Button ID="Button1" runat="server" Text="SIGN IN" OnClick="Button1_Click" /><t/><t/>
                    <asp:Button ID="Button2" runat="server" Text="SIGN UP" OnClick="Button2_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        
        
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Timer ID="Timer1" Interval="3000" runat="server"></asp:Timer>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
            <ContentTemplate>
                <asp:Table ID="Table4" runat="server" HorizontalAlign="Center" Width="100%">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center">
                    <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/Ads.xml" KeywordFilter="small" Height="465px" Width="950px"/>       
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        
    </div>
    </form>
</body>
</html>
