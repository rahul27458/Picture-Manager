<!doctype html>
 <%@page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
 <%@page import="com.beans.PostBean"%>
 <%@ page import ="java.util.*" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="../css/group_temp.css">
<link href="jquery.mCustomScrollbar.css" rel="stylesheet" />
<!-- for tabs -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<!-- for text area -->
<link rel="stylesheet" type="text/css" href="../css/textarea.css" />
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


<style>
.content{margin:0px; width:380px; height:90px; padding:0px; overflow:auto; background:#444; -webkit-border-radius:2px; -moz-border-radius:2px; border-radius:2px;}
.content .images_container{overflow:hidden;}
.content .images_container img{display:block; float:left; margin:0 0px; border:5px solid #777;}
a[rel='toggle-buttons-scroll-type']{display:inline-block; text-decoration:none; padding:3px 15px; -webkit-border-radius:15px; -moz-border-radius:15px; border-radius:15px; background:#000; margin:5px 20px 5px 0;}
</style>
<!-- comment check -->
<script src="../js/filecheck.js" type="text/javascript" charset="utf-8"></script>
	<style type="text/css">
		#log_out{
		position:absolute;
		top:10px;
		right:10px;
		}
		.topics{
		position:absolute;
		top:120px;
		right:70px;
		width:360px;
		
		}
		</style>
<!-- Custom scrollbars CSS -->
<!-- tabs css -->
<style type="text/css">
#tabs{
position:absolute;
width:800px;
top:550px;
}
#profile_pics{
 position: absolute;
 top:430px;
 left:20px;
}
#profile_diplay{
 position: absolute;
 top:100px;
 left:20px;
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
	 bottom:0px;
	 right:10px;
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
xmlhttp.open("GET","../gethint.jsp?q="+str,true);
xmlhttp.send();
}

</script>
<script>


$ (document).ready (function () {
	function resizeUi() {
	    var h = $(window).height();
	    var w = $(window).width();
	    $("#tabs").css('width', w-390);
	    $(".ui-tabs-panel").css('width', w-390);
	};

	var resizeTimer = null;
	$(window).bind('resize', function() {
	    if (resizeTimer) clearTimeout(resizeTimer);
	    resizeTimer = setTimeout(resizeUi, 100);
	});
	resizeUi();
	});

</script>



<title>Profile</title>

</head>

<body>

<!-- set session -->

	<% String user_id_s=request.getParameter("user_id");
												 
		int user_id=Integer.parseInt(user_id_s); 
																								 
		 %>
<div class="header">
				<div class="top_info"></div>
				<div class="logo">
				<h1><a href="#" title="Best Place to share photos and videos"><span class="dark">DARK</span> 
				LORD</a></h1>
				</div>
				</div>
<div class="bar">
			<ul>
				<li class="browse_category">Welcome to Dark Lord</li>
				<li><a href="../homepage.jsp?user_id=<%=user_id_s%>" >Home</a></li>
				<li><a href="../discussionroom/discussionForm.jsp?user_id=<%=user_id_s%>" >Create a new topic</a></li>
				<li><a href="../group/creategroup.jsp?user_id=<%=user_id_s %>" accesskey="m">Create Group</a></li>
				<li><a href="../discussionroom/discussion.jsp?user_id=<%=user_id_s %>">Discussion Room</a>
				<li><a href="changePassword.jsp?user_id=<%=user_id_s %>">Change Password</a>
				<li><a href="friend_list.jsp?user_id=<%=user_id_s %>">My Friends List</a>
			</ul>
		</div>
<div id="profile_display">
<%
  if(true)
  {
	   List<PostBean> dataList=new ArrayList<PostBean>();
	   ResultSet rs=null;
	  Statement st=null;
	  try{
		  PostBean postBean=new PostBean();
		  st=Database.dbconnect();
		  String sql="select profilepic from user_detail where user_id="+user_id;
		  rs=st.executeQuery(sql);
		  rs.next();
		  postBean.setFile_name(rs.getString("profilepic"));
		  String fileDes="";
		  if(postBean.getFile_name()!=null){
			fileDes="Your Profile picture";  
		 
		  %>
			<a href="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" rel="prettyPhoto"><img src="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" width="300px"  style="position:relative; left:100px;top:40px;" alt="<%=fileDes %>" /></a><br/><br/><br/> 
	 <%
		  }else{
			  %>
			  <h2 style="position: absolute;top:130px;left:200px;">No profile pic uploaded</h2>
			  <% 
		  }
	  }catch(SQLException e){
		  e.printStackTrace();
	  }
	  
  }

%>

</div>
<div id="profile_pics">
<h2>You can upload or change your profile pic select an image and click upload</h2>
<form  onsubmit="return validate_ext_profile()" method="post" enctype="multipart/form-data" action="../ProfileUpdate?user_id=<%=user_id %>">
  <input type="file" name="file" id="image_upload_profile"><br/>
  <input type="submit" value="upload">
  </form>
</div>

