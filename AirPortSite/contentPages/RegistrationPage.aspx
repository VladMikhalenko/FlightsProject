<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/GlobalMasterPage.master" AutoEventWireup="true" CodeFile="RegistrationPage.aspx.cs" Inherits="contentPages_RegistrationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../App_Themes/RegTheme/Reg.css?v=@DateTime.Now.Milliseconds?v=@DateTime.Now.Milliseconds" rel="stylesheet" type="text/css" />
    <div class="tb-div">   
        <table class="table-form">
            <tr>
                <td colspan="3">
                    <div class="notify">
                        Для регистрации заполните все поля формы. Заполнение всех является обязательным
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    ФИО:
                </td>
                <td>
                    <asp:TextBox ID="tbName" runat="server" MaxLength="50"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td>Дата рождения:</td>
                <td>
                    <asp:DropDownList ID="ddMonth" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddMonth_SelectedIndexChanged">
                        <asp:ListItem>Январь</asp:ListItem>
                        <asp:ListItem>Февраль</asp:ListItem>
                        <asp:ListItem>Март</asp:ListItem>
                        <asp:ListItem>Апрель</asp:ListItem>
                        <asp:ListItem>Май</asp:ListItem>
                        <asp:ListItem>Июнь</asp:ListItem>
                        <asp:ListItem>Июль</asp:ListItem>
                        <asp:ListItem>Август</asp:ListItem>
                        <asp:ListItem>Сентябрь</asp:ListItem>
                        <asp:ListItem>Октябрь</asp:ListItem>
                        <asp:ListItem>Ноябрь</asp:ListItem>
                        <asp:ListItem>Декабрь</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddDay" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddYear" runat="server">
                    </asp:DropDownList>
                </td>
                <td>

                </td>
            </tr>
            <tr>
                <td>Номер телефона:</td>
                <td>
                    <asp:TextBox ID="tbTel" TextMode="Phone" runat="server" MaxLength="10"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td>Логин:</td>
                <td>
                    <asp:TextBox ID="tbLog" runat="server" MaxLength="15"></asp:TextBox>
                    
                </td>
            </tr>

            <tr>
                <td>Пароль (макс. 30 символов):</td>
                <td>
                    <asp:TextBox ID="tbPwd" TextMode="Password" runat="server" MaxLength="30"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td>Повторите пароль:</td>
                <td>
                    <asp:TextBox ID="tbPwdApp" TextMode="Password" runat="server" MaxLength="30"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td>
                    <div class="notify">
                    <asp:Label ID="lbNotify" runat="server"></asp:Label>
                     </div>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" ImageUrl="~/images/btnRegistration.png" OnClick="ImageButton1_Click" />
                </td>
                
            </tr>
        </table>
        
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Client]"></asp:SqlDataSource>
</asp:Content>

