<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/GlobalMasterPage.master" AutoEventWireup="true" CodeFile="AirportsPlanesPage.aspx.cs" Inherits="contentPages_AdminFlightsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../App_Themes/RegTheme/Reg.css?v=@DateTime.Now.Milliseconds?v=@DateTime.Now.Milliseconds" rel="stylesheet" type="text/css" />
    <div class="tb-div">    
        Данные таблицы авиалайнеров:
        <asp:GridView CssClass="table-form" ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="Нет записей для отображения.">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Capacity" HeaderText="Capacity" SortExpression="Capacity" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Plane] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Plane] ([Name], [Capacity]) VALUES (@Name, @Capacity)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Id], [Name], [Capacity] FROM [Plane]" UpdateCommand="UPDATE [Plane] SET [Name] = @Name, [Capacity] = @Capacity WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Capacity" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Capacity" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
        
        Данные таблицы аэропортов:<br />
        <div class="scroll-view">
            <div class="tb-div">
            <table class="table-form">
                <tr>
                    <td>
                        Страна:
                    </td>
                    <td>
                        <asp:TextBox ID="tbCountry" runat="server" MaxLength="50"></asp:TextBox>
                    </td>
                    <td>
                        Город:
                    </td>
                    <td>
                        <asp:TextBox ID="tbCity" runat="server" MaxLength="50"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Адрес:
                    </td>
                    <td>
                         <asp:TextBox ID="tbAdress" runat="server" MaxLength="50"></asp:TextBox>
                    </td>
                    <td>
                        Название:
                    </td>
                    <td>
                        <asp:TextBox ID="tbAName" runat="server" MaxLength="50"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Button ID="btnAddAirport" runat="server" Text="Добавить" OnClick="btnAddAirport_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="tb-div">
                            <asp:Label CssClass="notify" ID="lbNotify" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>   
            </div>

        </div>
        <div class="edit-list">
        <asp:GridView CssClass="table-form" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlAirportSource" EmptyDataText="Нет записей для отображения." AllowSorting="True">
            <Columns> 
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            </Columns>
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlAirportSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Airport] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Airport] ([Country], [City], [Address], [Name]) VALUES (@Country, @City, @Address, @Name)" SelectCommand="SELECT * FROM [Airport]" UpdateCommand="UPDATE [Airport] SET [Country] = @Country, [City] = @City, [Address] = @Address, [Name] = @Name WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
       
    </div>
    </asp:Content>

