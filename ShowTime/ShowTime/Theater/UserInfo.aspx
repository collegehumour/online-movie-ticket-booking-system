<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="ShowTime.Theater.UserInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Information</title>
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
                            <asp:MenuItem Text="Profile" NavigateUrl="UserInfo.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Sign Out" NavigateUrl="~/Home.aspx"></asp:MenuItem>
                        </Items>
                    </asp:Menu>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
      <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="user_id" HeaderText="Username" ReadOnly="True" SortExpression="user_id" />
                <asp:BoundField DataField="contact_no" HeaderText="Contact Number" SortExpression="contact_no" />
                <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                <asp:BoundField DataField="pin_code" HeaderText="Pincode" SortExpression="pin_code" />
                <asp:BoundField DataField="payment" HeaderText="Payment" SortExpression="payment" />
                <asp:BoundField DataField="approval" HeaderText="Approval" SortExpression="approval" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [theater_user] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [theater_user] ([user_id], [contact_no], [address], [city], [state], [pin_code], [payment], [approval]) VALUES (@user_id, @contact_no, @address, @city, @state, @pin_code, @payment, @approval)" SelectCommand="SELECT * FROM [theater_user] WHERE ([user_id] = @user_id)" UpdateCommand="UPDATE [theater_user] SET [contact_no] = @contact_no, [address] = @address, [city] = @city, [state] = @state, [pin_code] = @pin_code, [payment] = @payment, [approval] = @approval WHERE [user_id] = @user_id">
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="user_id" Type="String" />
                <asp:Parameter Name="contact_no" Type="Decimal" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="state" Type="String" />
                <asp:Parameter Name="pin_code" Type="Decimal" />
                <asp:Parameter Name="payment" Type="Decimal" />
                <asp:Parameter Name="approval" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="user_id" SessionField="user_id" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="contact_no" Type="Decimal" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="state" Type="String" />
                <asp:Parameter Name="pin_code" Type="Decimal" />
                <asp:Parameter Name="payment" Type="Decimal" />
                <asp:Parameter Name="approval" Type="String" />
                <asp:Parameter Name="user_id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="user_id" DataSourceID="SqlDataSource2" Height="50px" Width="125px" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="user_id" HeaderText="Username" ReadOnly="True" SortExpression="user_id" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                <asp:BoundField DataField="role_name" HeaderText="Role" SortExpression="role_name" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [user] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [user] ([user_id], [name], [email], [password], [role_name]) VALUES (@user_id, @name, @email, @password, @role_name)" SelectCommand="SELECT * FROM [user] WHERE ([user_id] = @user_id)" UpdateCommand="UPDATE [user] SET [name] = @name, [email] = @email, [password] = @password, [role_name] = @role_name WHERE [user_id] = @user_id">
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="user_id" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="role_name" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="user_id" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="role_name" Type="String" />
                <asp:Parameter Name="user_id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
