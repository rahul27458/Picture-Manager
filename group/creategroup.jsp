<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
<%@page import="jforum.GroupRedirect;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/group_temp.css">
<link rel="stylesheet" type="text/css" href="../css/StyleDiscussion.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create A New Group</title>
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
<!-- Check whether comment is added -->
<script type="text/javascript">

function check_group_name(){
	var group_name=document.getElementById("group_name").value;
	group_name=group_name.trim();
if(group_name=="" || group_name==" " )	
{
  alert("Please Add a Name for the group");

return false;
}
 }
</script>
</head>
<body>

 <% String user_id=request.getParameter("user_id");
 
   %>
				<div class="header">
				<div class="top_info"></div>
				<div class="logo">
				<h1><a href="#" title="Best Place to share photos and videos"><span class="dark">DARK</span> 
				LORD</a></h1>
				</div>
				</div>
				<div class="bar">
				<ul>
			
				
                <li class="browse_category">Welcome to DarkLord</li>
               <li><a href="../homepage.jsp?user_id=<%=user_id%>" >Home</a></li>
               <li><a href="../Profile/display_profile.jsp?user_id=<%=user_id%>" accesskey="m">Profile</a></li>
				
				</ul>
				</div>
				
				<div class="main_contentgrp">
				
						<form onsubmit=" return check_group_name()"method="POST" action="../GroupCreate?user_id=<%=user_id%>">
						<font face="Chiller" size="5"><b>Name of the Group:</b><input type="text" id="group_name" name="group_name"></font>								
						<br>
						<input type="submit" value="Create Group">
						</form>

				
				
		</div>	
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