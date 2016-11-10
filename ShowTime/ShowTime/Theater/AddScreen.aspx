<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddScreen.aspx.cs"  EnableEventValidation="true" Inherits="ShowTime.Theater.AddScreen" %>

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

        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <asp:Table ID="Table3" runat="server" HorizontalAlign="Center">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label1" runat="server" Text="Screen Number" CssClass="labels"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Number" AutoPostBack="true" OnTextChanged="TextBox2_TextChanged"  CssClass="fileupload"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox2" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                            <asp:Label ID="Label12" runat="server" ForeColor="Red" Text="Screen no is Occupied Or Not Valid.." CssClass="labels" Visible="false"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label3" runat="server" Text="Rows" CssClass="labels"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label4" runat="server" Text="A to " ForeColor="Green"></asp:Label>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ControlToValidate="TextBox4" ValidationExpression="[A-Z]" ID="RegularExpressionValidator1" runat="server" ErrorMessage="A to Z only"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label5" runat="server" Text="Columns" CssClass="labels"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label6" runat="server" Text="1 to " ForeColor="Green"></asp:Label>
                            <asp:TextBox ID="TextBox3" runat="server" TextMode="Number" CssClass="fileupload"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator2" ControlToValidate="TextBox3" Type="Integer" MinimumValue="10" MaximumValue="30"  runat="server" ErrorMessage="10 to 30"></asp:RangeValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label2" runat="server" Text="Select Classes" CssClass="labels"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:ListBox ID="ListBox1" runat="server" Height="200px" SelectionMode="Multiple" DataSourceID="SqlDataSource1" DataTextField="class_name" DataValueField="class_name"></asp:ListBox>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [class_name] FROM [pre_seat_class] ORDER BY [class_name]"></asp:SqlDataSource>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="Button2" runat="server" Text="Next" CommandName="NextView"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:View>
            <asp:View ID="View2" runat="server" OnActivate="View2_Activate">
                <asp:Table ID="Table4" runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" CssClass="labels">
                            <asp:Table ID="Table6" runat="server" HorizontalAlign="Center" Width="100%">
                                <asp:TableRow ID="Row1" Visible="false">
                                    <asp:TableCell>
                                        <asp:Label ID="Label7" runat="server"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="Row2" Visible="false">
                                    <asp:TableCell>
                                        <asp:Label ID="Label8" runat="server"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="Row3" Visible="false">
                                    <asp:TableCell>
                                        <asp:Label ID="Label9" runat="server"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="Row4" Visible="false">
                                    <asp:TableCell>
                                        <asp:Label ID="Label10" runat="server"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Button ID="Button1" runat="server" Text="Next" CommandName="NextView"/>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:View>
            <asp:View ID="View3" runat="server" OnActivate="View3_Activate">
                <asp:Label ID="Label11" runat="server" Text="Screen is Added Successfully." ForeColor="Green" CssClass="labels"></asp:Label>
                <asp:Table ID="Table5" runat="server" HorizontalAlign="Center"></asp:Table>
            </asp:View>
        </asp:MultiView>
    </div>
    </form>
</body>
</html>
