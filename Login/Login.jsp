<%
	if(request.getParameter("logout") != null && request.getParameter("logout").equals("true")) {
		session.invalidate();
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
	<link rel="stylesheet" href="images/style.css" type="text/css">
	 <link href="../themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="../themes/1/js-image-slider.js" type="text/javascript"></script>
    <link href="generic.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<!--  <link rel="stylesheet" type="text/css" href="../css/StyleDiscussion.css">-->
	

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="../script.js"></script>
<script type="text/javascript" src="../jquery.validate.min.js"></script>

	<style type="text/css">
	
	 #slider{
	  position:fixed;
	  left:10px;
	  top:200px;
	
	  
	 }
	 #admin_login{
	 position:absolute;
	 right:20px;
	 top:20px;
	
	 }
	  .right{
	 resize:both;
		overflow:auto;
	 }
	 #google_translate_element{
	 position:absolute;
	 bottom:0px;
	 right:10px;
	 }
	 input[type="submit"]
{
-moz-box-shadow:inset -2px 1px 0px 0px #e6e6e6;
	-webkit-box-shadow:inset -2px 1px 0px 0px #e6e6e6;
	box-shadow:inset -2px 1px 0px 0px #e6e6e6;
	background-color:#d11726;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #ebebeb;
	display:inline-block;
	color:#fafafa;
	font-family:Comic Sans MS;
	font-size:18px;
	font-weight:normal;
	padding:6px 24px;
	text-decoration:none;
	
}
 
	 
	</style>

<script type="text/javascript">

function check_login(){
	var email_bool=true;
   var password_bool=true;
 var useremail=document.getElementById("useremail").value;
 var password=document.getElementById("password").value;
useremail=useremail.trim();

 if(useremail=="" || useremail==" ")	
{

 email_bool=false;
}
if(password=="")	
{

password_bool=false;
}

if(email_bool==false && password_bool==false)
{
	alert("Username and password empty");
	return false;
	}
else if(email_bool==false)
    {
	alert("Please Add a useremail");
	return false;
}else if(password_bool==false){
	 
	alert("Please Add a password");
	return false;
          }
else{
	 return true;
	}
} 


</script>

	<title>Login</title>
</head>

<body>
<!--header-->
<div class="header">
				<div class="top_info"></div>
				<div class="logo">
				<h1><a href="#" title="Best Place to share photos and videos"><span class="dark">DARK</span> 
				LORD</a></h1>
				</div>
				</div>
			
<!--Menu-->
<div class="bar">
			<ul>
				<li class="browse_category">Welcome to Dark Lord</li>
				<li><a href="../registration/reginfo.jsp" accesskey="i">&nbsp;Sign Up!!</a></li>
				<li><a href="../Demo/demo.jsp" accesskey="m">Demo</a></li>
				<li><a href="../About/about.jsp" accesskey="m">About Us</a></li>
			</ul>
		</div>
		

<!--Slider-->

<br><br><br><br><br><br>
 <div id="sliderFrame">
        <div id="slider">
            <img src="../images/image-slider-2.jpg"/>
            <img src="../images/image-slider-3.jpg"  />
            <img src="../images/image-slider-4.jpg" />
            <img src="../images/image-slider-5.jpg" />
        </div>
</div>
<!--Login-->

<div class="right">
	<form onsubmit="return check_login()" name="Login" action="../Login" method="post">
	
    <div id="form-content">

	
	<h3 align="center">LOGIN QUICKLY!!!</h3></div>
	
			<div class="right_articles">
			<TABLE cellspacing="1" cellpadding="5" border="0">
					<tr align="left">
						<th><font face="Chiller" size="5">Email:</font></th>
						<td> <input type="text" size="35" name="useremail" id="useremail"></td> 
    					<td rowspan="6"></td>
					</tr >
					<tr align="left">
						<th><font face="Chiller" size="5"> Password</font></th>
						<td><input type="password" name="password" id="password" size="35" maxlength="8" ></td>
					</tr>
					<tr>
						<td>
								<%
									if(request.getParameter("message") != null)
									{
										out.println("<font color=\"red\">" + request.getParameter("message") + "</font>");
									}
								%>
						</td>
					</tr>
					<tr>
						<td><a href="forgotpwdemail.jsp">Forgot Password</a></td>
					</tr>

					<tr>
							<td>&nbsp;</td>
							<th><input type="submit" value="submit" ></th>
					</tr>
				</TABLE>
</div>

   
    


</form>
   <h3 align="center">A QUICK TOUR of what DARK Lord offers to users... </h3>
				<p><img src="../images/thumb5.jpg" alt="Image" title="Image" class="image"><b><br><font>Image and Video sharing....</font></b><br></p><br>
				<p><img src="../images/thumb2.jpg" alt="Image" title="Image" class="image"><b><br><font>Free for all users</font></b><br></p><br>
				<p><img src="../images/thumb3.jpg" alt="Image" title="Image" class="image"><b><br><a href="../Demo/demo.jsp">CLICK HERE FOR AN AMAZING TOUR!!</a></b><br></p>
	</div>
	<div id="admin_login">
     <a href="../admin/admin_login.jsp">AdminLogin</a>
    </div>
	<div id="google_translate_element">
<div class="skiptranslate goog-te-gadget" dir="ltr" style="">
<div id=":0.targetLanguage" style="display: inline;">
</div>&nbsp;&nbsp;Powered by <span style="white-space:nowrap"><a class="goog-logo-link" href="http://translate.google.com" target="_blank">Translate</a></span></div></div>
<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'bn,en,gu,hi,ms,ta,te,ur', layout: google.translate.TranslateElement.InlineLayout.HORIZONTAL, gaTrack: true, gaId: 'UA-18100914-1'}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	
</body>
</html>