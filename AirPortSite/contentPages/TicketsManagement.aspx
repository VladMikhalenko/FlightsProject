<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/GlobalMasterPage.master" AutoEventWireup="true" CodeFile="TicketsManagement.aspx.cs" Inherits="contentPages_TicketsManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../App_Themes/RegTheme/Reg.css?v=@DateTime.Now.Milliseconds?v=@DateTime.Now.Milliseconds" rel="stylesheet" type="text/css" />
    <table class="table-form">
        <tr>
            <td>
                Таблица цен на билеты:
            </td>
            <td>
                 Краткая таблица рейсов:
                
            </td>
        </tr>
        <tr>
            <td>
               <div class="edit-list" >
            <asp:GridView ID="GridView1"  CssClass="scroll-view" runat="server" AutoGenerateColumns="False" DataKeyNames="Id,Type,id_flight" DataSourceID="SqlDataSource1" EmptyDataText="Нет записей для отображения." CellPadding="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="True" SortExpression="Type" />
                <asp:BoundField DataField="id_flight" HeaderText="id_flight" SortExpression="id_flight" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
            </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        </div>
            </td>
            <td>
                 <div class="edit-list" >   
            <asp:GridView ID="GridView2" CssClass="scroll-view" runat="server" AutoGenerateColumns="False" DataSourceID="SqlFlightShortSource" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="Номер" HeaderText="Номер" SortExpression="Номер" />
                    <asp:BoundField DataField="ОТКУДА" HeaderText="ОТКУДА" SortExpression="ОТКУДА" />
                    <asp:BoundField DataField="Вылет" HeaderText="Вылет" SortExpression="Вылет" />
                    <asp:BoundField DataField="КУДА" HeaderText="КУДА" SortExpression="КУДА" />
                    <asp:BoundField DataField="Прибытие" HeaderText="Прибытие" SortExpression="Прибытие" />
                    <asp:BoundField DataField="Лайнер" HeaderText="Лайнер" SortExpression="Лайнер" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
        </div>  
            </td>
        </tr>
    </table>
        
        
      
        
       
    
    <asp:SqlDataSource ID="SqlFlightShortSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Номер рейса] as Номер, [ОТКУДА], [Город вылет] AS Вылет, [КУДА], [Город прибытие] AS Прибытие, [АВИАЛАЙНЕР] AS Лайнер FROM [FlightView]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [TicketType] WHERE [Id] = @Id AND [Type] = @Type AND [id_flight] = @id_flight" InsertCommand="INSERT INTO [TicketType] ([Type], [id_flight], [Cost]) VALUES (@Type, @id_flight, @Cost)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Id], [Type], [id_flight], [Cost] FROM [TicketType]" UpdateCommand="UPDATE [TicketType] SET [Cost] = @Cost WHERE [Id] = @Id AND [Type] = @Type AND [id_flight] = @id_flight">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="id_flight" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="id_flight" Type="Int32" />
            <asp:Parameter Name="Cost" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Cost" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="id_flight" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <div class="tb-div">
        <div class="table-form">
            Рейс:<asp:TextBox ID="tbFlight" TextMode="Number" runat="server"></asp:TextBox>
            Класс:<asp:DropDownList ID="ddClass" runat="server">
                <asp:ListItem>ПЕРВЫЙ</asp:ListItem>
                <asp:ListItem>БИЗНЕСС</asp:ListItem>
                <asp:ListItem>ЭКОНОМ</asp:ListItem>
            </asp:DropDownList>
            Цена:<asp:TextBox ID="tbPrice" TextMode="Number" runat="server"></asp:TextBox><br/>
            <asp:Button ID="btnAdd" runat="server" Text="Добавить" OnClick="btnAdd_Click" /><br />
            <asp:Label ID="lbNotify" CssClass="notify" runat="server" Text=""></asp:Label>
        </div>
    </div>

    <div class="tb-div">
    Укажите номер рейса<asp:DropDownList ID="ddFlightNum" runat="server" DataSourceID="SqlFlightID" DataTextField="Id" DataValueField="Id" AutoPostBack="True" OnSelectedIndexChanged="ddFlightNum_SelectedIndexChanged"></asp:DropDownList>        
    </div>
    <asp:SqlDataSource ID="SqlFlightID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id] FROM [Flight]"></asp:SqlDataSource>
    <div class="list">
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlUserDataSource" OnItemCommand="ListView1_ItemCommand">
                <AlternatingItemTemplate>
                    <li style="background-color:white; width:95%;">
                        Номер заказа:<asp:Label ID="Номер_заказаLabel" runat="server" Text='<%# Eval("[Номер заказа]") %>' />
                        <br />
                        Номер рейса:<asp:Label ID="Номер_рейсаLabel1" runat="server" Text='<%# Eval("[Номер рейса]") %>' />
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
                        Номер рейса:<asp:Label ID="Номер_рейсаLabel1" runat="server" Text='<%# Eval("[Номер рейса]") %>' />
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

            <asp:SqlDataSource ID="SqlUserDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Номер заказа], [Откуда], [Город вылета], [Аэропорт вылет], [Куда], [Город прибытия], [Аэропорт прибытие], [Дата/время], [Место], [Цена], [Класс], [Номер рейса] FROM [UserTicketsView]">
            </asp:SqlDataSource>
        </div>
</asp:Content>

