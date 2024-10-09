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

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string @Param = string.Empty;
        //@Param = Request.QueryString.Get("param1").ToString();

        Response.Write(Request.QueryString.Get("status").ToString()+"<br>");
        Response.Write(Request.QueryString.Get("referenceId").ToString() + "<br>");
        Response.Write(Request.QueryString.Get("transactionId").ToString() + "<br>");
        Response.Write(Request.QueryString.Get("datetime").ToString() + "<br>");
        Response.Write(Request.QueryString.Get("amount").ToString());

    }
}