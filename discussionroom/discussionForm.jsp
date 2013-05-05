<!--Discussion forum -->
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
	<link rel="stylesheet" type="text/css" href="../css/StyleDiscussion.css">
	<title>
		Discussion Forum 
	</title>
	<!-- for text area -->
<link rel="stylesheet" type="text/css" href="../css/textarea.css" />
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

function check_fields(){
	var nameOfTopic=document.getElementById("nameOfTopic").value;
	var postdescription=document.getElementById("postdescription").value;
	nameOfTopic=nameOfTopic.trim();
	postdescription=postdescription.trim();
if(nameOfTopic=="" || nameOfTopic==" " )	
{
  alert("Please Add a Name for the topic");

return false;
}else{
	if(postdescription=="" || postdescription==" " )	
	{
	  alert("Please Add a Description for the post");

	return false;
	}
	
}
 }
</script>
</head>
<body>
<%String user_id=request.getParameter("user_id");

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
				<li class="browse_category">Welcome to Dark Lord</li>
				<li><a href="../homepage.jsp?user_id=<%=user_id%>" >Home</a></li>
			   <li><a href="../Profile/display_profile.jsp?user_id=<%=user_id%>" >Profile</a></li>
				
				
			</ul>
		</div>
	<h1><font face="Comic Sans MS"> Enter the details of your topic</font></h1>
	<div class="main_content">
		<form onsubmit="return check_fields()" method="POST" action="../DiscussionServlet?user_id=<%=user_id%>">
			<table>
				<tr>
					<td>Name of the topic:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="40" id="nameOfTopic"  name="nameOfTopic" /></td>
				</tr>
				<tr>
					<td><b>Category</b>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="category">
						<option value="tech">Technology</option>
						<option value="programming">Programming</option>
						<option value="movie">Movie</option>
						<option value="fun">Fun</option>
					</select></td>
				</tr>
				<tr>
				<td>
					Post Description:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="postdescription" id="postdescription" cols="40"  rows="6"></textarea>
				</td>
				<tr>
					<td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="submit" ></td>
				</tr>
			</table>
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