<!doctype html>
 <%@page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
 <%@page import="com.beans.PostBean"%>
 <%@ page import ="java.util.*" %>
<html>
<head>
<!-- for text area -->
<link rel="stylesheet" type="text/css" href="css/textarea.css" />
<meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="css/group_temp.css">
<link href="jquery.mCustomScrollbar.css" rel="stylesheet" />
<!-- for tabs -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
		<!--script src="js/jquery.lint.js" type="text/javascript" charset="utf-8"></script-->
		<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
		<script src="js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
		<!-- to check whether image is in relevant format -->
		<script src="js/fileExt.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/filecheck.js" type="text/javascript" charset="utf-8"></script>
	   
<script>
$(function() {
	$( "#tabs" ).tabs();
	});
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
<link rel="stylesheet" href="/resources/demos/style.css" />
<style>
.content{margin:0px; width:380px; height:90px; padding:0px; overflow:auto; background:#444; -webkit-border-radius:2px; -moz-border-radius:2px; border-radius:2px;}
.content .images_container{overflow:hidden;}
.content .images_container img{display:block; float:left; margin:0 0px; border:5px solid #777;}
a[rel='toggle-buttons-scroll-type']{display:inline-block; text-decoration:none; padding:3px 15px; -webkit-border-radius:15px; -moz-border-radius:15px; border-radius:15px; background:#000; margin:5px 20px 5px 0;}

</style>
	<style type="text/css">
		#log_out{
		position:absolute;
		top:10px;
		right:10px;
		}
		.right_articles{
		position:absolute;
		top:200px;
		right:40px;
		width:300px;
		
		
		}
		
		
		</style>
<!-- Custom scrollbars CSS -->
<!-- tabs css -->
<style type="text/css">
#tabs{
display: inline-block; 
position:absolute;
width:700px;
top:120px;

}
.ui-tabs-panel {
    overflow-y: auto;
    overflow-x: hidden;
}
html, body {
    width:100%;
    height:100%;
}

</style>








<title>HomePage</title>

</head>
<body>
		<!-- set session -->
<% 
   String user_id_s=request.getParameter("user_id");
   int user_id=Integer.parseInt(user_id_s);
   %>
<script language="javascript">


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
xmlhttp.open("GET","homeHint.jsp?q="+str+"&user_id="+<%=user_id%>,true);
xmlhttp.send();
}
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
xmlhttp.open("GET","homeGroupHint.jsp?q="+str+"&user_id="+<%=user_id%>,true);
xmlhttp.send();
}
</script>




   
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
				<li><a href="#" >Home</a></li>
				<li><a href="Profile/display_profile.jsp?user_id=<%=user_id_s%>" accesskey="m">Profile</a></li>
		
			</ul>
		</div>


	<section>	

