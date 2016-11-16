<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AfterRegistration.aspx.cs" Inherits="ShowTime.AfterRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>After Registration</title>
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
        </asp:Table>
        <br />
        <asp:Table ID="Table2" runat="server" Width="100%">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center">
                    <asp:Label ID="Label1" runat="server" Text="Error In Verification! SignUp Again." CssClass="labels"></asp:Label><br/>
                    <asp:Button ID="Button1" runat="server" Text="Home" OnClick="Button1_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>     
    </div>
    </form>
</body>
</html>
