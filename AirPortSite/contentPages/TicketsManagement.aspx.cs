using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contentPages_TicketsManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
            //lbNotify.Text = "Заказ номер " + order_id + " отменен!";
        }
        catch (Exception ex)
        {
            //lbNotify.Text = "Произошла ошибка!";
        }
        finally
        {
            conn.Close();
            executeSearch();
        }
    }
    private void executeSearch()
    {
        string query = "SELECT [Номер заказа],[Номер рейса],[Откуда], [Город вылета], [Аэропорт вылет], [Куда], [Город прибытия], [Аэропорт прибытие], [Дата/время], [Место], [Цена], [Класс] FROM [UserTicketsView] ";
        int f_id = Convert.ToInt32(ddFlightNum.SelectedValue);
        //string _date = !string.IsNullOrEmpty(ddDate.SelectedValue) ? Convert.ToDateTime(ddDate.SelectedValue).ToString() : "";
        if (f_id!=0)
            query += "WHERE [Номер рейса] ="+f_id;
        //if (!string.IsNullOrEmpty(_date))
        //    query += " AND [Дата/время]='" + _date + "'";
        SqlUserDataSource.SelectCommand = query;
        SqlUserDataSource.Select(DataSourceSelectArguments.Empty);
    }
    protected void ddFlightNum_SelectedIndexChanged(object sender, EventArgs e)
    {
        executeSearch();
    }

    private bool CheckFlightID(int id)
    {
        if(id>0)
        {
            string query = "SELECT [Id] FROM [Flight] WHERE [Id]=" + id;

            string strCon = System.Web
                                 .Configuration
                                 .WebConfigurationManager
                                 .ConnectionStrings["ConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(strCon);
            SqlCommand comm = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader nwReader = comm.ExecuteReader();
            if (nwReader.HasRows)
            {
                conn.Close();
                return true;
            }
            else
            {
                conn.Close();
                return false;
            }
        }
        return false;
        
    }
    private string GetPlaneName(int id)
    {
        string name = "";
        if (id > 0)
        {
            string query = "SELECT [АВИАЛАЙНЕР] FROM [FlightView] WHERE [Номер рейса]=" + id;

            string strCon = System.Web
                                 .Configuration
                                 .WebConfigurationManager
                                 .ConnectionStrings["ConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(strCon);
            SqlCommand comm = new SqlCommand(query, conn);
            
            conn.Open();
            SqlDataReader nwReader = comm.ExecuteReader();
            if (nwReader.HasRows)
            {
                while (nwReader.Read())
                {
                    name = (Convert.ToString(nwReader["АВИАЛАЙНЕР"]));
                }
            }
            conn.Close();
        }
        return name;
    }

    private bool CheckTicket(int id,string type)
    {
        bool flag = true;
        if (id > 0 && !string.IsNullOrEmpty(type) && type.Length < 5)
        {
            string query = "SELECT * FROM [TicketType] WHERE [id_flight]=" + id + " AND [Type]=N'" + type + "'";

            string strCon = System.Web
                                 .Configuration
                                 .WebConfigurationManager
                                 .ConnectionStrings["ConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(strCon);
            SqlCommand comm = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader nwReader = comm.ExecuteReader();
            if (nwReader.HasRows)
                flag = false;
            conn.Close();
        }
        return flag;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int id = string.IsNullOrEmpty(tbFlight.Text) ? -1 : Convert.ToInt32(tbFlight.Text);
        string ticket = ddClass.SelectedValue.Substring(0,4);
        int price = string.IsNullOrEmpty(tbPrice.Text) ? -1 : Convert.ToInt32(tbPrice.Text);

        if (id < 0 || price < 0 || string.IsNullOrEmpty(ticket))
        {
            lbNotify.Text = "Поля заполнены неверно";
            return;
        }
        if(!CheckFlightID(id) )
        {
            lbNotify.Text = "Значение id неверно";
            return;
        }
        if (!CheckTicket(id, ticket))
        {
            lbNotify.Text = "Данный тип билета уже представлен в БД";
            return;
        }

        string plane = GetPlaneName(id);
        if((plane=="АН" || plane=="AIRBUS") && ticket=="ПЕРВ")
        {
            lbNotify.Text = "Первый класс билетов отстутствует на данный рейс";
            return;
        }
        string query = String.Format("INSERT INTO [TicketType] (Type,id_flight,Cost) VALUES(N'{0}',{1},{2})",
            ticket, id, price);
        SqlFlightID.InsertCommand = query;
        try
        {
            SqlFlightID.Insert();
            lbNotify.Text = "Запись успешно добавлена в БД!";
        }
        catch (Exception ex)
        {
            lbNotify.Text = "Произошла ошибка добавления:" + ex.Message;
        }
        GridView1.DataBind();

    }
}