<div class="right">

							<section>			 
					
						 <div id="tabs">
				
						 			
									<ul>
									<li><a href="#tabs-1">Images</a></li>
									<li><a href="#tabs-2">Videos</a></li>
									</ul>
									<section>
		<div id="tabs-1">
												
										
											 
									<form  method="POST" enctype="multipart/form-data" action="HomeFileUploadServlet?fuid=<%=user_id%>">
									<input type="hidden" name="user_id" value=<%=user_id%>>
									<input type="file" value="upload" name="upload" id="image_upload"><br>
									  <input type="submit" value="upload" onclick="return validate_ext()">
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
													    
												String sqlret="select ru.user_id,ru.image_id,ru.filename,rp.fname from imageupload ru,user_detail rp  where rp.user_id=ru.user_id and group_id is null  ORDER BY image_id DESC";
												rs=st.executeQuery(sqlret); 
												
												
												   while(rs.next())
												      {
												    	
												    	  PostBean postBean=new PostBean(); 
												    	  postBean.setFname(rs.getString("fname"));
												          postBean.setFile_name(rs.getString("filename"));
												          postBean.setUser_id(rs.getInt("user_id"));
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
												
													<div class="images">
								
									
					                            <a href="Profile/see_profile.jsp?friend_id=<%=postBean.getUser_id()%>&user_id=<%=user_id%>"><h2><%=postBean.getFname()%></h2></a>
												<a href="/xyz/DisplayImages/?fileName=<%=fileName%>" rel="prettyPhoto"><img src="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" width="36%" height="30%" style="position:relative; left:50px;top:40px;" /></a><br/><br/><br/> 
										<br><br>
											</div>	
										<%String image_ids=Integer.toString(image_id); %>
										<a href="ImageComment.jsp?image_id=<%=image_ids%>&user_id=<%=user_id_s%>">View Comments</a><br/>
								
								<%if(breport)// user has not reported 
									      { 
									      %>
									      
									      <form action="HomeBlockpost" method="post">
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
											      <form action="HomeBlockpost" method="get">
											      <input type="hidden" name="likeuid" value=<%=image_id%>>
											      <input type="hidden" name="likeemd" value=<%=user_id%>>
											      
											      <input type="submit" value=<%=like_val%> ><%=no_of_likes%>Likes
											      </form>
									       <%
									      }
									      else//user has not liked
										  {  				
										  %>
													<%=like_val%><br><%=no_of_likes%>Likes
											      	<% 
									      }
										  			%>
								
												<form  action= "HomeCommentServlet" method="post">
									      <textarea name="comment_text" id="<%=id%>" cols="40" rows="6"></textarea>
									      
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
						</section>
						
									<div id="tabs-2">
									<section>
												<form onsubmit="return video_ext()" method="POST" enctype="multipart/form-data" action="HomeVideoFileUploadServlet?fuid=<%=user_id%>">
								
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
										    
									String sqlret="select user_detail.user_id,video_id,filename,fname from videoupload,user_detail where user_detail.user_id=videoupload.user_id and group_id is null  ORDER BY video_id DESC";
									rs=st.executeQuery(sqlret); 
									 
								    while(rs.next())
								      {
								    	
								    	  PostBean postBean=new PostBean(); 
								    	  postBean.setFname(rs.getString("fname"));
								          postBean.setFile_name(rs.getString("filename"));
								          postBean.setUser_id(rs.getInt("user_id"));
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
									
										<div class="videos">
					
								
								<a href="Profile/see_profile.jsp?friend_id=<%=postBean.getUser_id()%>&user_id=<%=user_id%>"><h2><%=postBean.getFname()%></h2></a>
									<video width="38%" height="30%" controls="controls">
												<source src="/xyz/DisplayImages/?fileName=<%=postBean.getFile_name()%>" type="video/mp4" ></source>
												</video><br/><br/><br/> 
								<br><br>	</div>
								<%String video_ids=Integer.toString(video_id); %>
								<a href="VideoComment.jsp?video_id=<%=video_ids%>&user_id=<%=user_id_s%>">View Comments</a><br/>
					
								<%if(breport)// user has not reported 
							      { 
							      %>
							      
							      <form action="HomeVideoBlockPost" method="post">
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
									      <form action="HomeVideoBlockPost" method="get">
									      <input type="hidden" name="likeuid" value=<%=video_id%>>
									      <input type="hidden" name="likeemd" value=<%=user_id%>>
									     
									      <input type="submit" value=<%=like_val%> ><%=no_of_likes%>Likes
									      </form>
							       <%
							      }
							      else//user has not liked
								  {  				
								  %>
											<%=like_val%><br><%=no_of_likes%>Likes
									      	<% 
							      }
								  			%>
						
										<form  action= "HomeVideoCommentServlet" method="post">
							       <textarea name="v_comment_text" id="<%=video_comment_id%>" cols="40" rows="6"></textarea>
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
							
												
							
							
									
			
						
						
						</section>
									
									</div>
						
						
						
						</div>
						</section> 
 					

</div>
</section>
<section>
	<div class="right_articles">
			
			
			    
				
					
			
				
				<h3 >Top 3 Topics!!!</h3>
					
						<%

 						if(true)
 						{
						List<PostBean> dataList2=new ArrayList<PostBean>();
						ResultSet rs=null;
						Statement st=null;

						st=Database.dbconnect();

						try 
						{

						String sqlret="select post_name,post_id from post order by num_post desc fetch first 3 rows only ";

						rs=st.executeQuery(sqlret); 

						while (rs.next ())
						{
							//Add records into data list
							PostBean postBean=new PostBean();
							postBean.setPost_name(rs.getString("post_name"));
						
							postBean.setPost_id(rs.getInt("post_id"));
							%>

						<font size="3"> <a href="discussionroom/topic.jsp?user_id=<%=user_id_s%>&post_id=<%=postBean.getPost_id()%>"><%=postBean.getPost_name() %></a><br/></font>
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

							} catch(Exception e) {
								e.printStackTrace();
							}
							}
 						}
							%>
				
						
				<h3>New Topics!!!</h3>
					<%

 						if(true)
 						{
						List<PostBean> dataList2=new ArrayList<PostBean>();
						ResultSet rs=null;
						Statement st=null;

						st=Database.dbconnect();

						try 
						{

						String sqlret="select post_name,post_id from post order by time_stamp desc fetch first 3 rows only ";

						rs=st.executeQuery(sqlret); 

						while (rs.next ())
						{
							//Add records into data list
							PostBean postBean=new PostBean();
							postBean.setPost_id(rs.getInt("post_id"));
							postBean.setPost_name(rs.getString("post_name"));
							%>

						<font size="3"> <a href="discussionroom/topic.jsp?user_id=<%=user_id_s%>&post_id=<%=postBean.getPost_id()%>"><%=postBean.getPost_name() %></a><br/></font>
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

							} catch(Exception e) {
								e.printStackTrace();
							}
							}
 						}
							%>
							<form id="tw-form" method="get">
				<br/><br/><br/>Search for people: 
					<input  size="10" name="txt1" onkeyup="showHint(this.value)" />
				<br/><span id="txtHint"></span>
								</form><br/><br/><br/><br/><br/><br/>
									<form id="tw-form" method="get">
				<br/><br/><br/>Search for group: 
					<input  size="10" name="txt2" onkeyup="showHint2(this.value)" />
				<br/><span id="txtHint2"></span>
								</form><br/><br/><br/><br/><br/><br/>
			
				
				</div>
				
		</section>	
	
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



<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
$("a[rel^='prettyPhoto']").prettyPhoto();
});
</script>


</body>

</html>