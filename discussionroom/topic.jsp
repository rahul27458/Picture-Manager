<%@page import="com.connection.Database"%>
<%@page import="com.beans.PostBean"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*" %>
<%@page language="java" import="java.util.*" %>
<html>
<head>
<style type="text/css">
#google_translate_element{
	 position:absolute;
	 top:410px;
	 right:10px;
	 }
</style>
<!-- for text area -->
<link rel="stylesheet" type="text/css" href="../css/textarea.css" />
<title>Data Page</title>
  <link href="generic.css" rel="stylesheet" type="text/css" />
 
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	
	 <!-- Check whether comment is added -->
<script type="text/javascript">

function check_fields(){
	var post_texts=document.getElementById("post_texts").value;
	post_texts=post_texts.trim();
  if(post_texts=="" || post_texts==" " )	
{
  alert("Please Add a Comment");

return false;
}
}
</script>
   <style type="text/css">
   #desc{
           margin-right:320px;
           margin-left:50px;
           position:relative;
            background-color:#FFD699; 
            word-wrap: break-word;} 
    #second_desc{
            
           position:relative;
            min-width:675px;
            max-width:675px;
            word-wrap: break-word }
            #topic{
            position:absolute;
              left:50px;
              background-color:#FFEBCC;
            }
             #comment_text{
            position:absolute;
            right:5px;
            
            } 
            #report{
            position: absolute;
            right:25px;
            top:150px;
            }
             #closetopic{
            position: absolute;
            right:25px;
            top:180px;
            }
          #log_out{
		position:absolute;
		top:10px;
		right:10px;
		}
   </style>
   
   </head>
	<body>
<!-- Set session -->
<% 
String user_id_s=request.getParameter("user_id");
int user_id=Integer.parseInt(user_id_s); 
    %>
	<!--header-->
<div class="header">
				<div class="top_info"></div>
				<div class="logo">
				<h1><a href="#" title="Best Place to share photos and videos"><span class="dark">DARK</span> 
				LORD</a></h1>
				</div>
				</div>
				
<!--Menu-->
<div class="bar">
			<ul>
				<li class="browse_category">Welcome to Dark Lord</li>
				<li><a href="../homepage.jsp?user_id=<%=user_id%>" >Home</a></li>
			   <li><a href="../Profile/display_profile.jsp?user_id=<%=user_id%>" >Profile</a></li>
				
			</ul>
		</div>
		
<%
if(true)
{		
	ResultSet rs=null,rs2=null;
	Statement st=null,st2=null;
	st=Database.dbconnect();
	st2=Database.dbconnect();

try{

String sqlret="select * from post where post_id="+ request.getParameter("post_id");

	rs=st.executeQuery(sqlret);
	
   if(rs.next())
	{PostBean postBean=new PostBean();
	PostBean postBean2=new PostBean();
	postBean.setUser_id(rs.getInt("user_id"));
	
	String sql1="select fname from user_detail where user_id='"+postBean.getUser_id()+"'";
 postBean.setPost_description(rs.getString("postdescription"));
   postBean.setTime_stamp(rs.getString("time_stamp"));
    postBean.setPost_name(rs.getString("post_name"));
	
    rs2=st2.executeQuery(sql1);
	if(rs2.next())
	{
    postBean2.setFname(rs2.getString("fname"));
	
  %>
  
	<br><br><br><center><font size="5"><%= postBean.getPost_name() %> </font></center><br><br><br>
	<div id="desc">
	
   <h2> <%=postBean2.getFname() %> </h2>
	<h3> <%=postBean.getTime_stamp() %> </h3>
	
    	<p><%=postBean.getPost_description() %></p>
	
	</div>
	<%	
	}
	}
     }catch(SQLException e){
	e.printStackTrace();
}  finally{
	try {
		
		if(rs2 != null) {
			rs2.close ();
			}
		if(st2 != null) {
			st2.close ();
			}
	}catch(SQLException e){
		e.printStackTrace();
	}
} 
}
%>
	
 <!-- Report button add user id and post id in session -->
 <% if(true){
	  ResultSet rs_report=null;
     Statement st_report=null;
     try{
    	 String sql_report="select user_id,post_id from post_report where post_id="+request.getParameter("post_id");
    	 st_report=Database.dbconnect();
    	 rs_report=st_report.executeQuery(sql_report);
    
    	if(rs_report.next())
    	{
    	PostBean postBean_report=new PostBean();
    	postBean_report.setPost_id(rs_report.getInt("post_id"));
    	postBean_report.setUser_id(rs_report.getInt("user_id"));
    	
    	String post_id_s=request.getParameter("post_id");
    	int post_id=Integer.parseInt(post_id_s);
    	
    	if(user_id==postBean_report.getUser_id() && post_id==postBean_report.getPost_id())
    	{ %>
    	   <h3 align="center">You have reported this post</h3>
    	
    	<%	
    	}

    	}
    	else{
    		%> 

    			<div id="report">
					<form method="post" action="../Report?user_id=<%=user_id%>&post_id=<%=request.getParameter("post_id")%>">
					<input type="submit" value="Report" style="background-color:red; color:white" height="40px;">
					</form>
					</div>
    		<%
    	}
     }catch(SQLException e){
    	 e.printStackTrace();
     } finally{
			try {
				
				if(st_report != null) {
				st_report.close ();
				}
				if(rs_report != null) {
					rs_report.close ();
					}
				}catch(SQLException e){
				e.printStackTrace();
			}
  } 
  }
    %>
		
		 		
					 
	<!-- check topic is closed --> 			 
				
	
	 
	<%
	 if(true){
		 ResultSet rs4=null;
		 Statement st4=null;
		 try{
			 st4=Database.dbconnect();
			 String sql2="select user_id,topicstatus from post where post_id="+request.getParameter("post_id");
             PostBean postBean4=new PostBean();
             rs4=st4.executeQuery(sql2);
             if(rs4.next())
             { postBean4.setUser_id(rs4.getInt("user_id"));
           postBean4.setTopicstatus(rs4.getInt("topicstatus"));
            if(user_id==postBean4.getUser_id() && postBean4.getTopicstatus()==0)
            { 
            
              %>
            	<div id="closetopic">
            	<form method="post" action="../CloseTopic?post_id=<%=request.getParameter("post_id")%>&user_id=<%=user_id%>">
            	<%-- <input type="hidden" name="post_id" value="<%= request.getParameter("post_id")%>" /> --%>
            	<input type="submit" value="closetopic" style="background-color:red; color:white" height="40px;">
            	</form>
            	</div>
            	<%
            }
             }
		 }catch(SQLException e){
			 e.printStackTrace();
		 }finally{
				try {
					
					if(st4 != null) {
					st4.close ();
					}
					if(rs4 != null) {
						rs4.close ();
						}
					}catch(SQLException e){
					e.printStackTrace();
				}
		 
	 } 
	 }
	%>
