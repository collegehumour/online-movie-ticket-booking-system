<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TheaterList.aspx.cs" Inherits="ShowTime.Admin.TheaterList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Theater List</title>
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
                            <asp:MenuItem ImageUrl="~/Admin/home1.png" NavigateUrl="AdminHome.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Movies" NavigateUrl="MovieList.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Theaters" NavigateUrl="TheaterList.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Profile" NavigateUrl="UserInfo.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Sign Out" NavigateUrl="~/Home.aspx"></asp:MenuItem>
                        </Items>
                    </asp:Menu>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Label ID="Label2" runat="server" CssClass="labels" Text="Theater Requests"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CellPadding="4" DataKeyNames="user_id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="user_id" HeaderText="Username" ReadOnly="True" SortExpression="user_id" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [user].user_id, [user].name, [user].email FROM [user] INNER JOIN theater_user ON [user].user_id = theater_user.user_id WHERE (theater_user.approval = 'N')"></asp:SqlDataSource>
        <br />
        <br />

        <asp:Table ID="Table3" runat="server" Visible="false">
            <asp:TableRow Height="50px">
                <asp:TableCell>
                    <asp:Label ID="Label3" runat="server" Text="Contact No : " CssClass="labels"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label4" runat="server" Text="" CssClass="labels"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="50px">
                <asp:TableCell>
                    <asp:Label ID="Label5" runat="server" Text="Address : " CssClass="labels"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label6" runat="server" Text="" CssClass="labels"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="50px">
                <asp:TableCell>
                    <asp:Label ID="Label7" runat="server" Text="City : " CssClass="labels"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label8" runat="server" Text="" CssClass="labels"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="50px">
                <asp:TableCell>
                    <asp:Label ID="Label9" runat="server" Text="State : " CssClass="labels"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label10" runat="server" Text="" CssClass="labels"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="50px">
                <asp:TableCell>
                    <asp:Label ID="Label11" runat="server" Text="Pin Code : " CssClass="labels"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label12" runat="server" Text="" CssClass="labels"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="50px">
                <asp:TableCell ColumnSpan="2">
                    <asp:Button ID="Button1" runat="server" Text="Approve" OnClick="Button1_Click"/>
                </asp:TableCell>
            </asp:TableRow>

        </asp:Table>


        <br />
        <asp:Label ID="Label1" runat="server" Text="Theaters" CssClass="labels"></asp:Label><br /><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="user_id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="user_id" HeaderText="Username" ReadOnly="True" SortExpression="user_id" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="contact_no" HeaderText="Contact Number" SortExpression="contact_no" />
                <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                <asp:BoundField DataField="pin_code" HeaderText="Pincode" SortExpression="pin_code" />
                <asp:BoundField DataField="payment" HeaderText="Payment" SortExpression="payment" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT theater_user.user_id, theater_user.contact_no, theater_user.address, theater_user.city, theater_user.state, theater_user.pin_code, theater_user.payment, [user].name, [user].email FROM theater_user INNER JOIN [user] ON theater_user.user_id = [user].user_id WHERE (theater_user.approval = @approval)">
            <SelectParameters>
                <asp:Parameter DefaultValue="Y" Name="approval" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />



        <asp:Table ID="Table4" runat="server" Visible="false">
            <asp:TableRow Height="50px">
                <asp:TableCell>
                    <asp:Label ID="Label13" runat="server" Text="Theater : " CssClass="labels"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label14" runat="server" Text="" CssClass="labels"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="50px">
                <asp:TableCell>
                    <asp:Label ID="Label15" runat="server" Text="Amount : " CssClass="labels"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label16" runat="server" Text="" CssClass="labels"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="50px">
                <asp:TableCell ColumnSpan="2">
                    <asp:Button ID="Button2" runat="server" Text="Pay" OnClick="Button2_Click" />
                </asp:TableCell>               
            </asp:TableRow>
        </asp:Table>
    </div>
    </form>
</body>
</html>
