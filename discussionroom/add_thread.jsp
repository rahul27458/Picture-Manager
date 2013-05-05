<%@page import="com.connection.Database"%>
<%@page import="java.sql.SQLException"%>
<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
ResultSet rs=null;
Statement st=null;

st=Database.dbconnect();
try{
	String post_text=request.getParameter("post_texts");
	String user_id_s=request.getParameter("user_id");
	int user_id=Integer.parseInt(user_id_s);
	String sql="insert into post_text(post_id,text,user_id,time_stamp) values('"+request.getParameter("post_id")+"','"+post_text+"','"+user_id+"',current timestamp)";
     st.executeUpdate(sql);
     String sql1="UPDATE post SET num_post= num_post + 1 WHERE post_id='"+request.getParameter("post_id")+"'";
     st.executeUpdate(sql1);
   response.sendRedirect("topic.jsp?post_id="+request.getParameter("post_id")+"&user_id="+user_id_s);
}catch(SQLException e){
	e.printStackTrace();
}
%>



</body>
</html> 