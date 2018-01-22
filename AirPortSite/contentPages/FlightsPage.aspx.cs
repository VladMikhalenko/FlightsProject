using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contentPages_FlightsPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    void LoadData()
    {
        string strCon = System.Web
                              .Configuration
                              .WebConfigurationManager
                              .ConnectionStrings["ConnectionString"].ConnectionString;

        //SqlConnection conn = new SqlConnection(strCon);
        //SqlCommand comm = new SqlCommand(sql, conn);
        //conn.Open();
        //SqlDataReader nwReader = comm.ExecuteReader();
        //if (nwReader.HasRows)
        //{
        //    DataTable table = new DataTable();
        //    DataColumn
        //        colFlightNum = new DataColumn(AttrFlightNum, typeof(Int32)),
        //        colFrom = new DataColumn(AttrFromInfo, typeof(string)),
        //        colTo = new DataColumn(AttrToInfo, typeof(string)),
        //        colDate = new DataColumn(AttrTime, typeof(string)),
        //        colBook = new DataColumn("", typeof(ImageButton));
        //    table.Columns.Add(colFlightNum);
        //    table.Columns.Add(colFrom);
        //    table.Columns.Add(colTo);
        //    table.Columns.Add(colDate);
        //    table.Columns.Add(colBook);

        //    while (nwReader.Read())
        //    {
        //        DataRow row = table.NewRow();
        //        row[AttrFlightNum]= (string)nwReader["Номер"];

                
        //        #region example
        //        /*
        //        Session["Name"] = (string)nwReader["Имя"];
        //        Session["Familiya"] = (string)nwReader["Фаммилия"];
        //        Session["Otchestvo"] = (string)nwReader["Отчество"];
        //        Session["Telephone"] = (string)nwReader["Number"];
        //        Session["Email"] = (string)nwReader["Email"];
        //        Session["Role"] = Convert.ToInt32(nwReader["RoleId"]);
        //        */
        //        #endregion
        //    }
        //}
        //conn.Close();
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string query = String.Format("SELECT * FROM [FlightView] ");
        string _from = tbFrom.Text.ToUpper();
        string _to = tbTo.Text.ToUpper();
        string fromSearchField = ddSearch.SelectedValue == "Страны" ? "[ОТКУДА]" : "[Город вылет]";
        string toSearchField = ddSearch.SelectedValue == "Страны" ? "[КУДА]" : "[Город прибытие]";
        if (!string.IsNullOrEmpty(_from))
            query += " WHERE " + fromSearchField + "=N'" + _from + "'";
        if (!string.IsNullOrEmpty(_to))
            query += query[query.Length - 1] == '\'' ? " AND " + toSearchField + " =N'" + _to + "'" :
                " WHERE " + toSearchField + " =N'" + _to.ToUpper() + "'";
        SqlDataSource1.SelectCommand = query;
        SqlDataSource1.Select(DataSourceSelectArguments.Empty);
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        ListViewItem item = e.Item;
        Session["FlightNum"] = Convert.ToInt32((item.FindControl("Номер_рейсаLabel") as Label).Text);
        Session["FromCountry"] = Convert.ToString((item.FindControl("ОТКУДАLabel") as Label).Text);
        Session["FromCity"] = Convert.ToString((item.FindControl("Город_вылетLabel") as Label).Text);
        Session["FromAirport"] = Convert.ToString((item.FindControl("Аэропорт_вылетLabel") as Label).Text);
        Session["ToCountry"] = Convert.ToString((item.FindControl("КУДАLabel") as Label).Text);
        Session["ToCity"] = Convert.ToString((item.FindControl("Город_прибытиеLabel") as Label).Text);
        Session["ToAirport"] = Convert.ToString((item.FindControl("Аэропорт_прибытиеLabel") as Label).Text);
        Session["Date"] = Convert.ToDateTime((item.FindControl("Дата_времяLabel") as Label).Text).ToString();
        Session["Plane"] = Convert.ToString((item.FindControl("АВИАЛАЙНЕР_Label1") as Label).Text);
        Response.Redirect("TicketPurchase.aspx");
        #region extraction test
        //string fromCountry = Convert.ToString((item.FindControl("ОТКУДАLabel") as Label).Text);
        //string fromCity = Convert.ToString((item.FindControl("Город_вылетLabel") as Label).Text);
        //string fromAirP = Convert.ToString((item.FindControl("Аэропорт_вылетLabel") as Label).Text);
        //string toCountry= Convert.ToString((item.FindControl("КУДАLabel") as Label).Text);
        //string toCity= Convert.ToString((item.FindControl("Город_прибытиеLabel") as Label).Text);
        //string toAirP = Convert.ToString((item.FindControl("Аэропорт_прибытиеLabel") as Label).Text);
        //string date = Convert.ToDateTime((item.FindControl("Дата_времяLabel") as Label).Text).ToString();
        //string plane= Convert.ToString((item.FindControl("АВИАЛАЙНЕР_Label1") as Label).Text);
        ////string s = e.Item.DataItemIndex + e.CommandArgument.ToString();
        #endregion
    }
}