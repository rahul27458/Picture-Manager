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
	
	String sqlret="select post_name,post_id from post where UPPER(post_name) like '"+q+'%'+"'";
	 rs=st.executeQuery(sqlret); 
	
	while (rs.next ())
	{

		  //Add records into data list
		  PostBean postBean=new PostBean();
		  postBean.setPost_name(rs.getString("post_name"));
		  postBean.setPost_id(rs.getInt("post_id"));
		  dataList.add(postBean);
		 
		 
	}
	for(PostBean postBean:dataList){
		%>
		
		<a href="topic.jsp?post_id=<%= postBean.getPost_id() %>&user_id=<%=user_id%>"><p><%=postBean.getPost_name()%></p></a>
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