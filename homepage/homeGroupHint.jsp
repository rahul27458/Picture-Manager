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
List<PostBean> dataList2 = new ArrayList<PostBean>();
List<PostBean> dataList3 = new ArrayList<PostBean>();
ResultSet rs=null;
 Statement st=null;
 ResultSet rs2=null;
 Statement st2=null;
 ResultSet rs3=null;
 Statement st3=null;

 
boolean check_admin=false;
boolean check_member=false;
st=Database.dbconnect();
st2=Database.dbconnect();
st3=Database.dbconnect();
String hint="",q = request.getParameter("q").toUpperCase();
String user_ids=request.getParameter("user_id");
int user_id=Integer.parseInt(user_ids);
	
try 
{
	
	String sqlret="select user_id,group_id,group_name,profilepic from groups where user_id='"+user_id+"' and UPPER(group_name) like '"+q+'%'+"'";
	 rs=st.executeQuery(sqlret); 
    String sql2="select rg.user_id,rg.group_id,rp.group_name,rp.profilepic from user_group rg,groups rp where rg.user_id='"+user_id+"' and rg.group_id=rp.group_id and (UPPER(rp.group_name) like '"+q+'%'+"')";
	String sql3="select group_id,group_name,profilepic from groups where UPPER(group_name) like'"+q+'%'+"'";
	rs3=st3.executeQuery(sql3);
    rs2=st2.executeQuery(sql2);
	while (rs.next () )
	{

		  //Add records into data list
		  PostBean postBean=new PostBean();
		  
		 postBean.setName1(rs.getString("group_name"));
		 postBean.setFile_name(rs.getString("profilepic"));
		  postBean.setFriend_id(rs.getInt("group_id"));
		  postBean.setUser_id(rs.getInt("user_id"));
		  dataList.add(postBean);
		check_admin=true;
		 
	}
	if(check_admin !=true)
	{
	while(rs2.next())
	{
		//Add records into data list
		  PostBean postBean2=new PostBean();
		  
		 postBean2.setName1(rs2.getString("group_name"));
		 postBean2.setFile_name(rs2.getString("profilepic"));
		  postBean2.setFriend_id(rs2.getInt("group_id"));
		  postBean2.setUser_id(rs2.getInt("user_id"));
		  dataList2.add(postBean2);
		  check_member=true;
	}
	for(PostBean postBean2:dataList2){
		if(check_member)
		{ check_member=true;
		%>
		
		<p><a href="group/groupmember.jsp?group_id=<%= postBean2.getFriend_id() %>&user_id=<%=user_id%>"><img src="/xyz/DisplayImages/?fileName=<%=postBean2.getFile_name()%>" width="30px" height="40px" />&nbsp;&nbsp;&nbsp;<%=postBean2.getName1() %></a></p>
		<%
		}
	}
	if(check_member !=true)
	{
	while(rs3.next())
	{
		//Add records into data list
		  PostBean postBean3=new PostBean();
		  
		 postBean3.setName1(rs3.getString("group_name"));
		 postBean3.setFile_name(rs3.getString("profilepic"));
		  postBean3.setFriend_id(rs3.getInt("group_id"));
		  
		  dataList3.add(postBean3);
		
	}

	for(PostBean postBean3:dataList3){
		if(!check_member && !check_admin)
		%>
		
		<p><a href="group/nonmember.jsp?group_id=<%= postBean3.getFriend_id() %>&user_id=<%=user_id%>"><img src="/xyz/DisplayImages/?fileName=<%=postBean3.getFile_name()%>" width="30px" height="40px" />&nbsp;&nbsp;&nbsp;<%=postBean3.getName1() %></a></p>
		<%
		
	}
	}
	}
	
	for(PostBean postBean:dataList){
		if(user_id==postBean.getUser_id() && check_admin)
		{check_admin=true;
		%>
		
		<p><a href="group/groups.jsp?group_id=<%= postBean.getFriend_id() %>&user_id=<%=user_id%>"><img src="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" width="30px" height="40px" />&nbsp;&nbsp;&nbsp;<%=postBean.getName1() %></a></p>
		<%
		}
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
		if(rs2 != null) {
			rs2.close ();
				}

				if(st2 != null) {
			  st2.close ();
				}
		
	} catch(Exception e) {
		e.printStackTrace();
	}
}

		


%>
</body>
</html>