<%@page import="com.beans.PostBean"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*" %>
<%@page language="java" import="java.util.*" %>
<html>
<head>
<title>Data Page</title>
  <link href="generic.css" rel="stylesheet" type="text/css" />
 
	<link rel="stylesheet" type="text/css" href="../css/style.css">
 <style type="text/css">

	#footer{
	  position:fixed;
	  bottom:0px;
	}
	#log_out{
		position:absolute;
		top:10px;
		right:10px;
		}
    #txtHint{
     position: absolute;
     top:190px;
     left:90px; 
    }
 </style>
<style type="text/css">
#google_translate_element{
	 position:absolute;
	 bottom:0px;
	 right:10px;
	 }
</style>
</head>
<body> 
<!-- Set session -->
<% String user_id_s=request.getParameter("user_id");
  %>
<% int user_id=Integer.parseInt(user_id_s); 
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
				<li><a href="../homepage.jsp?user_id=<%=user_id%>" >Home</a></li>
			   <li><a href="../Profile/display_profile.jsp?user_id=<%=user_id%>" >Profile</a></li>
				
			</ul>
		</div>
		
<div class="topic">
<script lang="javascript">
function showHint(str)
{
var xmlhttp;
var user_id=<%=user_id%>;
if (str.length==0)
  { 
  document.getElementByName("txt1").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","posthint.jsp?q="+str+"&user_id="+user_id,true);
xmlhttp.send();
}
</script>
<form id="tw-form" method="post">
<br><br><br><font size="5">Search:</font> 
<input id="tw-input-text" size="10" name="txt1" onkeyup="showHint(this.value)" />

<br/><span id="txtHint"></span>
<br><br><br></form>
<br>

	<!--Table-->
	<table border="2" width="80%" align="center">
			<tr bgcolor="#5A8096" align="center">
			<th height="100px"><font color="white">Topic</font></th>
			<th><font color="white">Time of creation</font></th>
			<th><font color="white">Author</font></th>
			<th><font color="white">Category</font></th>
			
		</tr>
	
<%
List <PostBean> dataList = new ArrayList <PostBean> (); 

ResultSet rs=null;
Statement st=null;
Connection conn = null;
try
{
Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
} 
catch (ClassNotFoundException e)
{
e.printStackTrace();
} 
catch (InstantiationException e) 
{
e.printStackTrace();
} 
catch (IllegalAccessException e) 
{
e.printStackTrace();
}
try
{
conn = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTDB1","root","root"); 
st= conn.createStatement(); 

}catch(Exception e){}

try 
{

String sqlret="select ru.fname,rp.post_name,rp.time_stamp,rp.post_id,rp.postdescription,rp.category from user_detail ru,post rp where ru.user_id=rp.user_id ORDER by time_stamp DESC";
// select rp.posts,ru.username from Rahuluser ru,Rahulpost rp where ru.user_id1=rp.user_id
rs=st.executeQuery(sqlret); 

while (rs.next ())
{
	
//Add records into data list
PostBean postBean = new PostBean();
postBean.setPost_name(rs.getString("post_name"));
postBean.setPost_id(rs.getInt("post_id"));
postBean.setTime_stamp(rs.getString("time_stamp"));
postBean.setFname(rs.getString("fname"));
postBean.setCategory(rs.getString("category"));
//postBean.setPost_description(rs.getString("postdescription"));
dataList.add(postBean);


}
}
catch (Exception e) 
{
out.println(e);
} finally{
try {
if(rs != null) {
rs.close ();
}
if(st != null) {
st.close ();
}
	if(conn != null) {
	conn.close();
	}
} catch(Exception e) {
e.printStackTrace();
}
}
//Iterator it = dataList.iterator();
for(PostBean postBean : dataList) {
	%>
<tr bgcolor="#eeeee" align="center">

<td> <a href="topic.jsp?post_id=<%= postBean.getPost_id()%>&user_id=<%=user_id%>"><%=postBean.getPost_name() %></a></td>
<!-- out.println("<td>"+postBean.getUsername()+"</td>")  -->
<td><%=postBean.getTime_stamp() %></td>

<td><%=postBean.getFname() %></td>
<td><%=postBean.getCategory() %></td>
</tr>
<% 
}
%>
</table>

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