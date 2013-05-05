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
	
	String sqlret="select ud.fname,ud.email_id,ud.profilepic from user_detail ud where user_id  in (select uf.friend_id from user_friend uf where uf.user_id='"+user_id+"') and UPPER(ud.fname) like  '"+q+'%'+"'";
	 rs=st.executeQuery(sqlret); 
	
	while (rs.next())
	{

		  //Add records into data list
		  PostBean postBean=new PostBean();
		 postBean.setFname(rs.getString("fname"));
		postBean.setEmail_id(rs.getString("email_id"));
		 postBean.setFile_name(rs.getString("profilepic"));
		  dataList.add(postBean);
		 
	
	}
	for(PostBean postBean:dataList){
		%>
		
		<p><img src="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" width="30px" height="40px" />&nbsp;&nbsp;&nbsp;<a href="#"  onclick="document.taggs.title.value='<%=postBean.getFname()%>';document.taggs.hiddentitle.value='<%=postBean.getEmail_id()%>' "><%=postBean.getFname()%>(<%=postBean.getEmail_id()%>)</a></p>
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