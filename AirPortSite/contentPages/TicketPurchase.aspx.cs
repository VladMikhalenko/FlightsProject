using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contentPages_TicketPurchase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["Role"]) == 1 || Session["Role"]==null)
            Response.Redirect("LoginPage.aspx");
        if (Session["FromCountry"]==null)
            Response.Redirect("FlightPage.aspx");

        lbFlNum.Text =Convert.ToString(Session["FlightNum"]);
        lbFCountry.Text = "ОТКУДА:" + Convert.ToString(Session["FromCountry"]);
        lbFCity.Text = "Город вылета:"+Convert.ToString(Session["FromCity"]);
        lbFAirpt.Text = "Аэропорт:"+Convert.ToString(Session["FromAirport"]);
        lbFDate.Text = "Дата/Время:"+Convert.ToString(Session["Date"]);

        lbToCountry.Text = "КУДА:"+Convert.ToString(Session["ToCountry"]);
        lbToCity.Text = "Город прибытия:"+Convert.ToString(Session["ToCity"]);
        lbToAirpt.Text = "Аэропорт:"+Convert.ToString(Session["ToAirport"]);
        lbPlane.Text = "Авиалайнер:"+Convert.ToString(Session["Plane"]);

        string imgPlanePath = "";
        string plane = Convert.ToString(Session["Plane"]);
        switch (plane)
        {
            case "АН":
                {
                    imgPlanePath = "../images/AN.png";
                    ddClass.Items.Remove("ПЕРВЫЙ");
                }
                break;
            case "BOEING":
                {
                    imgPlanePath = "../images/BOEING.png";
                }
                break;
            case "AIRBUS":
                {
                    imgPlanePath = "../images/AIRBUS.png";
                    ddClass.Items.Remove("ПЕРВЫЙ");
                }
                break;
        }
        planeImg.ImageUrl=imgPlanePath;        
        if(!Page.IsPostBack)
            UpdateTickets();
            
        lbCost.Text = GetTicketPrice().ToString();
    }
    private void FillTickets(int low,int top)
    {
        ddTicket.Items.Clear();
        List<int> exist = ReadExistingTickets(low, top);
        for(int i=low;i<=top;i++)
        {
            if(!exist.Contains(i))
                ddTicket.Items.Add(i.ToString());
        }
    }
    private List<int> ReadExistingTickets(int low, int top)
    {
        int id_fl = Convert.ToInt32(Session["FlightNum"]);
        string type = ddClass.SelectedValue.Substring(0, 4);
        string query = String.Format("SELECT [place] FROM [FullTicket] "+
            "WHERE TICKET=N'{0}' AND FlightID={1} AND [place] BETWEEN {2} AND {3}",type,id_fl,low,top);
        string strCon = System.Web
                             .Configuration
                             .WebConfigurationManager
                             .ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(strCon);
        SqlCommand comm = new SqlCommand(query, conn);
        conn.Open();
        SqlDataReader nwReader = comm.ExecuteReader();
        List<int> values = new List<int>();
        if (nwReader.HasRows)
        {
            while (nwReader.Read())
            {
                values.Add(Convert.ToInt32(nwReader["place"]));
            }
        }
        conn.Close();
        return values;
    }
    private int GetTicketPrice()
    {
        string type = ddClass.SelectedValue.Substring(0, 4);
        int id_f = Convert.ToInt32(Convert.ToString(Session["FlightNum"]));

        string query = String.Format("SELECT [Cost] FROM [TicketType] WHERE [Type]=N'{0}' AND [id_flight]={1}", type, id_f);
        string strCon = System.Web
                             .Configuration
                             .WebConfigurationManager
                             .ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(strCon);
        SqlCommand comm = new SqlCommand(query, conn);
        conn.Open();
        SqlDataReader nwReader = comm.ExecuteReader();
        int price = 0;
        if (nwReader.HasRows)
        {
            while (nwReader.Read())
            {
                price=(Convert.ToInt32(nwReader["Cost"]));
            }
        }
        conn.Close();
        return price;
    }
    private int GetTicketTypeID()
    {
        string type = ddClass.SelectedValue.Substring(0, 4);
        int id_f = Convert.ToInt32(Convert.ToString(Session["FlightNum"]));

        string query = String.Format("SELECT [Id] FROM [TicketType] WHERE [Type]=N'{0}' AND [id_flight]={1}", type, id_f);
        string strCon = System.Web
                             .Configuration
                             .WebConfigurationManager
                             .ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(strCon);
        SqlCommand comm = new SqlCommand(query, conn);
        conn.Open();
        SqlDataReader nwReader = comm.ExecuteReader();
        int Id = 0;
        if (nwReader.HasRows)
        {
            while (nwReader.Read())
            {
                Id = (Convert.ToInt32(nwReader["Id"]));
            }
        }
        conn.Close();
        return Id;
    }
    private void UpdateTickets()
    {
        const int AN_BIS_FIRST = 1;
        const int AN_BIS_LAST = 8;
        const int AN_ECO_FIRST = 9;
        const int AN_ECO_LAST = 68;

        const int AIRBUS_BIS_FIRST = 1;
        const int AIRBUS_BIS_LAST = 20;
        const int AIRBUS_ECO_FIRST = 21;
        const int AIRBUS_ECO_LAST = 116;

        const int BOEING_PRI_FIRST = 1;
        const int BOEING_PRI_LAST = 16;
        const int BOEING_BIS_FIRST = 17;
        const int BOEING_BIS_LAST = 60;
        const int BOEING_ECO_FIRST = 61;
        const int BOEING_ECO_LAST = 242;

        if (ddClass.SelectedValue == "ПЕРВЫЙ")
        {
            switch (Convert.ToString(Session["plane"]))
            {
                case "BOEING":
                    FillTickets(BOEING_PRI_FIRST, BOEING_PRI_LAST);
                    break;
            }
        }
        else if (ddClass.SelectedValue == "БИЗНЕСС")
        {
            switch (Convert.ToString(Session["plane"]))
            {
                case "АН":
                    FillTickets(AN_BIS_FIRST, AN_BIS_LAST);
                    break;
                case "BOEING":
                    FillTickets(BOEING_BIS_FIRST, BOEING_BIS_LAST);
                    break;
                case "AIRBUS":
                    FillTickets(AIRBUS_BIS_FIRST, AIRBUS_BIS_LAST);
                    break;
            }
        }
        else if (ddClass.SelectedValue == "ЭКОНОМ")
        {
            switch (Convert.ToString(Session["plane"]))
            {
                case "АН":
                    FillTickets(AN_ECO_FIRST, AN_ECO_LAST);
                    break;
                case "BOEING":
                    FillTickets(BOEING_ECO_FIRST, BOEING_ECO_LAST);
                    break;
                case "AIRBUS":
                    FillTickets(AIRBUS_ECO_FIRST, AIRBUS_ECO_LAST);
                    break;
            }
        }
    }
    protected void ddClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        UpdateTickets();
        lbCost.Text=GetTicketPrice().ToString();
    }

    private void MakeOrder()
    {
        
        int userID = Convert.ToInt32(Session["UserID"]);
        int place = Convert.ToInt32(ddTicket.SelectedValue);
        int tickID = GetTicketTypeID();

        string query = "INSERT INTO [TicketOrder] (id_client,id_tick_type,place)" +
            "VALUES (@id_cl,@id_tick,@place)";            
        string strCon = System.Web
                             .Configuration
                             .WebConfigurationManager
                             .ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(strCon);
        SqlCommand comm = new SqlCommand(query, conn);
        comm.Parameters.Add(new SqlParameter("@id_cl", userID));
        comm.Parameters.Add(new SqlParameter("@id_tick", tickID));
        comm.Parameters.Add(new SqlParameter("@place", place));

        conn.Open();
        try
        {
            comm.ExecuteNonQuery();
            lbNotify.Text = "Заказ успешно оформлен!";
        }
        catch(Exception e)
        {
            lbNotify.Text = "Произошла ошибка!";
        }
        finally
        {
            conn.Close();
        }
            

    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        MakeOrder();
        UpdateTickets();
    }
}