<!-- topic status check -->
		<% if(true){
		ResultSet rs1=null;
		Statement st1=null;
		try{
			st1=Database.dbconnect();
			String sql="select topicstatus from post where post_id="+request.getParameter("post_id");
			rs1=st1.executeQuery(sql);
			if(rs1.next())
			{PostBean postBean3=new PostBean();
			postBean3.setTopicstatus(rs1.getInt("topicstatus"));
			if(postBean3.getTopicstatus()==0){
		%>
    <div id="comment_text">
	<form onsubmit="return check_fields()" method="post" action="add_thread.jsp?user_id=<%=user_id_s%>">
    <!--  <input type="text" name="post_texts" id="post_texts" style="height: 100px;"  size="40"> -->
     <textarea rows="4" cols="40" name="post_texts" id="post_texts">
        </textarea> 
<input type="hidden" name="post_id" value="<%= request.getParameter("post_id")%>" />
<input type="submit" value="Post">
</form>
</div>
<%  }
			else{
				%> <h2 align="center">Topic closed</h2> <%
			}
			}
}catch(SQLException e){
			e.printStackTrace();
		}
	}
		%>
	<div id="topic">

	
<%
if(true)
{
List <PostBean> dataList = new ArrayList <PostBean> (); 
List <PostBean> dataList2 = new ArrayList <PostBean> ();
ResultSet rs=null;
Statement st=null;

st=Database.dbconnect();


try 
{
	//request.getParameter("post_id")
String sqlret="select pt.time_stamp,pt.user_id,ps.post_id, ps.post_name, ps.user_id, pt.thread_id, pt.text,ps.postdescription,pu.fname from post ps, post_text pt,user_detail pu where ps.post_id = pt.post_id and  pt.user_id=pu.user_id and ps.post_id ='"+ request.getParameter("post_id")+"' order by time_stamp asc";
// select rp.posts,ru.username from Rahuluser ru,Rahulpost rp where ru.user_id1=rp.user_id
rs=st.executeQuery(sqlret); 

while (rs.next ())
{
//Add records into data list
PostBean postBean = new PostBean();
postBean.setPost_name(rs.getString("post_name"));
postBean.setText(rs.getString("text"));
postBean.setPost_description(rs.getString("postdescription"));
postBean.setFname(rs.getString("fname"));
postBean.setTime_stamp(rs.getString("time_stamp"));
dataList.add(postBean);


}
}
catch (Exception e) 
{
out.println(e);
}

//Iterator it = dataList.iterator();
for(PostBean postBean : dataList){
	%>
	

<div id="second_desc">
<h2> <%=postBean.getFname() %> </h2>
<h3><%=postBean.getTime_stamp() %></h3>

<p><%=postBean.getText() %></p>
</div>
<%
}
}
%>
	
	
</div>
     <div id="log_out">
   <a href="../Login/Login.jsp?logout=true">Logout</a>
  </div>
<div id="google_translate_element">
<div class="skiptranslate goog-te-gadget" dir="ltr" style="position:absolute;top:120px;right:20px;">
<div id=":0.targetLanguage" style="display: inline;">
</div>&nbsp;&nbsp;Powered by <span style="white-space:nowrap"><a class="goog-logo-link" href="http://translate.google.com" target="_blank">Translate</a></span></div></div>
<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'bn,en,gu,hi,ms,ta,te,ur', layout: google.translate.TranslateElement.InlineLayout.HORIZONTAL, gaTrack: true, gaId: 'UA-18100914-1'}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
			  
	
</body>
</html>