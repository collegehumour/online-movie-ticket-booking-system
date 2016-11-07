<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Composemail.aspx.cs" Inherits="WebApplication1.Composemail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" placeholder="To"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server" placeholder="Subject"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="TextBox3" runat="server" placeholder="Message"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send" />
    </div>
    </form>
</body>
</html>
