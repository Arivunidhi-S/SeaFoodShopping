<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title> FAQ </title> <link rel="shortcut icon" href="web/Images/Slogo.png" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link href="web/css/style.css" rel="stylesheet" type="text/css" media="all"/>
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
				 <p> <span class="lblfont">Need help?</span> email us <span class="lblfont">admin@fishmarket.com.qa</span></p>
			</div>
			    <div class="account_desc">
                    <ul> <li><a href="AccontInfo.aspx">My Account</a></li>
                        <li><a href="SellatEBB.aspx">Sell SeaFood</a></li>
                          <li><a href="CustomerMaster.aspx">Signup</a></li>
                        <li><a href="Login.aspx">Login</a></li>
                   
                    </ul>
                </div>
			<div class="clear"></div>
		</div>
		<div class="header_top">
			<div class="logo">
				 <a href="index.aspx"><img src="web/images/logo.png" alt="" /></a> <img src="web/images/malaysia.jpg" width="400px" height="70px" style="left:110px;position:relative" alt="" />
			 <div class="social">
						  <a href="https://www.facebook.com/Easybuybye-151955558610155/" target="_blank" class="icon fb"><img class="imgalign" src="images/f.png" alt=""/></a>
						  <a href="https://twitter.com/easybuybye" target="_blank" class="icon tw"><img class="imgalign" src="images/t.png" alt=""/></a>
						  <a href="https://plus.google.com/115499738327775097465" target="_blank" class="icon gp"><img class="imgalign" src="images/g.png" alt=""/></a>&nbsp;&nbsp;&nbsp;
                          <a href="https://www.linkedin.com/in/easybuybye-online-shopping-427335132" target="_blank" class="icon in"><img class="imgalign" src="images/in.png" alt=""/></a>
						</div>
            </div>
			 <!-- <div class="cart">
			  	   <p>Welcome to our Online Store! <span>Cart:</span><div id="dd" class="wrapper-dropdown-2"> 0 item(s) - $0.00
			  	   	<ul class="dropdown">
							<li>you have no items in your Shopping cart</li>
					</ul></div></p>
			  </div>
			  <script type="text/javascript">
			function DropDown(el) {
				this.dd = el;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						event.stopPropagation();
					});	
				}
			}

			$(function() {

				var dd = new DropDown( $('#dd') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown-2').removeClass('active');
				});

			});

		</script>-->
	 <div class="clear"></div>
  </div>
	<div class="header_bottom">
	     	<div class="menu">
	     		   <!-- #Include file="IncludeMenu.html" -->
	     	</div>
	     	<!--<div class="search_box">
	     		<form>
	     			<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}"><input type="submit" value="">
	     		</form>
	     	</div>-->
	     	<div class="clear"></div>
	     </div>	     	
   </div>
 <div class="main">
    <div class="content">
    	<!--<div class="section group">
				<div class="grid_1_of_3 images_1_of_3">
					  <img src="web/images/delivery-img1.jpg" alt="" />
					  <h3>Lorem Ipsum is simply dummy text </h3>
					  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
				</div>
				<div class="grid_1_of_3 images_1_of_3">
					  <img src="web/images/delivery-img2.jpg" alt="" />
					  <h3>Lorem Ipsum is simply dummy text </h3>
					  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
				</div>
				<div class="grid_1_of_3 images_1_of_3">
					  <img src="web/images/delivery-img3.jpg" alt="" />
					  <h3>Lorem Ipsum is simply dummy text </h3>
					  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
				</div>
			</div>	-->
		<div class="faqs">
    	  <h2>Frequently Asked Questions</h2>	          	
            <div id="posts">
			    <div class="tab bar">
                    <h4 class="post-title">1.How do I become a member in EasyBuyBye?</h4>
                </div>
			    <div class="panel margin-lr-7">
            		<p>If you are not a member of EasyBuyBye, then please click the “Sign Up” link on the right top of our website.  Then click the “Buyer” box and register yourself with your details in the registration form.</p>
			    </div>		   
                <div class="tab bar">
                     <h4 class="post-title">2.Can I become a member in EasyBuyBye without verifying my email?</h4>
                </div>
				<div class="panel margin-lr-7">
	        		 <p>No. You cannot be a member of EasyBuyBye without your email verification. Email is our main source to contact you during your financial processing. So EasyBuyBye will not encourage wrong or false email. Once you verify your email, you will become the official member of EasyBuyBye.</p>
                </div>
                <div class="tab bar">
                     <h4 class="post-title">3.I have registered already. But I have not received the verification email from EasyBuyBye</h4>
                </div>
				<div class="panel margin-lr-7">
	        		 <p>If you have not received the verification email from EasyBuyBye, Please check in your spam folder (or) Junk folder. Still if you have not received then please contact or email to Customer Service for further assistance.</p>
                </div>
				<div class="tab bar">
                    <h4 class="post-title"> 4.Do I have to pay any amount to become member in EasyBuyBye?</h4>
            	</div>
			 	<div class="panel margin-lr-7">
	        		<p>No need to pay. It’s free for you to become member in EasyBuyBye. Once you become the member you are eligible to enjoy the offers and discounts provided by EasyBuyBye.</p>
             	</div>
                <div class="tab bar">
                    <h4 class="post-title"> 5.Is there any limitation in age to join as EasyBuyBye member?</h4>
                </div>
			    <div class="panel margin-lr-7">
	        	     <p>No. There is no age limit for joining as member in EasyBuyBye.  However you should be aware of using your authorised/own Credit Card, Online Banking or other payment methods processed by EasyBuyBye.</p>
                </div>
                <div class="tab bar">
                    <h4 class="post-title"> 6.How can I change my email address?</h4>
            	</div>
				<div class="panel margin-lr-7">
                      <p>You cannot change you email address. Your email address is used as login ID for you to login to EasyBuyBye. In case if you register with wrong email address then please contact Customer Service for further assistance.</p>
                </div>
                <div class="tab bar">
                    <h4 class="post-title"> 7.Can I purchase any product without registering as member in EasyBuyBye?</h4>
            	</div>
				<div class="panel margin-lr-7">
	        	     <p>No. You have to register as a member in order to make your purchase. However as a guest you are allowed to browse and add products to cart. But during the checkout process you have to login first.</p>
                </div>
                <div class="tab bar">
                    <h4 class="post-title"> 8.Can I purchase checkout multiple products together in EasyBuyBye?</h4>
            	</div>
				<div class="panel margin-lr-7">
	        	     <p>Yes. You can checkout more than 1 products together. In fact this will save more time for you and can also avoid multiple payments.</p>
                </div>
                <!--<div class="tab bar">
                    <h4 class="post-title"> 9.What is Lorem Ipsum  Lorem Ipsum has been the industry's standard dummy text?</h4>
            	</div>
				<div class="panel margin-lr-7">
                      <p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Donec id elit non mi porta gravida at eget metus.</p>
                </div>
                <div class="tab bar">
                    <h4 class="post-title"> 10.What is Lorem Ipsum typesetting industry?</h4>
            	</div>
				<div class="panel margin-lr-7">
	        	     <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                </div>-->
		       </div>
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
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>
    </form>
</body>
</html>
