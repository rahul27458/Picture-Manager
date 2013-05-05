<%@page import="java.sql.SQLException"%>
<%@page import="com.connection.Database"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
  ResultSet rs=null;
  Statement st=null ;
  
  st=Database.dbconnect();
  try{
	  String sql="delete from videoupload where report>500 and likes<10";
	  int i=st.executeUpdate(sql);
	  if(i!=0)
	  {
		  response.sendRedirect("admin_homepage.jsp?message2=images have been deleted as per site policy");
	  }else{
		  response.sendRedirect("admin_homepage.jsp?message2=No entries to delete");
	  }
	  
  }catch(SQLException e)
  {
	  e.printStackTrace();
  }
  
  
%>
</body>
</html>