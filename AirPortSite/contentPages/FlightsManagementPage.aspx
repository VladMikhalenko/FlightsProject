<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/GlobalMasterPage.master" AutoEventWireup="true" CodeFile="FlightsManagementPage.aspx.cs" Inherits="contentPages_FlightsManagementPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../App_Themes/RegTheme/Reg.css?v=@DateTime.Now.Milliseconds?v=@DateTime.Now.Milliseconds" rel="stylesheet" type="text/css" />
    <div class="tb-div">
        <table class="table-form">
            <tr>
                <td colspan="2">
                    <asp:DropDownList ID="ddQueryType" runat="server" AutoPostBack="True">
                        <asp:ListItem>Добавление</asp:ListItem>
                        <asp:ListItem>Активация</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="notify">
                    <asp:Label ID="lbNotify" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Номер рейса:
                </td>
                <td>
                    <asp:Label ID="lbId" runat="server" Text=""></asp:Label><br />
                </td>
            </tr>
            <tr>
                <td>
                    Страна вылет:
                </td>
                <td>
                    <asp:DropDownList ID="ddFromCountry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddFromCountry_SelectedIndexChanged"></asp:DropDownList>
                    <br />
                </td>
            </tr>
            <tr>
                <td >
                    Город вылет:
                </td>
                <td >
                    <asp:DropDownList ID="ddFromCity" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddFromCity_SelectedIndexChanged">
                    </asp:DropDownList>
                    <br />
                </td>
            </tr>
            <tr>
                <td >
                    Аэропорт вылет:
                </td>
                <td >
                    <asp:DropDownList ID="ddFromAirport" runat="server" AutoPostBack="True"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Страна прибытие:
                </td>
                <td>
                    <asp:DropDownList ID="ddToCountry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddToCountry_SelectedIndexChanged">
                    </asp:DropDownList>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    Город прибытие:
                </td>
                <td>
                    <asp:DropDownList ID="ddToCity" runat="server" OnSelectedIndexChanged="ddToCity_SelectedIndexChanged">
                    </asp:DropDownList>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    Аэропорт прибытие:
                </td>
                <td>
                    <asp:DropDownList ID="ddToAirport" runat="server">
                    </asp:DropDownList>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    Дата отправления:
                </td>
                <td>
                    <asp:TextBox ID="tbDate" runat="server"></asp:TextBox><br />
                </td>
            </tr>
            <tr>
                <td>
                    Авиалайнер:
                </td>
                <td>
                    <asp:DropDownList ID="ddPlane" runat="server" DataSourceID="SqlPlanesSource" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlPlanesSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Plane]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Выполнить" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>        
    </div>
    <div class="edit-list">
        <asp:GridView ID="GridView1" runat="server" Font-Size="Medium" AutoGenerateColumns="False" DataSourceID="SqlFlightsSource" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Номер рейса" HeaderText="Номер рейса" SortExpression="Номер рейса" />
            <asp:BoundField DataField="ОТКУДА" HeaderText="ОТКУДА" SortExpression="ОТКУДА" />
            <asp:BoundField DataField="Город вылет" HeaderText="Город вылет" SortExpression="Город вылет" />
            <asp:BoundField DataField="Аэропорт вылет" HeaderText="Аэропорт вылет" SortExpression="Аэропорт вылет" />
            <asp:BoundField DataField="КУДА" HeaderText="КУДА" SortExpression="КУДА" />
            <asp:BoundField DataField="Город прибытие" HeaderText="Город прибытие" SortExpression="Город прибытие" />
            <asp:BoundField DataField="Аэропорт прибытие" HeaderText="Аэропорт прибытие" SortExpression="Аэропорт прибытие" />
            <asp:BoundField DataField="Дата/время" HeaderText="Дата/время" SortExpression="Дата/время" />
            <asp:BoundField DataField="АВИАЛАЙНЕР" HeaderText="АВИАЛАЙНЕР" SortExpression="АВИАЛАЙНЕР" />
            <asp:CheckBoxField DataField="Активен" HeaderText="Активен" SortExpression="Активен" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlFlightsSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [FlightView]"></asp:SqlDataSource>
    </div>
    
    
</asp:Content>

