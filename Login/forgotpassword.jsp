
<%@page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
 <%@ page import ="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#google_translate_element{
	 position:absolute;
	 bottom:100px;
	 right:10px;
	 }
</style>
<!-- for text area -->
<link rel="stylesheet" type="text/css" href="../css/textarea.css" />
<script type="text/javascript">
function check_login(){
	var i;
	var email_bool=true;
   var password_bool=true;
 var useremail=document.getElementById("useremail").value;
 var password=document.getElementById("password").value;


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
	alert("Please complete the form");
	return false;
	}
else if(email_bool==false)
    {
	alert("Password field is empty");
	return false;
}else if(password_bool==false){
	 
	alert("Confirm password field is empty");
	return false;
          }
else{
	 for(i=0;i<useremail.length;i++)
		{
				var c=useremail.charAt(i);
			
				if(useremail.length<5 || c==' ')//minumum length 5 and no spaces allowed
				{
					alert("Password syntax is wrong");
					email_bool=false;
					break;
				}
		
		} 
	 
	 
	 
	 if(useremail!=password && email_bool!=false)//if password are not equal
		{
		alert("Passwords dont match");
		email_bool=false;
		} 
	
	
	}
	if(!email_bool)
	return false;
	else
		return true;
} 


 </script>
 <script type="text/javascript">
 function textimage()
 {
     
 	 var text=document.getElementById('hint_text').value;
 	text=text.trim();

 	if(text=="" || text==" ")
 		{alert("Textbox is empty");
 			return false;
 		
 		}

 return true;
 }
 </script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
<link rel="stylesheet" type="text/css" href="../css/StyleDiscussion.css">
<link rel="stylesheet" type="text/css" href="style.css">
	
</head>
<body>
<%String pass=request.getParameter("p");
String email=request.getParameter("email");
String question=request.getParameter("question");
%>
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
		
<%
if(pass==null)
{
%>

		<h1>Answer the hint question to reset password:</h1>
		<form onsubmit="return textimage()" action="../ForgotPwd?email=<%=email%>" method="post">
				<table class="main_content" border="0" cellpadding="5" cellspacing="5">
				<tr>
						<td><font face="Chiller" size="5">Hint Question:</font></td>
						<td><font face="Chiller" size="5"><b><%=question %></b></font></td>
				</tr>
				<tr>
						<td><font face="Chiller" size="5"><b>Hint answer:</b></font></td>
						<td><textarea rows="4" cols="30" name="hint_text" id="hint_text"></textarea></td>
				</tr>
				
				<tr>
						<td><input type="submit" value="submit" ></td>
					
				</tr>
				</table>		
			</form>
<%} 
else
{%><div class="main_content">
<table border="0" >
	<form action="../ChangePwd?email=<%=email%>" method="post">

	<tr><td><font face="Chiller" size="5"><b>Enter new Password:</b></font></td>
			<td><input type="password" size="35" name="pwd" id="useremail">
			<tr><td><font face="Chiller" size="5"><b>Confirm Password:</b></font></td>
			<td><input type="password" size="35" name="c_pwd" id="password"></td></tr>
		<tr><td colspan="2" ; align="center";><input type="submit" onclick=" return check_login()"></td></tr>

</form>
</table></div>


<% }%>

<div id="google_translate_element">
<div class="skiptranslate goog-te-gadget" dir="ltr" style="position:absolute;top:120px;right:20px;">
<div id=":0.targetLanguage" style="display: inline;">
</div>&nbsp;&nbsp;Powered by <span style="white-space:nowrap"><a class="goog-logo-link" href="http://translate.google.com" target="_blank">Translate</a></span></div></div>
<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'bn,en,gu,hi,ms,ta,te,ur', layout: google.translate.TranslateElement.InlineLayout.HORIZONTAL, gaTrack: true, gaId: 'UA-18100914-1'}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
			  
	


</body>
</html>