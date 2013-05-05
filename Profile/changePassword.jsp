<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
<link rel="stylesheet" type="text/css" href="../css/StyleDiscussion.css">
  <link rel="stylesheet" type="text/css" href="../css/style.css">
<style type="text/css">
#log_out{
		position:absolute;
		top:10px;
		right:10px;
		}
</style>
<style type="text/css">
#google_translate_element{
	 position:absolute;
	 top:100px;
	 right:10px;
	 }
</style>
 <script type="text/javascript">
function check_login(){
	var i;
	var email_bool=true;
   var password_bool=true;
   var current_password_bool=true;
 var useremail=document.getElementById("useremail").value;
 var password=document.getElementById("password").value;
 var current_password=document.getElementById("current_password").value;
 if(current_password=="" || current_password==" ")	
 {

	 current_password_bool=false;
 }

 if(useremail=="" || useremail==" ")	
{

 email_bool=false;
}
if(password=="")	
{

password_bool=false;
}

if(email_bool==false && password_bool==false && current_password_bool==false)
{
	alert("Please complete the form");
	return false;
	}
else if(current_password_bool==false)
    {
	alert("Password field is empty");
	return false;
}else if(email_bool==false){
	 
	alert("new password field is empty");
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

</head>
<body>
<!-- set session -->

	<% String user_id_s=request.getParameter("user_id");
												 
		int user_id=Integer.parseInt(user_id_s); 
																								 
		 %>
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
				<li><a href="../homepage.jsp?user_id=<%=user_id_s%>" >Home</a></li>
				<li><a href="display_profile.jsp?user_id=<%=user_id_s%>" accesskey="m">Profile</a></li>
				</ul>
		</div>
	<h1><font face="Comic Sans MS"> Enter details to change password</font></h1>
    
    
	<form  onsubmit="return check_login()" action="../PasswordCheck?user_id=<%=user_id%>" method="post">
	<table class="main_content" cellspacing="1"  cellpadding="5" border="0" >
     	
     	<tr>
     			<td>Current Password:</td>
     			<td><input type="password" name="current_password" id="current_password" /><br/></td>
     	</tr>
     
     	<tr>
     			<td>New password:</td>
     			<td><input type="password" name="new_password" id="useremail" /><br/></td>
     	</tr>
     	
     	<tr>
     			<td>Confirm password:</td>
     			<td><input type="password" name="confirm_password" id="password" /><br /></td>
     	</tr>
     	
     	<tr>
     
     			<td><input type="submit" value="Change"/></td>
		</tr>
	</table>
	
	</form>
	
	<%
			if(request.getParameter("message") != null) {
				out.println("<font color=\"red\">" + request.getParameter("message") + "</font>");
			}
		%>
	
	<div id="log_out">
   <a href="../Login/Login.jsp?logout=true">Logout</a>
  </div>
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