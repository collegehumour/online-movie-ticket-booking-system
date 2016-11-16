<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgetPass.aspx.cs" Inherits="ShowTime.forgetPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forget Password</title>
    <link rel="stylesheet" type="text/css" href="CSS/Style.css" runat="server"/>
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
                    <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" Font-Names="Calibri" Font-Size="X-Large"  Width="100%">
                        <Items>
                            <asp:MenuItem ImageUrl="~/Admin/home1.png" NavigateUrl="Home.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Movies" NavigateUrl="./User/MovieList.aspx"></asp:MenuItem>                           
                        </Items>
                    </asp:Menu>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        
        

        <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">            
            <asp:TableRow Height="80px">
                <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                    <asp:Label ID="Label2" runat="server" Text="Email is Not Registered." Visible="false" ForeColor="Red"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="80px">
                <asp:TableCell>
                    <asp:Label ID="Label3" runat="server" Text="Select Role"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="role" DataValueField="role"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [role] FROM [role]"></asp:SqlDataSource>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="80px">
                <asp:TableCell>
                    <asp:Label ID="Label1" runat="server" CssClass="labels" Text="E mail :"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" ></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="80px">
                <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                    <asp:Button ID="Button1" runat="server" Text="Send" OnClick="Button1_Click"/>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>    
    </form>

</body>
</html>
