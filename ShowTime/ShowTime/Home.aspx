<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ShowTime.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" type="text/css" href="CSS/Style.css" runat="server"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" Width="100%">
            <asp:TableRow Height="80px">
                <asp:TableCell HorizontalAlign="Center">
                    <asp:Button ID="Button1" runat="server" Text="SIGN IN" OnClick="Button1_Click" />
                </asp:TableCell>                
            </asp:TableRow>
            
            <asp:TableRow Height="80px">
                <asp:TableCell HorizontalAlign="Center">
                    <asp:Button ID="Button2" runat="server" Text="SIGN UP" OnClick="Button2_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

      
        
        
    
    </div>
    </form>
</body>
</html>
