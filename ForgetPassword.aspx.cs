﻿using System;
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
using System.Linq;
using Telerik.Web.UI.Calendar;
using System.Text.RegularExpressions;
using System.Data.Common;
using System.Web.Configuration;
using System.Net;
using System.Text;
using System.Net.Mail;

public partial class ForgetPassword : System.Web.UI.Page
{
    string @Param = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            @Param = Request.QueryString.Get("param").ToString();
        }
        catch (Exception ex)
        {

        }
    }

    protected void btnChangePassword_OnClick(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        try
        {
            if (string.IsNullOrEmpty(txtEmail.Text.ToString()))
            {
                lblStatus.Text = "Please enter your email id";
                lblStatus.ForeColor = Color.Red;
                return;
            }
            else
            {
                Regex emailRegex = new Regex(@"^[a-zA-Z][\w\.-]{2,28}[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$");
                if (!(emailRegex.IsMatch(txtEmail.Text.ToString().Trim())))
                {
                    lblStatus.Text = "Email id format is worng";
                    lblStatus.ForeColor = Color.Red;
                    return;
                }

                string sql = "select * from BusinessRegister where Email ='" + txtEmail.Text.ToString().Trim() + "' and deleted=0";

                SqlCommand cmd = new SqlCommand(sql, connMenu);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string Name = reader["name"].ToString();
                    string SysReg = reader["SysRegno"].ToString();
                    MailMessage message1 = new MailMessage();
                    message1.From = new MailAddress(ConfigurationManager.AppSettings["MailAddress"].ToString());
                    //message1.From = new MailAddress(Session["Email"].ToString().Trim());
                    message1.To.Add(new MailAddress(txtEmail.Text.ToString().Trim()));

                    message1.Subject = "Change Password";
                    string msg = string.Empty;
                    if (@Param == "b")
                    {
                        msg = "Dear " + Name.ToString() + ",<br><br>" + "Do you want to change your password <a href=" + ConfigurationManager.AppSettings["ImagePath"].ToString() + "ChangePassword.aspx?Param1=f&Param=" + txtEmail.Text.ToString().Trim() + ">Click Here</a><br><br> Thank you <br><br> EasyBuyBye Team<br>Malaysia<br><br> http://www.easybuybye.com";
                    }
                    else
                    {
                        msg = "Dear " + Name.ToString() + ",\n\n Your SysRegno:" + SysReg.ToString() + "\n" + "Do you want to change your password please try this link " + ConfigurationManager.AppSettings["ImagePath"].ToString() + "ChangePassword.aspx?Param1=s&Param=" + txtEmail.Text.ToString().Trim() + " \nThank you\n\nby, \nAdmin";
                    }
                    message1.IsBodyHtml = true;
                    message1.Body = msg;
                    SmtpClient client1 = new SmtpClient(ConfigurationManager.AppSettings["Webserver"].ToString(), Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString()));
                    client1.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["MailAddress"].ToString(), ConfigurationManager.AppSettings["Password"].ToString());
                    //client1.DeliveryMethod = SmtpDeliveryMethod.Network;
                    //client1.EnableSsl = true;
                    //client1.UseDefaultCredentials = false;
                    client1.Send(message1);

                    lblStatus.Text = "Please go to your registered email address and click the given link";
                    lblStatus.ForeColor = Color.Green;
                }

                BusinessTier.DisposeReader(reader);
                BusinessTier.DisposeConnection(connMenu);
            }
            //Response.Redirect("login.aspx", false);
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.ToString();
            //Response.Redirect("index.aspx");
        }
        finally
        {
            BusinessTier.DisposeConnection(connMenu);
        }
    }
}