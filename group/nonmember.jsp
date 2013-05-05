<!doctype html>
  <%@page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
 <%@page import="com.beans.PostBean"%>
 <%@ page import ="java.util.*" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="../css/temp.css">
<link href="jquery.mCustomScrollbar.css" rel="stylesheet" />
<!-- for tabs -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
$(function() {
	$( "#tabs" ).tabs();
	});
</script>

<link rel="stylesheet" href="/resources/demos/style.css" />
<style>
.content{margin:0px; width:380px; height:90px; padding:0px; overflow:auto; background:#444; -webkit-border-radius:2px; -moz-border-radius:2px; border-radius:2px;}
.content .images_container{overflow:hidden;}
.content .images_container img{display:block; float:left; margin:0 0px; border:5px solid #777;}
a[rel='toggle-buttons-scroll-type']{display:inline-block; text-decoration:none; padding:3px 15px; -webkit-border-radius:15px; -moz-border-radius:15px; border-radius:15px; background:#000; margin:5px 20px 5px 0;}
</style>

<!-- Custom scrollbars CSS -->
<!-- tabs css -->
<style type="text/css">
#tabs{
width:800px;

}
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






<title>Groups</title>

</head>
<div class="header">
				<div class="top_info"></div>
				<div class="logo">
				<h1><a href="#" title="Best Place to share photos and videos"><span class="dark">DARK</span> 
				LORD</a></h1>
				</div>
				</div>
<div class="bar">
<ul>
<% String s1=request.getParameter("user_id");

int user_id=Integer.parseInt(s1); 
											 


%>	

<li class="browse_category">Welcome to DarkLord</li>
	
				<li><a href="../homepage.jsp?user_id=<%=user_id%>" >Home</a></li>
				<li><a href="../Profile/display_profile.jsp?user_id=<%=user_id%>" accesskey="m">Profile</a></li>
				
				
</ul>
</div>
<body>
<div class="right">

						

 		<h1>You have not been added by the group admin yet</h1>	<br>
 			

</div>


<table border="0"  class="left">
<tr>
<td>
<img src="lock.jpg" width="100%" >
</td>
</tr>




</table>
<div id="log_out">
   <a href="../Login/Login.jsp?logout=true">Logout</a>
  </div>

<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
$("a[rel^='prettyPhoto']").prettyPhoto();
});
</script>
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