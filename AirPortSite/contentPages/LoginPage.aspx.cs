using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contentPages_LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string login = tbLogin.Text;
        string pwd = tbPwd.Text;
        if (string.IsNullOrEmpty(login) || string.IsNullOrEmpty(pwd))
        {
            lbNotify.Text= "Поля не могут быть пустыми";
            return;
        }

        string strCon = System.Web
                              .Configuration
                              .WebConfigurationManager
                              .ConnectionStrings["ConnectionString"].ConnectionString;
        pwd = HashGenerator.GetHash(pwd);
        string query = String.Format("SELECT * FROM [Client] WHERE login=@login AND pwd=@pwd");

        SqlConnection conn = new SqlConnection(strCon);
        SqlCommand comm = new SqlCommand(query, conn);
        comm.Parameters.Add(new SqlParameter("@login", login));
        comm.Parameters.Add(new SqlParameter("@pwd", pwd));
        conn.Open();
        SqlDataReader nwReader = comm.ExecuteReader();
        if (nwReader.HasRows)
        {
            lbNotify.Text="Вы успешно вошли систему";
            while (nwReader.Read())
            {
                Session["UserID"] = Convert.ToInt32(nwReader["Id"]);
                Session["Name"] = (string)nwReader["FullName"];
                Session["Tel"] = (string)nwReader["telephone"];
                Session["Login"] = (string)nwReader["login"];
                Session["Birth"] = (DateTime)nwReader["BirthDay"];
                Session["Telephone"] = (string)nwReader["telephone"];
                Session["Role"] = Convert.ToInt32(nwReader["id_role"]);
                Response.Redirect("FlightsPage.aspx");
            }
        }
        else lbNotify.Text="Неверный логин или пароль";
        conn.Close();
    }
}