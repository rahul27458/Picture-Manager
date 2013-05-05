<%@page import="com.connection.Database"%>
<%@page import="com.beans.PostBean"%>
<%@page import="java.lang.Thread.State"%>
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
String hint="",q = request.getParameter("q");
 Statement st=null;
 ResultSet rs=null;
 List<PostBean> datList=new ArrayList<PostBean>();
 try{
	 st=Database.dbconnect();
	 String sql="select group_name from group where group_name like '"+q+'%'+"'";
	 rs=st.executeQuery(sql);
	 while(rs.next())
	 {
		 PostBean postBean=new PostBean();
		 postBean.setName1(rs.getString("group_name"));
	 }
	 
	 for(PostBean postBean : datList)
	 {
		 %>
		 <p><%=postBean.getName1() %></p>
		 <%
		 
	 }
 }catch(SQLException e ){
	 e.printStackTrace();
 }


%>
</body>
</html>