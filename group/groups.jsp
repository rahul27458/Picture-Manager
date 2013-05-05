<!doctype html>
 <%@page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
 <%@page import="com.beans.PostBean"%>
 <%@ page import ="java.util.*" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="../css/temp.css">
<link href="jquery.mCustomScrollbar.css" rel="stylesheet" />
<!-- for text area -->
<link rel="stylesheet" type="text/css" href="../css/textarea.css" />
<!-- for tabs -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<!--script src="js/jquery.lint.js" type="text/javascript" charset="utf-8"></script-->
		<link rel="stylesheet" href="../css/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
		<script src="../js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
	
	<!-- to check whether image is in relevant format -->
		<script src="../js/fileExt.js" type="text/javascript" charset="utf-8"></script>
<script>
$(function() {
	$( "#tabs" ).tabs();
	});
</script>

<link rel="stylesheet" href="/resources/demos/style.css" />
<style>
.content{margin:0px; width:380px; height:90px; padding:0px; overflow:auto; background:#444; -webkit-border-radius:2px; -moz-border-radius:2px; border-radius:2px;}
.content .images_container{overflow:hidden;}
.content .images_container img{display:block; float:left; margin:0 0px; border:5px solid #777;}
a[rel='toggle-buttons-scroll-type']{display:inline-block; text-decoration:none; padding:3px 15px; -webkit-border-radius:15px; -moz-border-radius:15px; border-radius:15px; background:#000; margin:5px 20px 5px 0;}
</style>

<!-- Custom scrollbars CSS -->
<!-- tabs css -->
<style type="text/css">
#tabs{
width:800px;

}
#log_out{
		position:absolute;
		top:10px;
		right:10px;
		}
#topic{

        width:auto;
		resize:both;
		overflow:auto;
}
input[type="submit"]
{
-moz-box-shadow:inset -2px 1px 0px 0px #e6e6e6;
	-webkit-box-shadow:inset -2px 1px 0px 0px #e6e6e6;
	box-shadow:inset -2px 1px 0px 0px #e6e6e6;
	background-color:#d11726;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #ebebeb;
	display:inline-block;
	color:#fafafa;
	font-family:Comic Sans MS;
	font-size:18px;
	font-weight:normal;
	padding:6px 24px;
	text-decoration:none;
	
}
</style>
<style type="text/css">
#google_translate_element{
	 position:absolute;
	 top:130px;
	 right:90px;
	 }
