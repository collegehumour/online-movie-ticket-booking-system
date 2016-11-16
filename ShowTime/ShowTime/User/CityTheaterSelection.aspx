<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CityTheaterSelection.aspx.cs" Inherits="ShowTime.User.CityTheaterSelection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Selection</title>
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
                                <asp:MenuItem Text="Profile" NavigateUrl="UserInfo.aspx"></asp:MenuItem>
                                <asp:MenuItem Text="Sign Out" NavigateUrl="~/Home.aspx"></asp:MenuItem>
                            </Items>
                        </asp:Menu>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <asp:Table ID="Table3" runat="server" HorizontalAlign="Center">
                        <asp:TableRow Height="80px">
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label ID="Label21" runat="server" Text="Enter Valid Date" ForeColor="Red" Visible="false"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
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
                                <asp:Label ID="Label3" CssClass="labels" runat="server" Text="Date : "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="left">
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="Date" AutoPostBack="true" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="Label2" runat="server" Text="Theater : " CssClass="labels"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="name"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [user].name FROM [user] INNER JOIN theater_user ON [user].user_id = theater_user.user_id INNER JOIN screen ON theater_user.user_id = screen.user_id INNER JOIN show ON screen.screen_id = show.screen_id WHERE (show.show_date = @show_date) AND (show.movie_id = @movie_id) AND (theater_user.city = @city)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextBox1" Name="show_date" PropertyName="Text" />
                                        <asp:SessionParameter Name="movie_id" SessionField="movie_id" />
                                        <asp:ControlParameter ControlID="DropDownList1" Name="city" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="DropDownList2"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="Label4" runat="server" Text="Select Show : " CssClass="labels"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="show_time" DataValueField="show_time" AutoPostBack="true"></asp:DropDownList> 
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT show.show_time FROM [user] INNER JOIN theater_user ON [user].user_id = theater_user.user_id INNER JOIN screen ON theater_user.user_id = screen.user_id INNER JOIN show ON screen.screen_id = show.screen_id WHERE [show].show_date=@show_date AND [show].movie_id=@movie_id AND [theater_user].city=@city AND [user].name = @name">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextBox1" Name="show_date" PropertyName="Text" />
                                        <asp:SessionParameter Name="movie_id" SessionField="movie_id" />
                                        <asp:ControlParameter ControlID="DropDownList1" Name="city" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="DropDownList2" Name="name" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="DropDownList3"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Height="80px">
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                                <asp:Button ID="Button1" runat="server" Text="Next" CommandName="NextView"/>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    
                </asp:View>
                <asp:View ID="View2" runat="server" OnActivate="View2_Activate">
                    <asp:Table ID="Table4" runat="server" Width="100%">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Table ID="Table6" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource4" DataTextField="seat_no" DataValueField="seat_no" RepeatLayout="Table" RepeatDirection="Horizontal" OnDataBound="CheckBoxList1_DataBound" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged"></asp:CheckBoxList>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT seat.seat_no FROM seat INNER JOIN class ON seat.class_id = class.class_id INNER JOIN screen ON class.screen_id = screen.screen_id INNER JOIN show ON screen.screen_id = show.screen_id INNER JOIN theater_user ON screen.user_id = theater_user.user_id INNER JOIN [user] ON theater_user.user_id = [user].user_id WHERE [show].show_date=@show_date AND [show].movie_id=@movie_id AND [theater_user].city=@city AND [user].name = @name AND [show].show_time=@show_time">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="TextBox1" Name="show_date" PropertyName="Text" />
                                                    <asp:SessionParameter Name="movie_id" SessionField="movie_id" />
                                                    <asp:ControlParameter ControlID="DropDownList1" Name="city" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DropDownList2" Name="name" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DropDownList3" Name="show_time" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>      
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="Label5" runat="server" Text="Seats : "></asp:Label>
                                            <asp:Label ID="Label18" runat="server"></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="Label19" runat="server" Text="Amount : "></asp:Label>
                                            <asp:Label ID="Label20" runat="server"></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Table ID="Table5" runat="server" HorizontalAlign="Center">
                                    <asp:TableRow ID="Row1" Visible="false">
                                        <asp:TableCell>
                                            <asp:Label ID="Label6" runat="server" CssClass="labels"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="Label7" runat="server" CssClass="labels"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="Label8" runat="server" CssClass="labels"></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="Row2" Visible="false">
                                        <asp:TableCell>
                                            <asp:Label ID="Label9" runat="server" CssClass="labels"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="Label10" runat="server" CssClass="labels"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="Label11" runat="server" CssClass="labels"></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="Row3" Visible="false">
                                        <asp:TableCell>
                                            <asp:Label ID="Label12" runat="server" CssClass="labels"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="Label13" runat="server" CssClass="labels"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="Label14" runat="server" CssClass="labels"></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="Row4" Visible="false">
                                        <asp:TableCell>
                                            <asp:Label ID="Label15" runat="server" CssClass="labels"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="Label16" runat="server" CssClass="labels"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="Label17" runat="server" CssClass="labels"></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Button ID="Button2" runat="server" Text="Book" OnClick="Button2_Click" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:View>
            </asp:MultiView>        
    </div>
    </form>
</body>
</html>
