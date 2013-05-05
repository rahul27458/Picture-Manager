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
  
  String q=request.getParameter("q").toUpperCase();
 ResultSet rs=null;
 Statement st=null;
 List<PostBean> dataList=new ArrayList<PostBean>();
 try{
	 st=Database.dbconnect();
	 String sql="select post_name from post where UPPER(post_name) like'%"+q+"%'";
	 rs=st.executeQuery(sql);
	 PostBean postBean = new PostBean();
	 while(rs.next())
	 {
		 postBean.setPost(rs.getString("post_name"));
		 dataList.add(postBean);
	 }
	 for(PostBean postBean1 :dataList)
	 {
		 out.println(postBean1.getPost_name());
	 }
 }catch(SQLException e){
	 e.printStackTrace();
 }

%>

<%-- <%


<%-- int i=0,i3=0,size=0;
List dataList = new ArrayList(); 
ResultSet rs=null;
 Statement st=null;
 Connection conn = null;
 String hintname[];
st=Database.dbconnect();
	
try 
{
	
	String sqlret="select post_name from post";
	 rs=st.executeQuery(sqlret); 
	
	while (rs.next ())
	{

		  //Add records into data list
		size++;
		  dataList.add(rs.getString("post_name"));
		 
		 
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
hintname=new String[size];

Iterator it = dataList.iterator();
while(it.hasNext()) 
{
	String temp=(String)it.next();
	hintname[i3]=temp;
	i3++;
}

String hint="",q = request.getParameter("q");


try{

if(q.length()>0)
{
	hint="";

	for(i=0;i<size;i++)
	{
		
		

		if(q.length()>hintname[i].length())
			continue;
			if(q.equalsIgnoreCase(hintname[i].substring(0,q.length())))
			{
				if(hint=="")	
				{
					hint=hintname[i];
				}
				else
				{
					hint+=","+hintname[i];
				}
			}
			
	}		
			
	}
}
catch(Exception e)
{
	out.println("exception where i:"+i+" text:"+hintname[i]+"<br>");
	e.printStackTrace();
}
hint+=",";
if(hint=="")
	out.println("no suggestions");
	else
	{
		int start=0;
		for(int j1=0;j1<hint.length();j1++)
		{	
			char ch=hint.charAt(j1);
			
			if(ch==',')
			{
				String temp=hint.substring(start,j1);
				out.println(temp);
				%><br/>
				<% 
				start=j1+1;
			}
			
		}
		
		
	}


%> --%>

</body>
</html>