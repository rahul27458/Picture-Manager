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
 String q = request.getParameter("q").toUpperCase();
 String group_id=request.getParameter("group_id");
st=Database.dbconnect();

String user_id=request.getParameter("user_id");
	
try 
{
	
	String sqlret="select email_id from user_detail,user_group where user_group.group_id='"+group_id+"' AND user_group.user_id=user_detail.user_id and UPPER(email_id) like '"+q+'%'+"'";
	 rs=st.executeQuery(sqlret); 
	
	while (rs.next ())
	{

		  //Add records into data list
		  PostBean postBean=new PostBean();
		  postBean.setName1(rs.getString("email_id"));
		  
		  dataList.add(postBean);
		 
		 
	}
	for(PostBean postBean:dataList){
		%>
		
		<p><%=postBean.getName1()%></p>
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