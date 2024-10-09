<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Delivery.aspx.cs" Inherits="Delivery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delivery</title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
    <script type="text/javascript" src="web/js/jquery.accordion.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#posts").accordion({
                header: "div.tab",
                alwaysOpen: false,
                autoheight: false
            });
        });
    </script>
</head>
<body oncontextmenu="return false;">
    <form id="form1" runat="server">
    <div class="wrap">
        <div class="header">
            <div class="headertop_desc">
                <div class="call">
                    <p>
                         <span class="lblfont">Need help?</span> email us <span class="lblfont">admin@fishmarket.com.qa</span></p>
                </div>
                <div class="account_desc">
                    <ul>
                         <li><a href="AccontInfo.aspx">
                            <asp:Label ID="lblName" runat="server" Text="" Style="font-size: small"></asp:Label>
                            <asp:Label ID="lblWelcome" runat="server" Text="" Style="font-size: small"> </asp:Label></a></li>
                        <li><a href="SellatEBB.aspx">Sell SeaFood</a></li>
                       <li><a id="btnShopCart" onserverclick="btnShopCart_Click" runat="server">
                             <img src="images/cart.png" alt="" style="top: 5px; position: relative; width: 18px;
                                height: 18px;" />
                            <asp:Label runat="server" ID="lblcart" Font-Size="16px" Text="0"></asp:Label></a></li>
                        <li><a href="CustomerMaster.aspx">Signup</a></li>
                        <li><a id="BtnLogout" onserverclick="BtnLogout_Click" runat="server" href="Login.aspx">
                            <asp:Label ID="lblLog" runat="server" Text="" Style="font-size: small"></asp:Label></a></li>
                    </ul>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="header_top">
                <!-- #Include file="IncludeHeader.html" -->
                <div class="clear">
                </div>
            </div>
            <div class="header_bottom">
                <div class="menu">
                    <ul>
                        <li><a href="index.aspx">Home</a> </li>
                        <li><a href="AboutUs.aspx">About</a></li>
                        <li class="active"><a href="Delivery.aspx">Delivery</a></li>
                        <li><a href="News.aspx">News</a></li>
                        <li><a href="Contact.aspx">Contact</a></li>
                        <div class="clear">
                        </div>
                    </ul>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="section group">
                    <div class="grid_1_of_3 images_1_of_3">
                        <img src="web/images/delivery-img1.jpg" alt="" />
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <img src="web/images/delivery-img2.jpg" alt="" />
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <img src="web/images/delivery-img3.jpg" alt="" />
                    </div>
                </div>
                <div class="news_desc1">
                    <h3>
                        Delivery</h3>
                    <p>
                        The shipping and delivery process in FishMarket is done by our courier partners
                        in time. After the customer has successfully placed the order, our Customer Service
                        team will conduct a verification process upon the order and update as soon as possible
                        by email to the customer. After the verification of the order, the item will be
                        shipped to customer’s address.
                    </p>
                    <p>
                        Shipping rates will be calculated based on item’s weight, dimensions and its destination.
                        When you order multiple products, the shipping charges for each product will be
                        calculated and total shipping charges are clearly indicated in your cart while you
                        checkout. The delivery will take 3 to 10 days based on the area to be delivered
                        and availability of the product in the warehouse. The deliveries will be made only
                        on the weekdays. Unfortunately our courier partners will not be able to deliver
                        during Sundays and public holidays. So please expect our deliveries during the business
                        days only.
                    </p>
                    <p>
                        Also we regret to inform that the scheduled deliveries were not possible at this
                        time because all deliveries are based on our courier partners. But still will be
                        co-ordinating with our courier partners and update the status on your profile in
                        the website.</p>
                    <p>
                        Moreover customers can track the order status on the courier partner’s website.
                        Tracking will be available in the courier partner’s website within the 24 hours
                        of the shipment. FishMarket will deliver the shipment all over Qatar and we are
                        unable to do international delivery at the moment. And also the order cannot be
                        cancelled once it is shipped to the customer. May be the customer can return or
                        exchange the product once it is delivered, if the product doesn’t suit for the customer.
                        . For any questions or feedback, please contact our Customer Service and we will
                        try our level best to respond to your inquiry within 24 hours.</p>
                </div>
            </div>
        </div>
    </div>
    <!-- #Include file="IncludeFooter.html" -->
    <script type="text/javascript">
        $(document).ready(function () {
            $().UItoTop({ easingType: 'easeOutQuart' });

        });
    </script>
    <a href="#" id="toTop"><span id="toTopHover"></span></a>
    </form>
</body>
</html>