<div class="right">

						 		
												 
					
						 <div id="tabs">
				
						 			
									<ul>
									<li><a href="#tabs-1">Images</a></li>
									<li><a href="#tabs-2">Videos</a></li>
									</ul>
		<div id="tabs-1">
												
										
											 
									<form  onsubmit="return validate_ext()" method="POST" enctype="multipart/form-data" action="../HomeFileUploadServlet?fuid=<%=user_id%>">
									
									<input type="file" value="upload" name="upload" id="image_upload"><br>
									  <input type="submit" value="upload" >
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
													    
												String sqlret="select image_id,filename from imageupload where user_id='"+user_id+"' and group_id is null ORDER BY image_id DESC";
												rs=st.executeQuery(sqlret); 
												
												
												   while(rs.next())
												      {
												    	
												    	  PostBean postBean=new PostBean(); 
												    	
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
								
					</div>						
												<a href="/xyz/DisplayImages/?fileName=<%=fileName%>" rel="prettyPhoto"><img src="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" width="36%" height="30%" style="position:relative; left:50px;top:40px;" /></a><br/><br/><br/> 
										<br><br>
										<%String image_ids=Integer.toString(image_id); %>
										<a href="../ImageComment.jsp?image_id=<%=image_ids%>&user_id=<%=user_id_s%>">View Comments</a><br/>
								<a href="tagging.jsp?fileName=<%=fileName%>&user_id=<%=user_id_s%>&image_id=<%=image_ids%>">Tag this pic</a><br>
								
								<a href="displaytag.jsp?fileName=<%=fileName%>&user_id=<%=user_id_s%>&image_id=<%=image_ids%>">Viewtag</a><br>
								<a href="crop.jsp?fileName=<%=fileName%>&user_id=<%=user_id_s%>&image_id=<%=image_ids%>">Crop</a><br>
								<%if(breport)// user has not reported 
									      { 
									      %>
									      
									      <form action="../HomeBlockpost" method="post">
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
											      <form action="../HomeBlockpost" method="get">
											      <input type="hidden" name="likeuid" value=<%=image_id%>>
											      <input type="hidden" name="likeemd" value=<%=user_id%>>
											      
											      <input type="submit" value=<%=like_val%>><%=no_of_likes%>Likes
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
								
												<form   action= "../HomeCommentServlet" method="post">
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
												<form onsubmit="return video_ext()" method="POST" enctype="multipart/form-data" action="../HomeVideoFileUploadServlet?fuid=<%=user_id%>">
								
									<input type="file" value="upload" name="upload" id="video_upload"><br>
									  <input type="submit" value="upload">
									</form>
									<%
				if(true)
				{			int video_comment_id=0;
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
										    
									String sqlret="select video_id,filename from videoupload where user_id='"+user_id+"' and group_id is null ORDER BY video_id DESC";
									rs=st.executeQuery(sqlret); 
									 
								    while(rs.next())
								      {
								    	
								    	  PostBean postBean=new PostBean(); 
								    	
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
									
									<video width="38%" height="30%" controls="controls" >
												<source src="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" type="video/mp4" ></source>
												</video><br/><br/><br/> 
								<br><br>
								<%String video_ids=Integer.toString(video_id); %>
								<a href="../VideoComment.jsp?video_id=<%=video_ids%>&user_id=<%=user_id_s%>">View Comments</a><br/>
					
								<%if(breport)// user has not reported 
							      { 
							      %>
							      
							      <form action="../HomeVideoBlockPost" method="post">
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
									      <form action="../HomeVideoBlockPost" method="get">
									      <input type="hidden" name="likeuid" value=<%=video_id%>>
									      <input type="hidden" name="likeemd" value=<%=user_id%>>
									     
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
						
										<form  action= "../HomeVideoCommentServlet" method="post">
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

	<div class="topics">
			<div class="right_articles">
		
			      
				<div class="right_articles">
				<table border="0">
				</table>
			
				
				<h3>Your Groups</h3>
					
						<% 
								Statement st = null,st1=null;
								ResultSet rs=null,rs1=null;
								String group_name,group_id;
								try
								{
									st=Database.dbconnect();
									st1=Database.dbconnect();
									String sql1="select group_name,group_id from groups where user_id='"+user_id+"'";
									String sql2="select group_name,groups.group_id from groups,user_group where user_group.group_id=groups.group_id AND user_group.user_id='"+user_id+"'";
									rs=st.executeQuery(sql1); //for group admins
									rs1=st1.executeQuery(sql2); //for group members
									while(rs.next())//displaying groups for which user is admin
									{
										String gname=rs.getString("group_name");
										int gids=rs.getInt("group_id");
									
										group_id=Integer.toString(gids);
										%>
										<font size="3"><a href="../GroupRedirect?user_id=<%=user_id_s%>&group_ids=<%=group_id%>"><%=gname%>(Admin)</a></font>
												<br>
										<% 
									}
									while(rs1.next())//displaying groups for which user is member
									{
										String gname1=rs1.getString("group_name");
										int gids=rs1.getInt("group_id");
										group_id=Integer.toString(gids);
										%>
										<font size="3"><a href="../GroupRedirect?user_id=<%=user_id%>&group_ids=<%=group_id%>"><%=gname1%></a></font>
												<br>
										<% 
									}
									
									
								}
								
								
								catch(Exception e)
								{
									e.printStackTrace();
									out.println(e);
								}
								
								
								finally
								{
											try{
												rs.close();
												st.close();
												rs1.close();
												st1.close();
												}
											catch(Exception e)
											{ 
												e.printStackTrace();
											}
								}
								
								  
								 
								%>
												
												
												
				

						
				
				</div>
				</form>
				</div></div>
	
  <div id="log_out">
   <a href="../Login/Login.jsp?logout=true">Logout</a>
  </div>
  




<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
$("a[rel^='prettyPhoto']").prettyPhoto();
});
</script>

<div id="google_translate_element">
<div class="skiptranslate goog-te-gadget" dir="ltr" style="">
<div id=":0.targetLanguage" style="display: inline;">
</div>&nbsp;&nbsp;Powered by <span style="white-space:nowrap"><a class="goog-logo-link" href="http://translate.google.com" target="_blank">Translate</a></span></div></div>
<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'bn,en,gu,hi,ms,ta,te,ur', layout: google.translate.TranslateElement.InlineLayout.HORIZONTAL, gaTrack: true, gaId: 'UA-18100914-1'}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

</body>

</html>