<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddShow.aspx.cs" Inherits="ShowTime.Theater.AddShow" %>

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
        <asp:Label ID="Label9" runat="server" CssClass="labels"></asp:Label>
        <asp:Table ID="Table3" runat="server" HorizontalAlign="Center">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label1" runat="server" Text="Date" CssClass="labels"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                </asp:TableCell>                
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label2" runat="server" Text="Time" CssClass="labels"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Time" CssClass="fileupload"></asp:TextBox>
                </asp:TableCell>                
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label3" runat="server" Text="Screen" CssClass="labels"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="screen_no" DataValueField="screen_no" AutoPostBack="true" OnDataBound="DropDownList1_SelectedIndexChanged" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [screen_no] FROM [screen] WHERE ([user_id] = @user_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="user_id" SessionField="user_id" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:TableCell>                
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label4" runat="server" Text="Price" CssClass="labels"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Table ID="Table4" runat="server">
                        <asp:TableRow ID="Row1" Visible="false">
                            <asp:TableCell>
                                <asp:Label ID="Label5" runat="server" CssClass="labels"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="Row2" Visible="false">
                            <asp:TableCell>
                                <asp:Label ID="Label6" runat="server" CssClass="labels"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="Row3" Visible="false">
                            <asp:TableCell>
                                <asp:Label ID="Label7" runat="server" CssClass="labels"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="Row4" Visible="false">
                            <asp:TableCell>
                                <asp:Label ID="Label8" runat="server" CssClass="labels"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>    
    </div>
    </form>
</body>
</html>
