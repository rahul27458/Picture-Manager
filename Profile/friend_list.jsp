<%@page import="com.beans.PostBean"%>
<%@page import="com.connection.Database"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#google_translate_element{
	 position:absolute;
	 bottom:0px;
	 right:10px;
	 }
	 #log_out{
		position:absolute;
		top:10px;
		right:10px;
		}
</style>
<meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="../css/StyleDiscussion.css">
<link rel="stylesheet" type="text/css" href="../css/group_temp.css">
<link href="jquery.mCustomScrollbar.css" rel="stylesheet" />
<!-- for tabs -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
		<!--script src="js/jquery.lint.js" type="text/javascript" charset="utf-8"></script-->
		<link rel="stylesheet" href="../css/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
		<script src="../js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
		<!-- to check whether image is in relevant format -->
		<script src="../js/fileExt.js" type="text/javascript" charset="utf-8"></script>
		
	   

<title>My Friends</title>
</head>
<body>
<!-- Set session -->

  <%
    //String friend_id_s=request.getParameter("friend_id");
   // int friend_id=Integer.parseInt(friend_id_s);
    String user_id_s=request.getParameter("user_id");
    int user_id=Integer.parseInt(user_id_s);
    
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
				<li><a href="../homepage.jsp?user_id=<%=user_id_s%>" >Home</a></li>
				<li><a href="../Profile/display_profile.jsp?user_id=<%=request.getParameter("user_id")%>" accesskey="m">Profile</a></li>
			</ul>
		</div>
		<h1 font="sanserif" size="14">Friends List</h1>
		<div class="main_contentvid">
<%
if(true){
	
	 List<PostBean> dataList=new ArrayList<PostBean>();
 ResultSet rs=null;
 Statement st=null;
 try{
	 st=Database.dbconnect();
	 String sql="select ru.fname,ru.user_id,ru.profilepic from user_detail ru,user_friend rf where rf.friend_id='"+user_id+"' and rf.user_id=ru.user_id";
	 rs=st.executeQuery(sql);
	 while(rs.next()){
		 PostBean postBean=new PostBean();
		 postBean.setFname(rs.getString("fname"));
		 postBean.setFile_name(rs.getString("profilepic"));
		 postBean.setFriend_id(rs.getInt("user_id"));
		 dataList.add(postBean);
		 
	 }%><ol >
	 <%
	 for(PostBean postBean: dataList){
		 String fileDes="Profile Pic";
		 %>
		  
		  <li> <a href="see_profile.jsp?friend_id=<%=postBean.getFriend_id()%>&user_id=<%=user_id%>"><h2><%=postBean.getFname() %></h2><br /></a><a href="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" rel="prettyPhoto"><img src="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" width="75.0%"  style="position:relative; " alt="<%=fileDes %>" /></a></li>
		 <br/><br/><br/><%
	 }%>	</ol><%
	
 }catch(SQLException e){
	 e.printStackTrace();
 }

}
%>
</div>

<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
$("a[rel^='prettyPhoto']").prettyPhoto();
});
</script>
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