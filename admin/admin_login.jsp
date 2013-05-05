<! doctype html>
<html>
	<head>
			<link rel="stylesheet" href="../css/style.css">
			<title>Admin Login</title>
			<style type="text/css">
			  #error{
			   position : absolute;
			   top:150px;
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

</body>
<h1 align="center"><span class="dark" >Admin Login</span></h1><br><br>
	<form action="../AdminLog" method="post">
		<table align="center" width="400">
			<tr>
				<td align="right"><b>User Name:</b></td>
				<td><input type="text" size="10" name="f_name"></td>
			</tr>
			
			<tr>
				<td align="right"><b>Password:</b></td>
				<td><input type="password" name="f_password" size="10"></td>
			</tr>
			<tr>
				<td align="right"><b><input type="submit" id="submit" value="Accept"></b></td>
				<td align="left"><input type="reset" id="reset"></td>
			</tr>
		</table>
		</form>
		<div id="error">
		<%
			if(request.getParameter("message") != null) {
				out.println("<font color=\"red\">" + request.getParameter("message") + "</font>");
			}
		%>
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
			  
	
		</html>