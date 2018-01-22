using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
public partial class contentPages_RegistrationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LoadDays();
            LoadYears();
        }
            
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string name = tbName.Text;
        string bDay = String.Format("{0}{1}{2}",ddYear.SelectedValue,
            ddMonth.SelectedIndex+1<10?"0"+ (ddMonth.SelectedIndex+1).ToString():(ddMonth.SelectedIndex+1).ToString(),
            Convert.ToInt32(ddDay.SelectedValue)<10? "0"+ddDay.SelectedValue:ddDay.SelectedValue);//!string.IsNullOrEmpty(tbBirth.Text)?Convert.ToDateTime(tbBirth.Text).ToString("yyyyMMdd"):"";
        string tel = tbTel.Text;
        string login = tbLog.Text;
        string pwd = tbPwd.Text;
        string approvement = tbPwdApp.Text;
        if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(bDay) || string.IsNullOrEmpty(tel) || string.IsNullOrEmpty(login)||string.IsNullOrEmpty(pwd) || string.IsNullOrEmpty(approvement))
        {
            lbNotify.Text = "Не все поля заполнены";
            return;
        }
        if (!pwd.Equals(approvement))
        {
            lbNotify.Text = "Пароли не совпадают";
            return;
        }
        pwd = HashGenerator.GetHash(pwd);


        //VALIDATION!!!!!!!!!!!!!!!!!!!!!!!!


        string query = String.Format("INSERT INTO Client (FullName,BirthDay,telephone,pwd,login,id_role)" +
            "VALUES (N'{0}','{1}','{2}','{3}','{4}',{5})", name, bDay, tel,pwd,login,2);
        SqlDataSource1.InsertCommand = query;
        try
        {
            SqlDataSource1.Insert();
            lbNotify.Text = "Вы успешно зарегистрировались";
            
        }
        catch(Exception ex)
        {
            lbNotify.Text = "Прозошла ошибка:" + ex.Message;
        }
    }

    private void LoadDays()
    {
        int max = -1;
        #region some magic
        switch (ddMonth.SelectedValue)
        {
            case "Январь":max = 31;
                break;
            case "Февраль":max = 28;
                break;
            case "Март":max = 31;
                break;
            case "Апрель":max = 30;
                break;
            case "Май":max = 31;
                break;
            case "Июнь":max = 30;
                break;
            case "Июль":max = 31;
                break;
            case "Август":max = 31;
                break;
            case "Сентябрь":max = 30;
                break;
            case "Октябрь":max = 31;
                break;
            case "Ноябрь":max = 30;
                break;
            case "Декабрь":max = 31;
                break;
        }
        #endregion
        ddDay.Items.Clear();
        for (int i = 1; i <= max; i++)
            ddDay.Items.Add(i.ToString());
    }
    private void LoadYears()
    {
        for (int i = 1950; i <=DateTime.Now.Year; i++)
            ddYear.Items.Add(i.ToString());
    }

    protected void ddMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadDays();
    }
}