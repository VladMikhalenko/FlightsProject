using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contentPages_FlightsManagementPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["Role"]) != 3)
            Response.Redirect("FlightsPage.aspx");
        if(!IsPostBack)
        {
            ReadData("Airport", "Country", ddFromCity, ref ddFromCountry);
            ReadData("Airport", "City", ddFromCountry, ref ddFromCity, "Country");
            ReadData("Airport", "Name", ddFromCity, ref ddFromAirport, "City");

            ReadData("Airport", "Country", ddToCity, ref ddToCountry);
            ReadData("Airport", "City", ddToCountry, ref ddToCity, "Country");
            ReadData("Airport", "Name", ddToCity, ref ddToAirport, "City");
        }
        if(ddQueryType.SelectedValue=="Добавление")
        {
            ddFromCountry.Enabled = true;
            ddFromCity.Enabled = true;
            ddFromAirport.Enabled = true;
            ddToCountry.Enabled = true;
            ddToCity.Enabled = true;
            ddToAirport.Enabled = true;
            tbDate.Enabled = true;
            ddPlane.Enabled = true;
        }
        else
        {
            ddFromCountry.Enabled = false ;
            ddFromCity.Enabled = false ;
            ddFromAirport.Enabled = false;
            ddToCountry.Enabled = false;
            ddToCity.Enabled = false;
            ddToAirport.Enabled = false;
            tbDate.Enabled = false;
            ddPlane.Enabled = false;
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        lbId.Text = row.Cells[1].Text;
        //tbFromCountry.Text = row.Cells[2].Text;
        //tbFromCity.Text = row.Cells[3].Text;
        //tbFromAirport.Text = row.Cells[4].Text;
        //tbToCountry.Text = row.Cells[5].Text;
        //tbToCity.Text = row.Cells[6].Text;
        //tbToAirport.Text = row.Cells[7].Text;
        //tbDate.Text = row.Cells[8].Text;
    }

    private int GetAirportId(string city,string airport)
    {
        int id = -1;
        if(!string.IsNullOrEmpty(airport) && !string.IsNullOrEmpty(city))
        {
            string query = "SELECT [Id] FROM [Airport] WHERE [Name]=N'"+airport+"' AND [City]=N'"+city+"'";
            
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
                    id=Convert.ToInt32(nwReader["Id"]);
                }
            }
            conn.Close();
        }
        //else
        //{
        //    throw new ArgumentException();
        //}

        return id;
    }
    private void ExecuteInsert()
    {
        if (ddFromCity.SelectedValue == ddToCity.SelectedValue || ddFromAirport.SelectedValue == ddToAirport.SelectedValue)
        {
            lbNotify.Text = "Введены некорректные данные";
            return;
        }

        //DateTime date;
        //if (DateTime.TryParseExact(tbDate.Text, "yyyy-dd-MM hh:mm",CultureInfo.InvariantCulture,DateTimeStyles.None,out date) || string.IsNullOrEmpty(tbDate.Text))
        string date = Convert.ToDateTime(tbDate.Text).ToString("yyyy-MM-dd hh:mm:ss");
        if(Convert.ToDateTime(date).Year==0001)
        {
            lbNotify.Text = "Введена неверная дата";
            return;
        }
        int id_from = GetAirportId(ddFromCity.SelectedValue, ddFromAirport.SelectedValue);
        int id_to = GetAirportId(ddToCity.SelectedValue, ddToAirport.SelectedValue);
        int id_plane = Convert.ToInt32(ddPlane.SelectedValue);

        if(id_from<0 || id_to<0 || id_plane<0)
        {
            lbNotify.Text = "Произошла ошибка доступа к БД, обратитесь в поддержку";
            return;
        }
        //string d = date.ToString("yyyyMMdd hh:mm");
        string query = String.Format("INSERT INTO [Flight] (id_from,id_to,date,id_pl) VALUES({0},{1},'{2}',{3})",
            id_from,id_to,date,id_plane);
        SqlPlanesSource.InsertCommand = query;
        try
        {
            SqlPlanesSource.Insert();
            lbNotify.Text = "Запись успешно добавлена в БД!";
        }
        catch(Exception ex)
        {
            lbNotify.Text = "Произошла ошибка добавления:" + ex.Message;
        }
        GridView1.DataBind();

    }
    private void ExecuteActivation()
    {
        if(string.IsNullOrEmpty(lbId.Text))
        {
            lbNotify.Text = "Для изменения состояния рейса выберите строку из таблицы ниже";
            return;
        }
        string id = lbId.Text;
        string query = "UPDATE [Flight] SET [activated]=~activated WHERE [Id]=" + id;
        SqlPlanesSource.UpdateCommand= query;
        try
        {
            SqlPlanesSource.Update();
            lbNotify.Text = "Активность рейса номер " + lbId.Text + " изменена!";
        }
        catch (Exception ex)
        {
            lbNotify.Text = "Произошла ошибка изменения состояния рейса!";
        }
        GridView1.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        switch(ddQueryType.SelectedValue)
        {
            case "Добавление":ExecuteInsert();
                break;
            case "Активация":ExecuteActivation();
                break;
        }
    }

    private void ReadData(string table, string selectCol,  DropDownList dd, ref DropDownList ddRes, string whereCol = "")
    {
        string data = !string.IsNullOrEmpty(dd.SelectedValue)? dd.SelectedValue:"";
        string query = "SELECT DISTINCT [" + selectCol + "] FROM [" + table+"] ";
        if(whereCol!="")
            query+=" WHERE ["+whereCol+"] =N'"+data+"' ";
        string strCon = System.Web
                             .Configuration
                             .WebConfigurationManager
                             .ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(strCon);
        SqlCommand comm = new SqlCommand(query, conn);
        conn.Open();
        SqlDataReader nwReader = comm.ExecuteReader();
        ddRes.Items.Clear();
        if (nwReader.HasRows)
        {
            while (nwReader.Read())
            {
                ddRes.Items.Add(Convert.ToString(nwReader[selectCol]));
            }
        }
        conn.Close();
    }

    protected void ddFromCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        ReadData("Airport", "City", ddFromCountry, ref ddFromCity, "Country");
        ReadData("Airport", "Name", ddFromCity, ref ddFromAirport, "City");
    }

    protected void ddFromCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        ReadData("Airport", "Name", ddFromCity, ref ddFromAirport, "City");
    }

    protected void ddToCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        ReadData("Airport", "City", ddToCountry, ref ddToCity, "Country");
        ReadData("Airport", "Name", ddToCity, ref ddToAirport, "City");
    }

    protected void ddToCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        ReadData("Airport", "Name", ddToCity, ref ddToAirport, "City");
    }
}