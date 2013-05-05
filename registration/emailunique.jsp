<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@page import="com.connection.*" %>
<%@page import="com.sappers.classes.EmailCheck" %>
<%@page import="com.AES.AESencrp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<% 
String emailuser=request.getParameter("email");	
		
try
{
ResultSet rs=null;
Statement st=null;
st=Database.dbconnect();
/*  String emailuser=request.getParameter("useremail"); */
String message=request.getParameter("message");
String sql="select * from user_detail where email_id='"+emailuser+"'";
rs=st.executeQuery(sql);
if(rs.next())
{
	 response.sendRedirect("reginfo.jsp?message=Email id already in use");
}

else
{
	String first_name=request.getParameter("first_name");
	String last_name=request.getParameter("last_name");
	String gender=request.getParameter("gender");
	String dob=request.getParameter("dob");	
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String hint_q=request.getParameter("mydropdown");
	String hint_a=request.getParameter("hint_text");
	String password2="";
	
    try {
		 try {
			password2=AESencrp.encrypt(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	

	String query1="insert into user_detail (fname,lname,gender,dob,email_id,user_password,hint_q,hint_a) values ('"+first_name+"','"+last_name+"','"+gender+"','"+dob+"','"+email+"','"+password2+"','"+hint_q+"','"+hint_a+"')";
  
	

			    
						 
						   st.executeUpdate(query1);
						  
						//send activation link to email id
						   EmailCheck obj=new EmailCheck();
						 obj.emailSend(email);
						   
					   }
					   catch(SQLException e)
					   {
						   
						   
						 e.printStackTrace();
						   
					   }
		 

	    response.sendRedirect("../Login/Login.jsp?activate");
}
}
catch(SQLException e)
{
	e.printStackTrace();
}
		
%>
 	
</body>
</html>