</style>
<script>
function showHint(str)
{
var xmlhttp;
if (str.length==0)
  { 
  document.getElementByName("txt1").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","gethint.jsp?q="+str,true);
xmlhttp.send();
}






</script>
<!-- comment check -->
<script src="../js/filecheck.js" type="text/javascript" charset="utf-8"></script>



<title>Group</title>

</head>
<div class="header">
				<div class="top_info"></div>
				<div class="logo">
				<h1><a href="#" title="Best Place to share photos and videos"><span class="dark">DARK</span> 
				LORD</a></h1>
				</div>
				</div>
<div class="bar">
<ul>
<% String s1=request.getParameter("user_id");
																				 
	int user_id=Integer.parseInt(s1); 
	 String s2=request.getParameter("group_id");												 
	int group_id=Integer.parseInt(s2);
					
	 %>	
	 
<script language="javascript">
	 function showHint2(str)
	 {
	 var xmlhttp;
	 
	 if (str.length==0)
	   { 
	   document.getElementByName("txt2").innerHTML="";
	   return;
	   }
	 if (window.XMLHttpRequest)
	   {// code for IE7+, Firefox, Chrome, Opera, Safari
	   xmlhttp=new XMLHttpRequest();
	   }
	 else
	   {// code for IE6, IE5
	   xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	   }
	 xmlhttp.onreadystatechange=function()
	   {
	   if (xmlhttp.readyState==4 && xmlhttp.status==200)
	     {
	     document.getElementById("txtHint2").innerHTML=xmlhttp.responseText;
	     }
	   }
	 xmlhttp.open("GET","getdeletehint.jsp?q="+str+"&group_id="+<%=group_id%>,true);
	 xmlhttp.send();
	 }
</script>

<li class="browse_category">Welcome to DarkLord</li>
	
				<li><a href="../homepage.jsp?user_id=<%=user_id%>" >Home</a></li>
				<li><a href="../Profile/display_profile.jsp?user_id=<%=user_id%>" accesskey="m">Profile</a></li>
				
				
				
</ul>
</div>
<body>
<div class="right">

												 
					
						 <div id="tabs">
				
						 			
									<ul>
									<li><a href="#tabs-1">Images</a></li>
									<li><a href="#tabs-2">Videos</a></li>
									</ul>
		<div id="tabs-1">
									
										
										
											 
									<form onsubmit="return validate_ext()" method="POST" enctype="multipart/form-data" action="../FileUploadServlet?fuid=<%=user_id%>&group_ids=<%=group_id%>">
									
									<input type="file" value="upload" name="upload" id="image_upload"><br>
									  <input type="submit" value="upload">
									</form>
									<br>			
												
												<%
									 			
					if(true)
					{	
												int id=0;
												// response.setContentType("image/jpeg"); 
												Statement st = null,st_like=null,st_report=null,st_no_likes=null;
												int no_of_likes=0;
												  ResultSet rs=null,rs_report=null,rs_like=null,rs_no_likes=null;
												  int image_id=0;
												  String fileName="",like_val,report_val,sqlret_like,sqlret_report;
												  boolean blike,breport;
												  List<PostBean> dataList=new ArrayList<PostBean>();
												
									try
									{
										st_no_likes=Database.dbconnect();
													st=Database.dbconnect();
													 st_like=Database.dbconnect();
													    st_report=Database.dbconnect();
													    
												String sqlret="select image_id,filename,fname from imageupload,user_detail  where user_detail.user_id=imageupload.user_id AND group_id='"+group_id+"' ORDER BY image_id DESC";
												rs=st.executeQuery(sqlret); 
												
												
												   while(rs.next())
												      {
												    	
												    	  PostBean postBean=new PostBean(); 
												    	  postBean.setFname(rs.getString("fname"));
												          postBean.setFile_name(rs.getString("filename"));
												    	  dataList.add(postBean);


												    	 }
												    rs=st.executeQuery(sqlret); 
													   
											for(PostBean postBean : dataList) 
											{
													rs.next();
													like_val="You like this post";
													report_val="You have reported this post";
													blike=false;//blike false means current user has already liked the current image
													breport=false;//breport false means current user has already reported the current image
													try{
														fileName=rs.getString("filename");
													  	image_id=rs.getInt("image_id");
														
														}
													catch(Exception e)
													{ 
														e.printStackTrace();
													}
												
												    String sqllikeno="SELECT COUNT(*) AS Likenumber FROM likes where image_id="+image_id;
												  rs_no_likes=st_no_likes.executeQuery(sqllikeno); 
												  if(rs_no_likes.next())
												    {
												    no_of_likes=rs_no_likes.getInt("Likenumber");
												    } 
												    sqlret_report="select * from reports where image_id='"+image_id+"' AND user_id='"+user_id+"'";
												    rs_report=st_report.executeQuery(sqlret_report);
												    
												     sqlret_like="select * from likes where image_id='"+image_id+"' AND user_id='"+user_id+"'";
												     rs_like=st_like.executeQuery(sqlret_like);
												    
												     if(rs_like.next()==false)//if condition false it means that user has not liked the post
												    {
												    	 blike=true;
												    	 like_val="Like";//value of the like button in the form
												    	
												     }
												    
												    if(rs_report.next()==false)//if condition false it means that user has not reported the post
												    {
												     	 breport=true;
												     	 report_val="Report";//value of the report button in the form
												     	 
												      }
												%>
												
													<div class="right_articles">
								
					</div>						<h2> <%=postBean.getFname()%></h2>
												<a href="/xyz/DisplayImages/?fileName=<%=fileName%>" rel="prettyPhoto"><img src="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" width="290px" height="280px" style="position:relative; left:100px;top:40px;" /></a><br/><br/><br/> 
										<br><br>
										<%String image_ids=Integer.toString(image_id); %>
										<a href="../ImageComment.jsp?image_id=<%=image_ids%>&user_id=<%=user_id%>">View Comments</a><br/>
								
								<%if(breport)// user has not reported 
									      { 
									      %>
									      
									      <form action="../Blockpost?group_ids=<%=group_id%>" method="post">
									      <input type="hidden" name="reportuid" value=<%=image_id%>>
									      <input type="hidden" name="reportemd" value=<%=user_id%>>
									      <input type="submit" value="<%=report_val%>">
									      </form>
									      <%
									      }
									      else//user has  reported 
										  {  				
										  %>
													<%=report_val%><br/>
											      	<% 
									      }
										  			%>
										  <%if(blike)// user has not liked 
									      { 
									      %>
											      <form action="../Blockpost" method="get">
											      <input type="hidden" name="likeuid" value=<%=image_id%>>
											      <input type="hidden" name="likeemd" value=<%=user_id%>>
											      <input type="hidden" name="group_ids" value=<%=group_id%>>
											      <input type="submit" value=<%=like_val%> ><%=no_of_likes %> Likes
											      </form>
									       <%
									      }
									      else//user has not liked
										  {  				
										  %>
													<%=like_val%><br/><%=no_of_likes %> Likes
											      	<% 
									      }
										  			%>
								
												<form  action= "../CommentServlet?group_ids=<%=group_id%>" method="post">
									     <textarea name="comment_text" id="<%=id%>"cols="40" rows="6"></textarea>
									       <input type="hidden" name="user_id" value="<%=user_id%>">

									       <input type="hidden" name="image_id" value="<%=image_id%>">
									     <input type="submit" value="Comment" onclick="return textimage(<%=id%>)">
									      </form>
												<br><br><br><br>
												
												
												<% id++;
												}
												
												
												
									}
											catch(Exception e)
											{
													out.println(e);
												}
												finally{
															try{
																rs.close();
																st.close();
																
																}
															catch(Exception e)
															{ 
																e.printStackTrace();
															}
												}
					}
										%>
			</div>
						
									<div id="tabs-2">
												<form onsubmit="return video_ext()" method="POST" enctype="multipart/form-data" action="../VideoFileUploadServlet?fuid=<%=user_id%>&group_ids=<%=group_id%>">
								
									<input type="file" value="upload" name="upload" id="video_upload"><br>
									  <input type="submit" value="upload">
									</form>
									<%
				if(true)
				{			 int video_comment_id=0;
									Statement st = null,st_like=null,st_report=null,st_no_likes=null;
									 int no_of_likes=0;
									  ResultSet rs=null,rs_report=null,rs_like=null,rs_no_likes=null;
									  int image_id=0,video_id=0;
									  String fileName="",like_val,report_val,sqlret_like,sqlret_report;
									  boolean blike,breport;
									  List<PostBean> dataList=new ArrayList<PostBean>();
					try
					{
									st_no_likes=Database.dbconnect();
										st=Database.dbconnect();
										
										  st_like=Database.dbconnect();
										    st_report=Database.dbconnect(); 
										    
									String sqlret="select video_id,filename,fname from videoupload,user_detail where user_detail.user_id=videoupload.user_id AND group_id='"+group_id+"' ORDER BY video_id DESC";
									rs=st.executeQuery(sqlret); 
									 
								    while(rs.next())
								      {
								    	
								    	  PostBean postBean=new PostBean(); 
								    	  postBean.setFname(rs.getString("fname"));
								          postBean.setFile_name(rs.getString("filename"));
								    	  dataList.add(postBean);


								    	  }
								    
								    rs=st.executeQuery(sqlret); 
								   
						for(PostBean postBean : dataList) 
						{
										rs.next();
										like_val="You like this post";
										report_val="You have reported this post";
										blike=false;//blike false means current user has already liked the current video
										breport=false;//breport false means current user has already reported the current video
										try{
											fileName=rs.getString("filename");
										  	video_id=rs.getInt("video_id");
											
											}
										catch(Exception e)
										{ 
											e.printStackTrace();
										} 
									
										String sqllikeno="SELECT COUNT(*) AS Likenumber FROM v_likes where video_id="+video_id;
										  rs_no_likes=st_no_likes.executeQuery(sqllikeno); 
										  if(rs_no_likes.next())
										    {
										    no_of_likes=rs_no_likes.getInt("Likenumber");
										    }
									    
									    sqlret_report="select * from v_reports where video_id='"+video_id+"' AND user_id='"+user_id+"'";
									    rs_report=st_report.executeQuery(sqlret_report);
									    
									     sqlret_like="select * from v_likes where video_id='"+video_id+"' AND user_id='"+user_id+"'";
									     rs_like=st_like.executeQuery(sqlret_like);
									    
									     if(rs_like.next()==false)//if condition false it means that user has not liked the post
									    {
									    	 blike=true;
									    	 like_val="Like";//value of the like button in the form
									    	
									     }
									    
									    if(rs_report.next()==false)//if condition false it means that user has not reported the post
									    {
									     	 breport=true;
									     	 report_val="Report";//value of the report button in the form
									     	 
									      } 
									%>
									
										<div class="right_articles">
					
									</div>
									<h2> <%=postBean.getFname()%></h2>
									<video width="320" height="240" controls="controls">
												<source src="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" type="video/mp4" ></source>
												</video><br/><br/><br/> 
								<br><br>
								<%String video_ids=Integer.toString(video_id); %>
								<a href="../VideoComment.jsp?video_id=<%=video_ids%>&user_id=<%=user_id%>">View Comments</a><br/>
					
								<%if(breport)// user has not reported 
							      { 
							      %>
							      
							      <form action="../VideoBlockPost?group_ids=<%=group_id%>" method="post">
							      <input type="hidden" name="reportuid" value=<%=video_id%>>
							      <input type="hidden" name="reportemd" value=<%=user_id%>>
							      <input type="submit" value="<%=report_val%>">
							      </form>
							      <%
							      }
							      else//user has  reported 
								  {  				
								  %>
											<%=report_val%><br/>
									      	<% 
							      }
								  			%>
								  <%if(blike)// user has not liked 
							      { 
							      %>
									      <form action="../VideoBlockPost" method="get">
									      <input type="hidden" name="likeuid" value=<%=video_id%>>
									      <input type="hidden" name="likeemd" value=<%=user_id%>>
									      <input type="hidden" name="group_ids" value=<%=group_id%>>
									      <input type="submit" value=<%=like_val%> ><%=no_of_likes%>Likes
									      </form>
							       <%
							      }
							      else//user has not liked
								  {  				
								  %>
											<%=like_val%><br/><%=no_of_likes%>Likes
									      	<% 
							      }
								  			%>
						
										<form   action= "../VideoCommentServlet?group_ids=<%=group_id%>" method="post">
							    <textarea name="v_comment_text" id="<%=video_comment_id%>" cols="40"  rows="6"></textarea>
							       <input type="hidden" name="user_id" value="<%=user_id%>">
	
							       <input type="hidden" name="video_id" value="<%=video_id%>">
							      <input type="submit" value="Comment" onclick="return textvideo(<%=video_comment_id%>)">
							      </form>
		 						<br><br><br><br>
										
										
										<% video_comment_id++;
							}
									
									
									
					}
									catch(Exception e){
										out.println(e);
										e.printStackTrace();
									}
									finally{
												try{
													rs.close();
													st.close();
													
													}
												catch(Exception e)
												{ 
													e.printStackTrace();
												}
									}
				}
									%>
							
												
							
							
									
			
						
						
						
									
									</div>
						
						
						
						</div>
						 
 					

</div>
<div id="topic">
<table border="0" cellpadding="5"  class="left">
<tr>
<td colspan="3">
<%
  if(true)
  {
	   List<PostBean> dataList=new ArrayList<PostBean>();
	   ResultSet rs=null;
	  Statement st=null;
	  try{
		  PostBean postBean=new PostBean();
		  st=Database.dbconnect();
		  String sql="select profilepic from groups where group_id="+group_id;
		  rs=st.executeQuery(sql);
		  if(rs.next())
		  {
		  postBean.setFile_name(rs.getString("profilepic"));
		  String fileDes="";
		  if(postBean.getFile_name()!=null){
			fileDes="Your Profile picture";  
		 
		  %>
			<a href="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" rel="prettyPhoto"><img src="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" width="425 px" style="position:relative;" alt="<%=fileDes %>" /></a><br/><br/><br/> 
	 <%
		  }else{
			  %>
			  <h2 style="position: absolute;top:130px;left:200px;">No profile pic uploaded</h2>
			  <% 
		  }
		  }
	  }catch(SQLException e){
		  e.printStackTrace();
	  }
	  
  }

%>



 

</td>
</tr>

<form onsubmit="return validate_ext_profile()" method="post" enctype="multipart/form-data"  action="groupprofilepic.jsp?group_id=<%=group_id%>&user_id=<%=user_id%>">
  <input type="file" name="file" id="image_upload_profile"><br />
  <input type="submit" value="upload">
  </form>

<tr>
<td colspan="2">
<h3>TOP PICS!!! </h3>
</td>
</tr>
<tr>
<td colspan="2">	
<div id="content_1" class="content">
<div class="images_container">
<%try
{
			String most_like="select filename from imageupload where group_id='"+group_id+"' ORDER BY likes DESC";
			int i=1;
			ResultSet rs=null;
			Statement st=null;
			st=Database.dbconnect();
			rs=st.executeQuery(most_like);
			while(rs.next())
			{
				%><a href="/xyz/DisplayImages/?fileName=<%=rs.getString("filename")%>"  rel="prettyPhoto"><img src="/xyz/DisplayImages/?fileName=<%=rs.getString("filename")%>" width="100px" height="100px"/></a>
				<% 
					if(i>7)
					break;
					i++;
			}
}
catch(Exception e)
{
out.println(e);
}
%>
</div>
</div>
</td>
</tr>
<tr>
<td>
<font face="Comic Sans MS" size="3px">Add to group!!</font>
</td>
<td >
		<form id="tw-form"  action="../adduser?group_ids=<%=group_id%>&user_id=<%=user_id%>" method="post">
		<input id="tw-input-text" size="10" name="txt1" onkeyup="showHint(this.value)" />
		<input id="tw-input-submitadd"  type="submit" value=""/><span id="txtHint"></span>
</form>
</td>

</tr>
<tr>
<td>
<font face="Comic Sans MS" size="3px">Delete from group!!</font>
</td>
<td>
<form id="tw-form" action="../adduser" method="get">
<input type="hidden" name="group_ids" value="<%=group_id%>">
<input type="hidden" name="user_id" value="<%=user_id %>">
<input id="tw-input-text" type="text" size="10" name="txt2" onkeyup="showHint2(this.value)"/>
<input id="tw-input-submitdel" type="submit" value="" /><span id="txtHint2"></span>
</form>
</td>
</tr>

</table>
</div>


<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
$("a[rel^='prettyPhoto']").prettyPhoto();
});
</script>
	
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