<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@page import="com.connection.*" %>
<%@page import="com.sappers.classes.EmailCheck" %>
<%@page import="com.AES.AESencrp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<!-- for text area -->
<link rel="stylesheet" type="text/css" href="../css/textarea.css" />
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Registration</title>
		<link rel="stylesheet" type="text/css" href="../css/StyleDiscussion.css">
				<link rel="stylesheet" type="text/css" href="style.css">
 		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
 		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 		<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
  		<link rel="stylesheet" href="/resources/demos/style.css" />
		<style type="text/css">
#google_translate_element{
	 position:absolute;
	 top:100px;
	 right:10px;
	 }
</style>
	</head>
	<body>
	<script>
	$(function() {
    		$( "#datepicker" ).datepicker();
 		 });
  
 function isNull()
	{
	
		var i,isvalid=1;
		var fname=document.getElementById("first_name").value;
	  var lname=document.getElementById("last_name").value;
	  var dob=document.getElementById("datepicker").value;
		var email=document.getElementById("email").value;
		var pass=document.getElementById("password").value;
		var cpass=document.getElementById("confirm_password").value;  
	
		if(!document.getElementById('Male').checked && !document.getElementById('Female').checked) {
			
			isvalid=0;
		}
		if(fname=="" || lname==""  || dob=="" || pass=="" || cpass=="" || email=="" || fname==" " || lname==" " || pass==" " || cpass==" " || email==" " )	
		{
		alert("Please complete the form");
		isvalid=0;
		return false;
		} 
		if(isvalid!=0)
			{
		 for(i=0;i<pass.length;i++)
		{
				var c=pass.charAt(i);
			
				if(pass.length<5 || c==' ')//minumum length 5 and no spaces allowed
				{
					alert("Password syntax is wrong");
					isvalid=0;
					break;
				}
		
		} 
		 if(isvalid!=0 && pass!=cpass)//if password are not equal
		{
		alert("Passwords dont match");
		isvalid=0;
		
		} 
		 
		
		 var atpos=email.indexOf("@");
		 var dotpos=email.lastIndexOf(".");
		
		 if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
		 {
		 	alert("Email id invalid");
		 	isvalid=0;
		 
		 }
		 }
		if(isvalid==0)
			{
			
		return false
			
			}
		
	
		
	} 

	</script>
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
				<li><a href="../Login/Login.jsp" accesskey="i">&nbsp;Login</a></li>
				<li><a href="../Demo/demo.jsp" accesskey="m">Demo</a></li>
				<li><a href="../About/about.jsp" accesskey="m">About Us</a></li>
			</ul>
		</div>
					<h1><font face="Comic Sans MS" size="06px">Registration</font></h1>
					
					<div class="main_contentvid">	
									 
					 <form onsubmit="return isNull()"  action="emailunique.jsp" method="post">
	
								<table border="0" cellpadding="5">
										<tr>
											<td><font face="Chiller" size="5"><b>First Name:</b></font></td>
											<td><input type="text" size="35" id="first_name" name="first_name"></td>
										<tr>
											<td><font face="Chiller" size="5"><b>LastName:</b></font></td>
											<td><input type="text" size="35" id="last_name" name="last_name"></td>
										</tr>
									   	<tr>
											<td><font face="Chiller" size="5"><b>Gender:</b></font>
											<td><font face="Chiller" size="5"><input type="radio" size="35" name="gender" id="Male" value="Male"><b>Male
												<input type="radio" size="35" name="gender" id="Female" value="Female">Female</b></font>
										</tr>
										<tr>
											<td><font face="Chiller" size="5"><b>Date of Birth:</b></font></td>
											<td><input type="text" id="datepicker" name="dob"/></td>
										
										</TR>
									
										<tr>
											<td></td>
											<td><font face="Chiller" size="5"><b>(mm/dd/yyyy)</b></font></td>
										</tr>
										
										
										<tr>
											<td><font face="Chiller" size="5"><b>Email id:</b></font></td>
											<td><input type="text" size="35" id="email" name="email">
										
											<%String message=request.getParameter("message");
											%>
											 
											<% 
												if(message!=null) {
												out.println("<font color=\"red\">" + message + "</font>");
												}
												%>
											
											</td> 
											
										</tr>
									
															
										<tr>
											<td><font face="Chiller" size="5"><b>Password:</b></font>
											</td>
											<td><input type="password" size="34" id="password" name="password" >
									<img src="../images/whats this.jpg"  width="21" height="21" Title="Password should have atleast 5 characters and no white spaces are allowed"/>
											
											
											</td>
										</tr>
										<tr>
											<td><font face="Chiller" size="5"><b>Confirm Password:</b></font></td>
											<td><input type="password" size="35" id="confirm_password" name="confirm_password">
										
											
											
											</td>		
										</tr>
										
										
										
										<tr>
											
											<td><font face="Chiller" size="5"><b>Hint question:</b></font></td>
											<td>
											<input type="text" size="35" id="mydropdown" name="mydropdown">
												
												
												<img src="../images/whats this.jpg"  width="21" height="21" Title="This is in case you forget your password"/></a>
											
											</td>
											
											
											
											</tr>
										
										
										
										<tr>
												<td><font face="Chiller" size="5"><b>Hint answer:</b></font></td>
												<td><textarea rows="4" cols="30" name="hint_text" id="hint_text"></textarea>
												<img src="../images/whats this.jpg"  width="21" height="21" Title="Please choose a question such that the answer is known only to you "/>
												
												</td>
												
												</tr>
										
															 
											
												
										<tr>
											<td colspan="2">
											<font face="Chiller" size="5"><center><input type="submit"  value="Register"></center></font></td>
												
										</tr>
										
								</table>		
									  
					      </form>
					      		 <p> After registering an email id will be sent to your mail please click the activation link to activate your account</p>
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