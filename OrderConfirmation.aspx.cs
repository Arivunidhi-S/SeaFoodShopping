using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Globalization;
using System.Collections;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data.OleDb;
using System.Drawing;
using System.Collections.Generic;
using Telerik.Web.UI.Calendar;
using System.Text.RegularExpressions;
using System.Data.Common;
using System.Web.Configuration;
using System.Net;
using System.Text;
using System.Net.Mail;
using System.Security.Cryptography;

public partial class OrderConfirmation : System.Web.UI.Page
{
    public DataTable dtPreview = new DataTable();


    string Status = string.Empty;

    public string CustomerID = string.Empty, Name = string.Empty, Mobile = string.Empty, Email = string.Empty, Address1 = string.Empty, Address2 = string.Empty, PostCode = string.Empty, City = string.Empty, State = string.Empty, Country = string.Empty, Amount = string.Empty;

    protected void Page_Init(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        try
        {
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("param1").ToString();
           

            string sql = "select CustomerID,Name,Mobile,Email,Address1,Address2,PostCode,City,State,Country,sentamount,ReferenceID from ShippingAddress where DELETED=0 and ShippingID='" + @Param.ToString() + "'";
            SqlCommand cmd = new SqlCommand(sql, connMenu);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                CustomerID = reader["CustomerID"].ToString();
                Name = reader["Name"].ToString();
                Mobile = reader["Mobile"].ToString();
                Email = reader["Email"].ToString();
                Address1 = reader["Address1"].ToString();
                Address2 = reader["Address2"].ToString();
                PostCode = reader["PostCode"].ToString();
                City = reader["City"].ToString();
                State = reader["State"].ToString();
                Country = reader["Country"].ToString();
                Amount = reader["sentamount"].ToString();
                lblOrderno.Text = reader["ReferenceID"].ToString();
            }
            BusinessTier.DisposeReader(reader);

            string status = Request.QueryString.Get("status").ToString();
            string referenceId = Request.QueryString.Get("referenceId").ToString();
            string transactionId = Request.QueryString.Get("transactionId").ToString();
            string datetime = Request.QueryString.Get("datetime").ToString();
            string sentamount = Request.QueryString.Get("amount").ToString();
            if (status.ToString() == "success")
            {
                lblstatus.Text = "Thank you! You Will Receive Your Order With In 3 Hours";
                lblstatus.ForeColor = Color.Green;

                BusinessTier.OrderConfirmation(connMenu, @Param.ToString().Trim(),
                            status.ToString(), referenceId.ToString().Trim(),
                            transactionId.ToString(), datetime.ToString(),
                            sentamount.ToString().Trim(),
                            CustomerID.ToString().Trim(), "N");
                BusinessTier.DisposeConnection(connMenu);
            }
            else 
            {
                lblstatus.Text = "** Sorry! Your order transaction has been failed. Please check your bank balance and try again ** <br> ** If amount has been debited from your account,  please email (or) contact our customer care. **";
                lblstatus.ForeColor = Color.Red;

                BusinessTier.OrderConfirmation(connMenu, @Param.ToString().Trim(),
                            status.ToString(), referenceId.ToString().Trim(),
                            transactionId.ToString(), datetime.ToString(),
                            sentamount.ToString().Trim(),
                            CustomerID.ToString().Trim(), "N");
                BusinessTier.DisposeConnection(connMenu);
            }

        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(CustomerID.ToString(), "OrderConfirmation", "Page_Init", ex.ToString(), "Audit");
            Response.Redirect("shippingaddress.aspx");
        }
        finally
        {
            BusinessTier.DisposeConnection(connMenu);
        }
    }

    private string GetVCode(string input)
    {
        SHA1CryptoServiceProvider objSHA1 = new SHA1CryptoServiceProvider();

        objSHA1.ComputeHash(System.Text.Encoding.UTF8.GetBytes(input));

        byte[] buffer = objSHA1.Hash;
        string HashValue = System.Convert.ToBase64String(buffer);

        return HashValue;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        try
        {
            string @Param = string.Empty;
            //@Param = "31";
            @Param = Request.QueryString.Get("param1").ToString();
            string sql1 = "select count(*) as Cart, sum(DiscountPrice*Qnty) as Total, sum(ShippingCost*Qnty) as ShipCost from Vw_AddCart where DELETED=0 and PayMethod='Online Banking' and ShippingID='" + @Param.ToString() + "'";
            SqlCommand cmd1 = new SqlCommand(sql1, connMenu);
            SqlDataReader reader1 = cmd1.ExecuteReader();
            if (reader1.Read())
            {
                lblTotal.Text = Convert.ToDecimal(reader1["Total"]).ToString("#0.00");
                lblShippingCost.Text = Convert.ToDecimal(reader1["ShipCost"]).ToString("#0.00");
            }
            lblGrandTotal.Text = (Convert.ToDecimal(lblTotal.Text) + Convert.ToDecimal(lblShippingCost.Text)).ToString();
            BusinessTier.DisposeReader(reader1);
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "Page_Load", "OrderConfirmation", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(connMenu);
        }
    }

    // ---------------- %% ** !! RadGrid Functions !! ** %% ---------------- //

    protected void RadGridDisplay_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            RadGridDisplay.DataSource = DataSourceHelper();
        }
        catch (Exception ex)
        {
            Response.Redirect("index.aspx");
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "RadGridDisplay_NeedDataSource", "OrderConfirmation", ex.ToString(), "Audit");
        }
    }

    public DataTable DataSourceHelper()
    {

        SqlConnection conn = BusinessTier.getConnection();
        conn.Close();

        string @Param = string.Empty;
        //@Param = "31";
        @Param = Request.QueryString.Get("param1").ToString();
        String today = DateTime.Now.ToString();
        DateTime dtinsDate = DateTime.Parse(today);
        today = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";
        DataTable g_datatable = new DataTable();
        string sql = "select * FROM Vw_AddCart WHERE shippingid='" + @Param.ToString() + "' and Deleted=0  and PayMethod='Online Banking' and Customerid='" + CustomerID.ToString() + "' ";  // and CREATED_DATE='" + today.ToString() + "'
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    protected void RadGrid1_ItemDataBound(object source, Telerik.Web.UI.GridItemEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            Label lblPrice = (Label)e.Item.FindControl("lblPrice");
            Label lbltotal = (Label)e.Item.FindControl("lbltotal");
            Label cboQnty = (Label)e.Item.FindControl("cboQnty");
            RadComboBox cboQnty1 = (RadComboBox)e.Item.FindControl("cboQnty1");
            /*This Lable for inside Grid*/
            lbltotal.Text = (Convert.ToDecimal(lblPrice.Text.ToString()) * Convert.ToDecimal(cboQnty.Text.ToString())).ToString("#0.00");
            decimal qty = Convert.ToDecimal(cboQnty.Text.ToString().Trim());
            string AddcartID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["AddcartID"].ToString();
            string ProductID = cboQnty.ToolTip.ToString().Trim();

            //if (Status.ToString() == "1")
            //{
            BusinessTier.Stock_Update(conn, AddcartID.ToString(), ProductID.ToString(), lblPrice.ToolTip.ToString(), Convert.ToDecimal(qty.ToString()), CustomerID.ToString().Trim(), "U");
            //}
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(CustomerID.ToString(), "OrderConfirmation", "RadGrid1_ItemDataBound", ex.ToString(), "Audit");
        }

        finally
        {
            BusinessTier.DisposeConnection(conn);
        }
    }

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }

    protected void btnMoreBuy_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx", false);
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        String path = string.Empty;
        path = WebConfigurationManager.AppSettings["ImagePath"].ToString();
        path += "\\web\\";
        string link = string.Empty;
        link = path + "\\Report.aspx?param1=" + lblOrderno.Text.ToString() + "&param2=Bill";
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + link + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=1000,height=900');", true);

    }
}