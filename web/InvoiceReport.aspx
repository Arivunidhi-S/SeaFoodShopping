<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InvoiceReport.aspx.cs" Inherits="web_InvoiceReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>EasyBuyBye</title>
</head>
<body>
    <br />
    <font face="Arial, Helvetica, sans-serif">
        <table align="center" cellpadding="2" cellspacing="2" bgcolor="#000000" width="900">
            <tr bgcolor="#FFFFFF">
                <td rowspan="5" width="600" colspan="3">
                    <table>
                        <tr valign="top">
                            <td>
                                <img src="images/logo.png" alt="" />
                            </td>
                            <td>
                                <font size="+1"><b>SERBA DINAMIK IT SOLUTIONS SDN BHD</b></font> <font size="1">(919896-A)</font><br />
                                <font size="2">F-1-22, 1st Floor, Vista Alam,<br />
                                    Jalan Ikhtisas 14/1, Seksyen 14,<br />
                                    40000 Shah Alam, Selangor Darul Ehsan, Malaysia<br />
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                Tel
                                            </td>
                                            <td>
                                                :
                                            </td>
                                            <td>
                                                &nbsp;+603-5524 6258
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Fax
                                            </td>
                                            <td>
                                                :
                                            </td>
                                            <td>
                                                &nbsp;+603-5524 6215
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Email
                                            </td>
                                            <td>
                                                :
                                            </td>
                                            <td>
                                                &nbsp;admin@easybuybye.com
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Website
                                            </td>
                                            <td>
                                                :
                                            </td>
                                            <td>
                                                &nbsp;www.easybuybye.com
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                (GST Number: 000290852864)
                                            </td>
                                        </tr>
                                    </table>
                                </font>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="150">
                    <font size="2">TAX INVOICE NO</font>
                </td>
                <td width="150" align="right">
                    <%= dtreport.Rows[0][0].ToString()%>&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td>
                    <font size="2">DATE</font>
                </td>
                <td align="right">
                    <%= dtreport.Rows[0][1].ToString()%>&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td>
                    <font size="2">ORDER NO</font>
                </td>
                <td align="right">
                    <%= dtreport.Rows[0][2].ToString()%>&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td>
                    <font size="2">DELIVERY NO</font>
                </td>
                <td align="right">
                    <%--<%=DeliveryNo%>--%>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td>
                    <font size="2">PAYMENT TERMS</font>
                </td>
                <td align="right">
                   ipay88
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td colspan="5" align="center">
                    <b><font size="+2">
                        <asp:Label ID="lbltitle" runat="server" Text="Label"></asp:Label></font></b>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td colspan="5">
                    <font size="2">&nbsp;<b>TO:</b></font><br />
                    <br />
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <b>
                                    <%= dtreport.Rows[0][3].ToString()%>&nbsp;</b><br />
                                <%= dtreport.Rows[0][4].ToString()%><br />
                                <%= dtreport.Rows[0][5].ToString()%><br />
                                <%= dtreport.Rows[0][6].ToString()%>
                                &nbsp;<%= dtreport.Rows[0][7].ToString()%><br />
                                <%= dtreport.Rows[0][8].ToString()%>&nbsp;<%= dtreport.Rows[0][9].ToString()%><br />
                                <br />
                                Phone:&nbsp;<%= dtreport.Rows[0][10].ToString()%><br />
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center">
                <td width="100">
                    <b>ITEM</b>
                </td>
                <td width="400">
                    <b>DESCRIPTION</b>
                </td>
                <td width="100">
                    <b>QUANTITY</b>
                </td>
                <td width="150">
                    <b>UNIT PRICE</b>
                </td>
                <td width="150">
                    <b>AMOUNT (RM)</b>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center">
                <td colspan="5">
                    <table cellpadding="5" cellspacing="5">
                        <%
                            int cnt = 1; decimal subTotal = 0, tot = 0,price=0, gst =0,gstTotal = 0, grndtot = 0,shipcost=0,ship=0;
                            cnt = dtreport.Rows.Count;

                            for (int i = 0; i < dtreport.Rows.Count; i++)
                            {
                                price = Convert.ToDecimal(dtreport.Rows[i][14].ToString()) / 106 * 100;
                                
                                
                                if (dtreport.Rows[i][16].ToString() == "Percentage")
                                {
                                    decimal per = 0;
                                    per = (price * Convert.ToDecimal(dtreport.Rows[i][17].ToString()))/100;
                                    subTotal = (price - per) ;
                                }
                                else
                                {
                                    subTotal = price;
                                }
                                gstTotal = (subTotal * Convert.ToDecimal(dtreport.Rows[i][13].ToString())) * 6 / 100;
                                shipcost = Convert.ToDecimal(dtreport.Rows[i][18].ToString());
                                tot = tot + subTotal;
                                gst = gst + gstTotal;
                                ship = ship + shipcost;
                                
                          
                        %>
                        <tr bgcolor="#FFFFFF" align="center">
                            <td width="100">
                                <%=i+1%>
                            </td>
                            <td width="400">
                                <%=dtreport.Rows[i][11].ToString()%>
                                &nbsp;
                                <%=dtreport.Rows[i][12].ToString()%>
                            </td>
                            <td width="100">
                                <%=dtreport.Rows[i][13].ToString()%>
                            </td>
                            <td width="150" align="right">
                                <%=Math.Round(subTotal,2)%>&nbsp;
                            </td>
                            <td width="150" align="right">
                                <%=Math.Round(subTotal * Convert.ToDecimal(dtreport.Rows[i][13].ToString()),2)%>&nbsp;
                            </td>
                        </tr>
                        <%
                            }
                          
                   if (cnt < 15)
                       for (int i = 1; i < (15 - cnt); i++)
                       {
                        %>
                        <tr bgcolor="#FFFFFF" align="center">
                            <td colspan="5">
                                &nbsp;
                            </td>
                        </tr>
                        <%
           }
       //gstTotal = (tot * 6) / 100;
                            grndtot = tot + gst + ship;
                        %>
                    </table>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center">
                <td colspan="3" rowspan="4" align="left" valign="top">
                    Customer Copy
                </td>
                <td>
                    SUB TOTAL
                </td>
                <td align="right">
                    <%=Math.Round(tot,2)%>&nbsp;
                </td></tr>
                <tr bgcolor="#FFFFFF" align="center">
                    <td>
                        GST 6%
                    </td>
                    <td align="right">
                        <%=Math.Round(gst,2)%>&nbsp;
                    </td></tr>
                    <tr bgcolor="#FFFFFF" align="center">
                    <td>
                       Shipping 
                    </td>
                    <td align="right">
                     <%=ship%>&nbsp;
                    </td></tr>
                    <tr bgcolor="#FFFFFF" align="center">
                        <td>
                            <b>GRAND TOTAL</b>
                        </td>
                        <td align="right">
                            <%=Math.Round(grndtot,2)%>&nbsp;
                        </td></tr>
        </table>
        <br />
        <br />
        <font size="2">
            <table align="center" cellpadding="2" cellspacing="2" width="900">
                <tr>
                    <td width="450" align="left">
                       
                        <%--<br />--%>
                        <br /> This is a computer generated invoice. No signature is required.<br />
                        <br />
                        <br />
                        <br />
                     <%--   <hr align="left" width="230" />--%>
                        <br />
                      <%--  (RECEIVER)--%>
                    </td>
                   <%-- <td width="450" align="right">
                        FOR SERBA DINAMIK IT SOLUTIONS SDN BHD<br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <hr align="right" width="230" />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(AUTHOURISED SIGNATURE)
                    </td>--%>
                </tr>
            </table>
          <%--  <br />
            <br />
            <br />--%>
            <table align="center">
                <tr valign="top">
                    <td>
                        <img src="images/invoicefooter.png" alt="" />
                    </td>
                </tr>
            </table>
        </font></font>
</body>
</html>
