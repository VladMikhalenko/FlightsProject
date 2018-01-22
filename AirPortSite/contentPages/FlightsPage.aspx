<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/GlobalMasterPage.master" AutoEventWireup="true" CodeFile="FlightsPage.aspx.cs" Inherits="contentPages_FlightsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../App_Themes/RegTheme/Reg.css?v=@DateTime.Now.Milliseconds?v=@DateTime.Now.Milliseconds" rel="stylesheet" type="text/css" />
    <div class="tb-div">
        <div class="logo">
            УКАЖИТЕ СТРАНЫ ОТПРАВКИ:
        </div>
        <table class="table-form">
            <tr>
                <td>
                    ОТКУДА:
                </td>
                <td>
                    <asp:TextBox ID="tbFrom" runat="server"></asp:TextBox>
                </td>
                <td rowspan="2">
                    <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/images/btnSearch.png" Width="80px" BackColor="White" OnClick="ImageButton1_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    КУДА:
                </td>
                <td>
                    <asp:TextBox ID="tbTo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Критерий поиска:
                </td>
                <td>
                    <asp:DropDownList ID="ddSearch" runat="server" CssClass="auto-style1">
                        <asp:ListItem>Страны</asp:ListItem>
                        <asp:ListItem>Города</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Номер рейса], [ОТКУДА], [Город вылет], [Аэропорт вылет], [КУДА], [Город прибытие], [Аэропорт прибытие], [Дата/время], [АВИАЛАЙНЕР] FROM [FlightView] WHERE ([Активен] = 'True')"></asp:SqlDataSource>
        <div class="list">
            <asp:ListView ID="ListView1" class="listview" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3" OnItemCommand="ListView1_ItemCommand">
            <AlternatingItemTemplate>
                <td  runat="server"  style=" font-size:medium; vertical-align:bottom; background-color:dodgerblue; color: white;">Номер рейса:
                    <asp:Label ID="Номер_рейсаLabel" runat="server" Text='<%# Eval("[Номер рейса]") %>' />
                    <br />
                    ОТКУДА:
                    <asp:Label ID="ОТКУДАLabel" runat="server" Text='<%# Eval("ОТКУДА") %>' />
                    <br />
                    Город вылет:
                    <asp:Label ID="Город_вылетLabel" runat="server" Text='<%# Eval("[Город вылет]") %>' />
                    <br />
                    Аэропорт вылет:
                    <asp:Label ID="Аэропорт_вылетLabel" runat="server" Text='<%# Eval("[Аэропорт вылет]") %>' />
                    <br />
                    КУДА:
                    <asp:Label ID="КУДАLabel" runat="server" Text='<%# Eval("КУДА") %>' />
                    <br />
                    Город прибытие:
                    <asp:Label ID="Город_прибытиеLabel" runat="server" Text='<%# Eval("[Город прибытие]") %>' />
                    <br />
                    Аэропорт прибытие:
                    <asp:Label ID="Аэропорт_прибытиеLabel" runat="server" Text='<%# Eval("[Аэропорт прибытие]") %>' />
                    <br />
                    Дата/время:
                    <asp:Label ID="Дата_времяLabel" runat="server" Text='<%# Eval("[Дата/время]") %>' />
                    <br />
                    <asp:Label ID="АВИАЛАЙНЕР_Label1" runat="server" Text='<%# Eval("[АВИАЛАЙНЕР]") %>' />
                    <br />
                    <div class="btn-book">
                        <asp:ImageButton ID="btnBuy" runat="server"  Width="150px" ImageUrl="~/images/buy.png" />
                    </div>
                    
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: dodgerblue;color: #000080;">Номер рейса:
                    <asp:TextBox ID="Номер_рейсаTextBox" runat="server" Text='<%# Bind("[Номер рейса]") %>' />
                    <br />
                    ОТКУДА:
                    <asp:TextBox ID="ОТКУДАTextBox" runat="server" Text='<%# Bind("ОТКУДА") %>' />
                    <br />
                    Город вылет:
                    <asp:TextBox ID="Город_вылетTextBox" runat="server" Text='<%# Bind("[Город вылет]") %>' />
                    <br />
                    Аэропорт вылет:
                    <asp:TextBox ID="Аэропорт_вылетTextBox" runat="server" Text='<%# Bind("[Аэропорт вылет]") %>' />
                    <br />
                    КУДА:
                    <asp:TextBox ID="КУДАTextBox" runat="server" Text='<%# Bind("КУДА") %>' />
                    <br />
                    Город прибытие:
                    <asp:TextBox ID="Город_прибытиеTextBox" runat="server" Text='<%# Bind("[Город прибытие]") %>' />
                    <br />
                    Аэропорт прибытие:
                    <asp:TextBox ID="Аэропорт_прибытиеTextBox" runat="server" Text='<%# Bind("[Аэропорт прибытие]") %>' />
                    <br />
                    Дата/время:
                    <asp:TextBox ID="Дата_времяTextBox" runat="server" Text='<%# Bind("[Дата/время]") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Обновить" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Отмена" />
                    <br />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: dodgerblue;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px; margin:auto;">
                    <tr>
                        <td>Поиск не дал резульатов.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">Номер рейса:
                    <asp:TextBox ID="Номер_рейсаTextBox" runat="server" Text='<%# Bind("[Номер рейса]") %>' />
                    <br />
                    ОТКУДА:
                    <asp:TextBox ID="ОТКУДАTextBox" runat="server" Text='<%# Bind("ОТКУДА") %>' />
                    <br />
                    Город вылет:
                    <asp:TextBox ID="Город_вылетTextBox" runat="server" Text='<%# Bind("[Город вылет]") %>' />
                    <br />
                    Аэропорт вылет:
                    <asp:TextBox ID="Аэропорт_вылетTextBox" runat="server" Text='<%# Bind("[Аэропорт вылет]") %>' />
                    <br />
                    КУДА:
                    <asp:TextBox ID="КУДАTextBox" runat="server" Text='<%# Bind("КУДА") %>' />
                    <br />
                    Город прибытие:
                    <asp:TextBox ID="Город_прибытиеTextBox" runat="server" Text='<%# Bind("[Город прибытие]") %>' />
                    <br />
                    Аэропорт прибытие:
                    <asp:TextBox ID="Аэропорт_прибытиеTextBox" runat="server" Text='<%# Bind("[Аэропорт прибытие]") %>' />
                    <br />
                    Дата/время:
                    <asp:TextBox ID="Дата_времяTextBox" runat="server" Text='<%# Bind("[Дата/время]") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Вставить" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Очистить" />
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style=" font-size:medium; vertical-align:bottom; background-color:dodgerblue; color: white;">Номер рейса:
                    <asp:Label ID="Номер_рейсаLabel" runat="server" Text='<%# Eval("[Номер рейса]") %>' />
                    <br />
                    ОТКУДА:
                    <asp:Label ID="ОТКУДАLabel" runat="server" Text='<%# Eval("ОТКУДА") %>' />
                    <br />
                    Город вылет:
                    <asp:Label ID="Город_вылетLabel" runat="server" Text='<%# Eval("[Город вылет]") %>' />
                    <br />
                    Аэропорт вылет:
                    <asp:Label ID="Аэропорт_вылетLabel" runat="server" Text='<%# Eval("[Аэропорт вылет]") %>' />
                    <br />
                    КУДА:
                    <asp:Label ID="КУДАLabel" runat="server" Text='<%# Eval("КУДА") %>' />
                    <br />
                    Город прибытие:
                    <asp:Label ID="Город_прибытиеLabel" runat="server" Text='<%# Eval("[Город прибытие]") %>' />
                    <br />
                    Аэропорт прибытие:
                    <asp:Label ID="Аэропорт_прибытиеLabel" runat="server" Text='<%# Eval("[Аэропорт прибытие]") %>' />
                    <br />
                    Дата/время:
                    <asp:Label ID="Дата_времяLabel" runat="server" Text='<%# Eval("[Дата/время]") %>' />
                    <br />
                    <asp:Label ID="АВИАЛАЙНЕР_Label1" runat="server" Text='<%# Eval("[АВИАЛАЙНЕР]") %>' />
                    <br />
                    <div class="btn-book">
                        <asp:ImageButton ID="ImageButton3" runat="server" Width="150px" ImageUrl="~/images/buy.png" />
                    </div>
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" ></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #FFCC66;font-weight: bold;color: black;">Номер рейса:
                    <asp:Label ID="Номер_рейсаLabel" runat="server" Text='<%# Eval("[Номер рейса]") %>' />
                    <br />
                    ОТКУДА:
                    <asp:Label ID="ОТКУДАLabel" runat="server" Text='<%# Eval("ОТКУДА") %>' />
                    <br />
                    Город вылет:
                    <asp:Label ID="Город_вылетLabel" runat="server" Text='<%# Eval("[Город вылет]") %>' />
                    <br />
                    Аэропорт вылет:
                    <asp:Label ID="Аэропорт_вылетLabel" runat="server" Text='<%# Eval("[Аэропорт вылет]") %>' />
                    <br />
                    КУДА:
                    <asp:Label ID="КУДАLabel" runat="server" Text='<%# Eval("КУДА") %>' />
                    <br />
                    Город прибытие:
                    <asp:Label ID="Город_прибытиеLabel" runat="server" Text='<%# Eval("[Город прибытие]") %>' />
                    <br />
                    Аэропорт прибытие:
                    <asp:Label ID="Аэропорт_прибытиеLabel" runat="server" Text='<%# Eval("[Аэропорт прибытие]") %>' />
                    <br />
                    Дата/время:
                    <asp:Label ID="Дата_времяLabel" runat="server" Text='<%# Eval("[Дата/время]") %>' />
                    <br />
                    Авиалайнер:
                    <asp:Label ID="АВИАЛАЙНЕР_Label1" runat="server" Text='<%# Eval("[АВИАЛАЙНЕР]") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        
        </div>
        
    </div>
    

</asp:Content>

