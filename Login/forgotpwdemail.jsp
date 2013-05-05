<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
 <%@page import="com.beans.PostBean"%>
 <%@ page import ="java.util.*" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
<link rel="stylesheet" type="text/css" href="../css/StyleDiscussion.css">
<style type="text/css">
#google_translate_element{
	 position:absolute;
	top:100px;
	 right:10px;
	 }
	 #form_content
	 { position: :relative;
	 }
</style>
<script type="text/javascript">
function check_login()
{
var useremail=document.getElementById("useremail").value;
 
useremail=useremail.trim();

 if(useremail=="" || useremail==" ")	
{
 alert("user email empty");
 return false;
}
 
}
 </script>
</head>
<body>
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
				<li><a href="../Login/Login.jsp" accesskey="m">Login</a></li>
				<li><a href="../registration/reginfo.jsp" accesskey="i">&nbsp;Sign Up!!</a></li>
				<li><a href="../About/about.jsp" accesskey="m">About Us</a></li>
			</ul>
		</div>
		
		<div id="form_content">
		
		
		<% 
		 String emailuser=request.getParameter("useremail");
		
		if(emailuser!=null)
		{
			
		boolean executepage=true;
		try
{
 ResultSet rs=null;
 Statement st=null;
 st=Database.dbconnect();
/*  String emailuser=request.getParameter("useremail"); */
 String message=request.getParameter("message");
String sql="select * from user_detail where email_id='"+emailuser+"'";
 rs=st.executeQuery(sql);
 if(!rs.next())
 {
	 response.sendRedirect("forgotpwdemail.jsp?message=Invalid emailid");
 }
 else
 {
	 
	
		out.println("in servlet");
		String question="";
		
		String sql1="Select hint_q from user_detail where email_id='"+emailuser+"'";
		try {
			rs=st.executeQuery(sql1);
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		try {
			if(rs.next())
			{	
				
				question=rs.getString("hint_q");
			
				   response.sendRedirect("forgotpassword.jsp?question="+question+"&email="+emailuser);
			 
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
 }
 
}
catch(SQLException e)
{
	e.printStackTrace();
}
		}
 %>
 
<form action="forgotpwdemail.jsp">
<h1><font face="Comic Sans MS"> Enter your email id</font></h1>

	
<table class="main_content" border="0" cellspacing="1" cellpadding="5">
		<tr>
				<td><font face="Chiller" size="5"><b>Email:</b></font>
		
		<input type="text" size="35" name="useremail" id="useremail"></td>
		</tr>
		<tr>
				<td><input type="submit" onclick="return check_login()"></td>
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
</table>
</form>
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