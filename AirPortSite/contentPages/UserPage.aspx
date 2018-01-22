<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/GlobalMasterPage.master" AutoEventWireup="true" CodeFile="UserPage.aspx.cs" Inherits="contentPages_UserPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../App_Themes/RegTheme/Reg.css?v=@DateTime.Now.Milliseconds?v=@DateTime.Now.Milliseconds" rel="stylesheet" type="text/css" />
    <div class="user-content">
        <table class="table-form">
            <tr>
                <td >
                    <asp:Label ID="lbLogin" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lbName" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lbBirth" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lbTel" runat="server" Text=""></asp:Label><br />
                </td>
            </tr>
            <tr >
                <td class="notify" colspan="2">
                    <asp:Label ID="lbNotify" runat="server" Text=""></asp:Label>
                </td>
            
            </tr>
        </table>

        <div class="tb-div">
            <div class="table-form">
                Страна:<asp:TextBox ID="tbCountry" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Поиск" />
            </div>
        </div>
        <div class="list">
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlUserDataSource" OnItemCommand="ListView1_ItemCommand">
                <AlternatingItemTemplate>
                    <li style="background-color:white; width:95%;">
                        Номер заказа:<asp:Label ID="Номер_заказаLabel" runat="server" Text='<%# Eval("[Номер заказа]") %>' />
                        <br />
                        Откуда:
                        <asp:Label ID="ОткудаLabel" runat="server" Text='<%# Eval("Откуда") %>' />
                        <br />
                        Город вылета:
                        <asp:Label ID="Город_вылетаLabel" runat="server" Text='<%# Eval("[Город вылета]") %>' />
                        <br />
                        Аэропорт вылет:
                        <asp:Label ID="Аэропорт_вылетLabel" runat="server" Text='<%# Eval("[Аэропорт вылет]") %>' />
                        <br />
                        Куда:
                        <asp:Label ID="КудаLabel" runat="server" Text='<%# Eval("Куда") %>' />
                        <br />
                        Город прибытия:
                        <asp:Label ID="Город_прибытияLabel" runat="server" Text='<%# Eval("[Город прибытия]") %>' />
                        <br />
                        Аэропорт прибытие:
                        <asp:Label ID="Аэропорт_прибытиеLabel" runat="server" Text='<%# Eval("[Аэропорт прибытие]") %>' />
                        <br />
                        Дата/время:
                        <asp:Label ID="Дата_времяLabel" runat="server" Text='<%# Eval("[Дата/время]") %>' />
                        <br />
                        Место:
                        <asp:Label ID="МестоLabel" runat="server" Text='<%# Eval("Место") %>' />
                        <br />
                        Цена:
                        <asp:Label ID="ЦенаLabel" runat="server" Text='<%# Eval("Цена") %>' />
                        <br />
                        Класс:
                        <asp:Label ID="КлассLabel" runat="server" Text='<%# Eval("Класс") %>' />
                        <br />
                        <asp:Button ID="btnDelete" runat="server" Text="Отменить заказ" />
                    </li>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <li style="">Номер заказа:
                        <asp:TextBox ID="Номер_заказаTextBox" runat="server" Text='<%# Bind("[Номер заказа]") %>' />
                        <br />
                        Откуда:
                        <asp:TextBox ID="ОткудаTextBox" runat="server" Text='<%# Bind("Откуда") %>' />
                        <br />
                        Город вылета:
                        <asp:TextBox ID="Город_вылетаTextBox" runat="server" Text='<%# Bind("[Город вылета]") %>' />
                        <br />
                        Аэропорт вылет:
                        <asp:TextBox ID="Аэропорт_вылетTextBox" runat="server" Text='<%# Bind("[Аэропорт вылет]") %>' />
                        <br />
                        Куда:
                        <asp:TextBox ID="КудаTextBox" runat="server" Text='<%# Bind("Куда") %>' />
                        <br />
                        Город прибытия:
                        <asp:TextBox ID="Город_прибытияTextBox" runat="server" Text='<%# Bind("[Город прибытия]") %>' />
                        <br />
                        Аэропорт прибытие:
                        <asp:TextBox ID="Аэропорт_прибытиеTextBox" runat="server" Text='<%# Bind("[Аэропорт прибытие]") %>' />
                        <br />
                        Дата/время:
                        <asp:TextBox ID="Дата_времяTextBox" runat="server" Text='<%# Bind("[Дата/время]") %>' />
                        <br />
                        Место:
                        <asp:TextBox ID="МестоTextBox" runat="server" Text='<%# Bind("Место") %>' />
                        <br />
                        Цена:
                        <asp:TextBox ID="ЦенаTextBox" runat="server" Text='<%# Bind("Цена") %>' />
                        <br />
                        Класс:
                        <asp:TextBox ID="КлассTextBox" runat="server" Text='<%# Bind("Класс") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Обновить" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Отмена" />
                    </li>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    Нет данных.
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <li style="">Номер заказа:
                        <asp:TextBox ID="Номер_заказаTextBox" runat="server" Text='<%# Bind("[Номер заказа]") %>' />
                        <br />
                        Откуда:
                        <asp:TextBox ID="ОткудаTextBox" runat="server" Text='<%# Bind("Откуда") %>' />
                        <br />
                        Город вылета:
                        <asp:TextBox ID="Город_вылетаTextBox" runat="server" Text='<%# Bind("[Город вылета]") %>' />
                        <br />
                        Аэропорт вылет:
                        <asp:TextBox ID="Аэропорт_вылетTextBox" runat="server" Text='<%# Bind("[Аэропорт вылет]") %>' />
                        <br />
                        Куда:
                        <asp:TextBox ID="КудаTextBox" runat="server" Text='<%# Bind("Куда") %>' />
                        <br />
                        Город прибытия:
                        <asp:TextBox ID="Город_прибытияTextBox" runat="server" Text='<%# Bind("[Город прибытия]") %>' />
                        <br />
                        Аэропорт прибытие:
                        <asp:TextBox ID="Аэропорт_прибытиеTextBox" runat="server" Text='<%# Bind("[Аэропорт прибытие]") %>' />
                        <br />
                        Дата/время:
                        <asp:TextBox ID="Дата_времяTextBox" runat="server" Text='<%# Bind("[Дата/время]") %>' />
                        <br />
                        Место:
                        <asp:TextBox ID="МестоTextBox" runat="server" Text='<%# Bind("Место") %>' />
                        <br />
                        Цена:
                        <asp:TextBox ID="ЦенаTextBox" runat="server" Text='<%# Bind("Цена") %>' />
                        <br />
                        Класс:
                        <asp:TextBox ID="КлассTextBox" runat="server" Text='<%# Bind("Класс") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Вставить" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Очистить" />
                    </li>
                </InsertItemTemplate>
                <ItemSeparatorTemplate>
                    <br />
                </ItemSeparatorTemplate>
                <ItemTemplate>
                    <li style="background-color:white; width:95%;">Номер заказа:
                        <asp:Label ID="Номер_заказаLabel" runat="server" Text='<%# Eval("[Номер заказа]") %>' />
                        <br />
                        Откуда:
                        <asp:Label ID="ОткудаLabel" runat="server" Text='<%# Eval("Откуда") %>' />
                        <br />
                        Город вылета:
                        <asp:Label ID="Город_вылетаLabel" runat="server" Text='<%# Eval("[Город вылета]") %>' />
                        <br />
                        Аэропорт вылет:
                        <asp:Label ID="Аэропорт_вылетLabel" runat="server" Text='<%# Eval("[Аэропорт вылет]") %>' />
                        <br />
                        Куда:
                        <asp:Label ID="КудаLabel" runat="server" Text='<%# Eval("Куда") %>' />
                        <br />
                        Город прибытия:
                        <asp:Label ID="Город_прибытияLabel" runat="server" Text='<%# Eval("[Город прибытия]") %>' />
                        <br />
                        Аэропорт прибытие:
                        <asp:Label ID="Аэропорт_прибытиеLabel" runat="server" Text='<%# Eval("[Аэропорт прибытие]") %>' />
                        <br />
                        Дата/время:
                        <asp:Label ID="Дата_времяLabel" runat="server" Text='<%# Eval("[Дата/время]") %>' />
                        <br />
                        Место:
                        <asp:Label ID="МестоLabel" runat="server" Text='<%# Eval("Место") %>' />
                        <br />
                        Цена:
                        <asp:Label ID="ЦенаLabel" runat="server" Text='<%# Eval("Цена") %>' />
                        <br />
                        Класс:
                        <asp:Label ID="КлассLabel" runat="server" Text='<%# Eval("Класс") %>' />
                        <br />
                        <asp:Button ID="btnDelete" runat="server" Text="Отменить заказ" />
                    </li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul id="itemPlaceholderContainer" runat="server" style="">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div style="">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <li style="">Номер заказа:
                        <asp:Label ID="Номер_заказаLabel" runat="server" Text='<%# Eval("[Номер заказа]") %>' />
                        <br />
                        Откуда:
                        <asp:Label ID="ОткудаLabel" runat="server" Text='<%# Eval("Откуда") %>' />
                        <br />
                        Город вылета:
                        <asp:Label ID="Город_вылетаLabel" runat="server" Text='<%# Eval("[Город вылета]") %>' />
                        <br />
                        Аэропорт вылет:
                        <asp:Label ID="Аэропорт_вылетLabel" runat="server" Text='<%# Eval("[Аэропорт вылет]") %>' />
                        <br />
                        Куда:
                        <asp:Label ID="КудаLabel" runat="server" Text='<%# Eval("Куда") %>' />
                        <br />
                        Город прибытия:
                        <asp:Label ID="Город_прибытияLabel" runat="server" Text='<%# Eval("[Город прибытия]") %>' />
                        <br />
                        Аэропорт прибытие:
                        <asp:Label ID="Аэропорт_прибытиеLabel" runat="server" Text='<%# Eval("[Аэропорт прибытие]") %>' />
                        <br />
                        Дата/время:
                        <asp:Label ID="Дата_времяLabel" runat="server" Text='<%# Eval("[Дата/время]") %>' />
                        <br />
                        Место:
                        <asp:Label ID="МестоLabel" runat="server" Text='<%# Eval("Место") %>' />
                        <br />
                        Цена:
                        <asp:Label ID="ЦенаLabel" runat="server" Text='<%# Eval("Цена") %>' />
                        <br />
                        Класс:
                        <asp:Label ID="КлассLabel" runat="server" Text='<%# Eval("Класс") %>' />
                        <br />
                    </li>
                </SelectedItemTemplate>
            </asp:ListView>

            <asp:SqlDataSource ID="SqlUserDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Номер заказа],[Откуда], [Город вылета], [Аэропорт вылет], [Куда], [Город прибытия], [Аэропорт прибытие], [Дата/время], [Место], [Цена], [Класс] FROM [UserTicketsView] WHERE ([ClientID] = @ClientID)">
                <SelectParameters>
                    <asp:SessionParameter Name="ClientID" SessionField="UserId" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>

