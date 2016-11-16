<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="ShowTime.User.MovieDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Details</title>
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

        
        <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="JavaScript: window.history.back(1); return false;" ImageUrl="~/Admin/back.png"/>
        <asp:Table ID="Table4" runat="server" HorizontalAlign="Center" Width="100%">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Image ID="Image2" runat="server" Width="400px" Height="500px"/>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Table ID="Table3" runat="server" HorizontalAlign="Center">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Right">
                            <asp:Label ID="Label1" runat="server" Text="Movie Name : " CssClass="labels"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="Label2" runat="server" CssClass="labels"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Right">
                            <asp:Label ID="Label3" runat="server" Text="Genre : " CssClass="labels"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="Label10" runat="server" CssClass="labels"></asp:Label> 
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Right">
                            <asp:Label ID="Label4" runat="server" Text="Language : " CssClass="labels"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="Label11" runat="server" CssClass="labels"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Right">
                            <asp:Label ID="Label5" runat="server" Text="Release Date : " CssClass="labels"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="Label9" runat="server" CssClass="labels"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Right">
                            <asp:Label ID="Label6" runat="server" Text="Cast : " CssClass="labels"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="Label12" runat="server" CssClass="labels"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Right">
                            <asp:Label ID="Label7" runat="server" Text="Director : " CssClass="labels"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="Label13" runat="server" CssClass="labels"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Right">
                            <asp:Label ID="Label8" runat="server" Text="Duration : " CssClass="labels"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="Label14" runat="server" CssClass="labels"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="Label15" runat="server" Text="Rating : " CssClass="labels"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="Label16" runat="server" Text="Label" CssClass="labels"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" CssClass="fileupload"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="0 to 5 only." ForeColor="Red" MaximumValue="5" MinimumValue="0" ControlToValidate="TextBox1" Type="Integer"></asp:RangeValidator>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Button2_Click" CssClass="search"/>
                            </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow >
                        <asp:TableCell HorizontalAlign="left" ColumnSpan="2">
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="Book Now" BackColor="Red" ForeColor="White" OnClick="Button1_Click"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>
    </form>
</body>
</html>
