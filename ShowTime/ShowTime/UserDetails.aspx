<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="ShowTime.UserDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Details</title>
    <link rel="stylesheet" type="text/css" href="../CSS/Style.css" runat="server"/>    
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
                                <asp:MenuItem Text="Sign Out" NavigateUrl="~/Home.aspx"></asp:MenuItem>
                            </Items>
                        </asp:Menu>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <div class="search">
            <asp:Table ID="Table3" runat="server" Width="100%">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="search" placeholder="Search Here..."></asp:TextBox> 
                        <asp:Button ID="Button3" runat="server" Text="Search"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>                          
            </div>
    </div>

    <div>
        <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
            <asp:TableRow Height="80px">
                <asp:TableCell>
                    <asp:Label ID="Label1" runat="server" Text="Username : " CssClass="labels"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="80px">
                <asp:TableCell>
                    <asp:Label ID="Label2" runat="server" Text="Mobile Number : " CssClass="labels"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Number" CssClass="fileupload"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Enter Valid Number" ControlToValidate="TextBox2" ForeColor="Red" Type="Double" MaximumValue="9999999999" MinimumValue="7000000000"></asp:RangeValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="80px">
                <asp:TableCell>
                    <asp:Label ID="Label3" runat="server" Text="Address : " CssClass="labels"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="80px">
                <asp:TableCell>
                    <asp:Label ID="Label4" runat="server" Text="State : " CssClass="labels"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                      <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="State" DataValueField="State"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [State] FROM [State_City]"></asp:SqlDataSource>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="80px">
                <asp:TableCell>
                    <asp:Label ID="Label5" runat="server" Text="City : " CssClass="labels"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                   <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="City" DataValueField="City"></asp:DropDownList>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [City] FROM [State_City] WHERE ([State] = @State)">
            <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="State" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="80px">
                <asp:TableCell>
                    <asp:Label ID="Label6" runat="server"  Text="Pincode :" CssClass="labels"> </asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Number" CssClass="fileupload"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="TextBox4" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Enter Valid Pincode" Type="Integer" ControlToValidate="TextBox4" ForeColor="Red" MinimumValue="100000" MaximumValue="999999"></asp:RangeValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="80px" >
                <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                    <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
                </asp:TableCell>
                
            </asp:TableRow>
        </asp:Table>
              

         
    </div>
    </form>
</body>
</html>
