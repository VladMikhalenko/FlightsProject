<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/GlobalMasterPage.master" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="contentPages_LoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../App_Themes/RegTheme/Reg.css?v=@DateTime.Now.Milliseconds?v=@DateTime.Now.Milliseconds" rel="stylesheet" type="text/css" />
    <div class="tb-div" >
        <table class="table-form">
            <tr>
                <td colspan="2" class="notify">
                    Для заказа билетов необходимо выполнить вход
                </td>
            </tr>
            <tr>
                <td>
                    Логин:
                </td>
                <td>
                    <asp:TextBox ID="tbLogin" runat="server" MaxLength="15"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Пароль:
                </td>
                <td>
                    <asp:TextBox ID="tbPwd" TextMode="Password" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Войти" OnClick="btnSubmit_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="notify">
                    <asp:Label ID="lbNotify" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
   
    
</asp:Content>

