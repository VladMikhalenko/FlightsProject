<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/GlobalMasterPage.master" AutoEventWireup="true" CodeFile="TicketPurchase.aspx.cs" Inherits="contentPages_TicketPurchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../App_Themes/RegTheme/Reg.css?v=@DateTime.Now.Milliseconds?v=@DateTime.Now.Milliseconds" rel="stylesheet" type="text/css" />
    <div >
        
        <br />
        <table class="table-form">
            <tr>
                <td colspan="4">
                    МЕНЮ ПОКУПКИ БИЛЕТА НА РЕЙС:<asp:Label ID="lbFlNum" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbFCountry" runat="server" Text="ОТКУДА:"></asp:Label><br />
                    <asp:Label ID="lbFCity" runat="server" Text="Город вылета:"></asp:Label><br />
                    <asp:Label ID="lbFAirpt" runat="server" Text="Аэропорт:"></asp:Label><br />
                    <asp:Label ID="lbFDate" runat="server" Text="Дата/время:"></asp:Label><br />
                </td>
                <td>

                </td>
                <td>
                    <asp:Label ID="lbToCountry" runat="server" Text="КУДА:"></asp:Label><br />
                    <asp:Label ID="lbToCity" runat="server" Text="Город прибытия:"></asp:Label><br />
                    <asp:Label ID="lbToAirpt" runat="server" Text="Аэропорт:"></asp:Label><br />
                    <asp:Label ID="lbPlane" runat="server" Text="Авиалайнер:"></asp:Label><br />
                </td>
                <td>
                    <div class="buy_block">
                        <table class="table-form">
                            <tr>
                                <td>
                                    Тип билета:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddClass" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddClass_SelectedIndexChanged">
                                        <asp:ListItem>ПЕРВЫЙ</asp:ListItem>
                                        <asp:ListItem>БИЗНЕСС</asp:ListItem>
                                        <asp:ListItem>ЭКОНОМ</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                     Номер места:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddTicket" runat="server" AutoPostBack="True"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Стоимость:
                                </td>
                                <td>
                                    <asp:Label ID="lbCost" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnOrder" runat="server" Text="Заказать" Width="219px" OnClick="btnOrder_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <div class="notify">
                        <asp:Label ID="lbNotify" runat="server" Text=""></asp:Label>
                        Для просмотра информации о заказах перейдите в личный кабинет
                    </div>
                </td>
                
            </tr>
        </table>
        <div class="tb-div">
            <asp:Image ID="planeImg" runat="server" />
            <br />
        </div>
        

        


    </div>
</asp:Content>

