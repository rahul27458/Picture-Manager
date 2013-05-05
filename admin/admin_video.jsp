
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
		
		</style>
		<style type="text/css">
#google_translate_element{
	 position:absolute;
	 bottom:0px;
	 right:10px;
	 }
</style>
<title>Video</title>
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
				
				<li><a href="admin_homepage.jsp" >Image Reports</a></li>
				<li><a href="admin_video.jsp" >Video Reports</a></li>
				
			</ul>
		</div>


<!--Table-->
	<table border="2" width="80%" align="center">
			<tr bgcolor="#5A8096" align="center">
			<th><font color="white">Video Id</font></th>
			<th><font color="white">Report</font></th>
			<th><font color="white">User Id</font></th>
<% 
  if(true){
	      List<PostBean> dataList=new ArrayList<PostBean>();
  
	  try{
		  ResultSet rs=null;
		  Statement st=null;
		  st=Database.dbconnect();
		  String sql="select video_id,report,user_id from videoupload order by report desc";
		 rs= st.executeQuery(sql);
		  
		  while(rs.next())
	      {
	    	
	    	  PostBean postBean=new PostBean(); 
	    	  postBean.setUser_id(rs.getInt("user_id"));
	          postBean.setVideo_id(rs.getInt("Video_id"));
	          postBean.setReport(rs.getInt("report"));
	    	  dataList.add(postBean);
        

	    	  }
	  }catch(SQLException e){
		  
		  e.printStackTrace();
		  
	  }
	  
 
for(PostBean postBean : dataList) {
%>
<tr bgcolor="#eeeee" align="center">

<td><%=postBean.getVideo_id() %></td>

<td><%=postBean.getReport() %></td>

<td><%=postBean.getUser_id() %></td>

</tr>
<%
}
  }
%>
</table>
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