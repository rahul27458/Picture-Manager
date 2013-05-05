<%@page import="com.beans.PostBean"%>
<%@page import="com.connection.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*" %>
<%@page language="java" import="java.util.*" %>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<%

List<PostBean> dataList = new ArrayList<PostBean>(); 
ResultSet rs=null;
 Statement st=null;
 Connection conn = null;
 String hintname[];
st=Database.dbconnect();
String hint="",q = request.getParameter("q").toUpperCase();
String user_id=request.getParameter("user_id");

	
try 
{
	
	String sqlret="select user_id,fname,profilepic from user_detail where UPPER(fname) like '"+q+'%'+"'";
	 rs=st.executeQuery(sqlret); 
	
	while (rs.next ())
	{

		  //Add records into data list
		  PostBean postBean=new PostBean();
		 postBean.setFname(rs.getString("fname"));
		 postBean.setFile_name(rs.getString("profilepic"));
		  postBean.setUser_id(rs.getInt("user_id"));
		  dataList.add(postBean);
		 
		 
	}
	for(PostBean postBean:dataList){
		%>
		
		<p><a href="Profile/see_profile.jsp?friend_id=<%= postBean.getUser_id() %>&user_id=<%=user_id%>"><img src="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" width="30px" height="40px" />&nbsp;&nbsp;&nbsp;<%=postBean.getFname() %></a></p>
		<%
		
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

		


%>
</body>
</html>