
<!DOCTYPE html>
<%@page import="com.connection.Database"%>
<%@page import="com.beans.PostBean"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<html>
	<head>
	<title>Auto recommendation</title>
	<style type="text/css">
	 #new_topic{
	 position: fixed;
	right:100px;
	 top:100px;
	 }
	#hot_topic{
	 position: fixed;
	 right:100px;
	 top:300px;
	 }
	</style>
	</head>
	<body>
	<div id="new_topic">
	 <h1>New topics</h1>
	 <ol>
<%
List <PostBean> dataList = new ArrayList <PostBean> (); 
 
 ResultSet rs=null;
 
Statement st=Database.dbconnect();  



try 
{

String sqlret="select post_name from post order by time_stamp desc fetch first 5 rows only ";
// select rp.posts,ru.username from Rahuluser ru,Rahulpost rp where ru.user_id1=rp.user_id
rs=st.executeQuery(sqlret); 

while (rs.next ())
{
//Add records into data list
PostBean postBean=new PostBean();

postBean.setPost_name(rs.getString("post_name"));

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

} catch(Exception e) {
e.printStackTrace();
}
}
//Iterator it = dataList.iterator();
for(PostBean postBean : dataList) {
out.println("<li>"+postBean.getPost_name()+"</li>");

 
}
%>
</ol>
	</div>
	<div id="hot_topic">
	<h2>Top 5 topic</h2>
	<ol>
	<%
	  List<PostBean> dataList1=new ArrayList<PostBean>();
	  ResultSet rs1=null;
	  Statement st1=Database.dbconnect();
	  try{String sqlret1="select post_name from post order by num_post desc fetch first 5 rows only ";
	// select rp.posts,ru.username from Rahuluser ru,Rahulpost rp where ru.user_id1=rp.user_id
	  rs1=st1.executeQuery(sqlret1); 

	  while (rs1.next ())
	  {
	  //Add records into data list
	  PostBean postBean1=new PostBean();

	  postBean1.setPost_name(rs1.getString("post_name"));

	  dataList1.add(postBean1);


	  }
	  }
	  catch (Exception e) 
	  {
	  out.println(e);
	  } finally{
	  try {
	  if(rs1 != null) {
	  rs1.close ();
	  }
	  if(st1 != null) {
	  st1.close ();
	  }

	  } catch(Exception e) {
	  e.printStackTrace();
	  }
	  }
	  //Iterator it = dataList.iterator();
	  for(PostBean postBean1 : dataList1) {
	  out.println("<li>"+postBean1.getPost_name()+"</li>");

	   
	  }
		  
	  
	
	%></ol>
	</div>
	
	</body>
</html>