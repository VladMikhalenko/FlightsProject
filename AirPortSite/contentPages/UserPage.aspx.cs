using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contentPages_UserPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["Role"]) == 1 || Session["Role"] == null)
            Response.Redirect("LoginPage.aspx");
        lbLogin.Text ="Логин:"+ Convert.ToString(Session["Login"]);
        lbName.Text= "ФИО:"+Convert.ToString(Session["Name"]);
        lbBirth.Text = "Дата рождения:"+Convert.ToDateTime(Session["Birth"]).ToString("dd.MM.yyyy");
        lbTel.Text= "Телефон:"+Convert.ToString(Session["Telephone"]);
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        ListViewItem item = e.Item;
        int order_id = Convert.ToInt32((e.Item.FindControl("Номер_заказаLabel") as Label).Text);
        string query = "DELETE FROM [TicketOrder] WHERE Id=@id";
        string strCon = System.Web
                             .Configuration
                             .WebConfigurationManager
                             .ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(strCon);
        SqlCommand comm = new SqlCommand(query, conn);
        comm.Parameters.Add(new SqlParameter("@id", order_id));

        conn.Open();
        try
        {
            comm.ExecuteNonQuery();
            lbNotify.Text = "Заказ номер "+order_id+" отменен!";
        }
        catch (Exception ex)
        {
            lbNotify.Text = "Произошла ошибка!";
        }
        finally
        {
            conn.Close();
            executeSearch();   
        }
    }

    private void executeSearch()
    {
        string query = String.Format("SELECT [Номер заказа],[Откуда], [Город вылета], [Аэропорт вылет], [Куда], [Город прибытия], [Аэропорт прибытие], [Дата/время], [Место], [Цена], [Класс] FROM [UserTicketsView] WHERE ([ClientID] = " + Convert.ToInt32(Session["UserID"]) + ")");
        string _country = tbCountry.Text.ToUpper();
        //string _date = !string.IsNullOrEmpty(ddDate.SelectedValue) ? Convert.ToDateTime(ddDate.SelectedValue).ToString() : "";
        if (!string.IsNullOrEmpty(_country))
            query += " AND ([Откуда]=N'" + _country + "' OR [Куда]=N'" + _country + "')";
        //if (!string.IsNullOrEmpty(_date))
        //    query += " AND [Дата/время]='" + _date + "'";
        SqlUserDataSource.SelectCommand = query;
        SqlUserDataSource.Select(DataSourceSelectArguments.Empty);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        executeSearch();
    }
}