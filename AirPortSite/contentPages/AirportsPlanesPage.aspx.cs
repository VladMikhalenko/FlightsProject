using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contentPages_AdminFlightsPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["Role"]) != 3 || Session["Role"] == null)
            Response.Redirect("FlightsPage.aspx");

    }

/*
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string name = tbName.Text;
        int capacity;
        if(!Int32.TryParse(tbCapacity.Text,out capacity) || capacity<0)
        {
            lbNotify.Text = "Недопустимое значение вместимости";
            return;
        }
        if(string.IsNullOrEmpty(name))
        {
            lbNotify.Text = "Поле имени не может быть пустым";
            return;
        }

        string query = String.Format("INSERT INTO [Plane] (Name,Capacity) VALUES(N'{0}',{1})",
            name,capacity);
        SqlDataSource1.InsertCommand = query;
        try
        {
            SqlDataSource1.Insert();
            lbNotify.Text = "Запись успешно добавлена в БД!";
        }
        catch (Exception ex)
        {
            lbNotify.Text = "Произошла ошибка добавления:" + ex.Message;
        }
    }
    */

    protected void btnAddAirport_Click(object sender, EventArgs e)
    {
        string country = tbCountry.Text.ToUpper();
        string city = tbCity.Text.ToUpper();
        string adress = tbAdress.Text.ToUpper();
        string name = tbAName.Text.ToUpper();
        if (string.IsNullOrEmpty(country) || string.IsNullOrEmpty(city) || string.IsNullOrEmpty(adress) || string.IsNullOrEmpty(name))
        {
            lbNotify.Text = "Все поля должны быть заполнены";
            return;
        }

        string query = String.Format("INSERT INTO [Airport] (Country,City,Address,Name) VALUES(N'{0}',N'{1}',N'{2}',N'{3}')",
            country, city,adress,name);
        SqlDataSource1.InsertCommand = query;
        try
        {
            SqlDataSource1.Insert();
            lbNotify.Text = "Запись успешно добавлена в БД!";
        }
        catch (Exception ex)
        {
            lbNotify.Text = "Произошла ошибка добавления аэропорта:" + ex.Message;
        }
        GridView2.DataBind();
    }
}