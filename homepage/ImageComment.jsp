<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/group_temp.css">

<link rel="stylesheet" type="text/css" href="css/StyleDiscussion.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--script src="js/jquery.lint.js" type="text/javascript" charset="utf-8"></script-->
		<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
		<script src="js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
	
<title>Comments for image</title>
<style type="text/css">
 
    #left_box{
            word-wrap: break-word }
    #log_out{
		position:absolute;
		top:10px;
		right:10px;
		}
   </style>
   <style type="text/css">
#google_translate_element{
	 position:absolute;
	 top:100px;
	 right:10px;
	 }
</style>
</head>
<body>
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
				<li><a href="homepage.jsp?user_id=<%=request.getParameter("user_id")%>" >Home</a></li>
				<li><a href="Profile/display_profile.jsp?user_id=<%=request.getParameter("user_id")%>" accesskey="m">Profile</a></li>
				
			</ul>
		</div>

<div class="main_contentvid">
<table style="min-width:950px;">
 <%
	   
	  Statement st = null,st1=null,st2=null;
	  ResultSet rs=null,rs1=null,rs2=null;
	  boolean comment_present=false;
	  String fileName="",comment_text,fname="";
	  String user_id_s=request.getParameter("user_id");
	  int user_id=Integer.parseInt(user_id_s);
	  try
	  {
		  
				  	st=Database.dbconnect();
				  	st1=Database.dbconnect();
				  	st2=Database.dbconnect();
				   String image_ids=request.getParameter("image_id");
				   int image_id=Integer.parseInt(image_ids);
				   
			
				    String sqlret="select filename from imageupload where image_id='"+image_id+"'";
				    String sql1="select user_id,comment_text from comments where image_id='"+image_id+"'";
				    String sql2;
					
				    rs=st.executeQuery(sqlret);
				 
				    rs1=st1.executeQuery(sql1);
				    
				  	if(rs.next())
				  	{
								
							    fileName=rs.getString("filename");
							   
							    %>
							  
									<a href="/xyz/DisplayImages/?fileName=<%= fileName%>" rel="prettyPhoto[gallery1]"> <img src="/xyz/DisplayImages/?fileName=<%= fileName%>" alt="Image cannot be displayed" width="290px" height="280px" style="position:relative; "></a><br/></a>
												<br /><br/>
							 <%   while(rs1.next())
							    {
								 		comment_present=true;
								
							    	    comment_text=rs1.getString("comment_text");
							    	    user_id=rs1.getInt("user_id");
							    	    sql2="select fname from user_detail where user_id='"+user_id+"'";
							    	
							    	    
							    	    rs2=st2.executeQuery(sql2);
							    	    if(rs2.next())
							    	    {
								    	    fname=rs2.getString("fname");
								    	   
							    	    }
							    	    
							   			%>
							   		
							   			<tr><td bgcolor="#0081A0"><h2><%=fname%></h2>
											<div class="left_box">
											<p><%=comment_text%></p></div></td></tr>
											
							   			
							   				
							   <%}
							   			if(comment_present==false)	
							    	%><% {
							   				%><h2>No Comments</h2>
							   			<%} %>
							   			 	
							   				 
							   			
				  <% }
	  }	   
			catch(Exception e)
			{
				e.printStackTrace();
				out.println(e);
			}  
	  
		finally{
			try{
				if(comment_present)
				{
				rs.close();
				rs1.close();
				rs2.close();
				st.close();
				st1.close();
				st2.close();
				}
				else
				{
					rs.close();
					st.close();
					rs1.close();
					st1.close();
					
				}
			}
			catch(Exception e)
			{ 
				e.printStackTrace();
			}
}
	       %>
	       </table>
	       </div>
	       <div id="log_out">
   <a href="Login/Login.jsp?logout=true">Logout</a>
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