<%@page import="com.beans.PostBean"%>
<%@page import="com.connection.Database"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" type="text/css" href="../css/group_temp.css">
 <style type="text/css">
		#log_out{
		position:absolute;
		top:10px;
		right:10px;
		}
		#delete_image{
		position:relative;
		top:20px;
		left:430px;
		}
		#delete_video{
		position:relative;
		bottom:10px;
		left:600px;
		}
		
		</style>
		<style type="text/css">
#google_translate_element{
	 position:absolute;
	 top:100px;
	 right:10px;
	 }
</style>
<title>Admin Home</title>
</head>
<body>
<% String user_name=request.getParameter("user_name");
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
				
				
			</ul>
		</div>
<br/>

<form action="../report.jsp">
<table align="center" width="400">
<tr>
<th>
<h3 style="float:left;">View Data:</h3>
</th>
</tr>
<tr>

<td>
<select name="filename">
<option value="demo_report.jasper">Group reports</option>
<option value="image_block.jasper">Image reports</option>
<option value="block_video.jasper">Video reports</option>
</select>


<input type="radio" name="reporttype" value="pdf">pdf
<input type="radio" name="reporttype" value="rtf">rtf
<input type="radio" name="reporttype" value="csv">csv
</td>
</tr>
<tr>
<td>
<input type="submit" value="Generate report">
</td>
</tr>
</table>
</form>
<br>
<h3><center>Delete posts whose number of reports have exceeded the number of likes by 490 :</center></h3>
<div id="delete_image">

<form method="post" action="block.jsp">
<input type="submit" value="Delete images" title="Delete images which have the reached above stated threshold">
</form>
	<div id="error">
		<%
			if(request.getParameter("message") != null) {
				out.println("<font color=\"red\">" + request.getParameter("message") + "</font>");
			}
		%>
		
		</div>
		</div>
		<div id="delete_video">
		<form method="post" action="videoblock.jsp">
<input type="submit" value="Delete videos" title="Delete videos which have reached above stated threshold">
</form>
	<div id="error2">
		<%
			if(request.getParameter("message2") != null) {
				out.println("<font color=\"red\">" + request.getParameter("message2") + "</font>");
			}
		%>
		
		</div>
		</div>
		
<div id="log_out">
   <a href="admin_login.jsp?logout=true">Logout</a>
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