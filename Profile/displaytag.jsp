 <%@page import="com.connection.*" %>
 <%@ page import="java.sql.*" %>
<html>

    <head>
        <title>View your tag</title>
        <link rel="stylesheet" type="text/css" href="../css/StyleDiscussion.css">
        <link href="../css/jquery-ui.tag.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="../js/jquery.tag.min.js"></script>
        <script type="text/javascript" src="../js/jquery-ui.tag.min.js"></script>
       <style type="text/css">
#google_translate_element{
	 position:absolute;
	 top:100px;
	 right:10px;
	 }
	 #log_out{
		position:absolute;
		top:10px;
		right:10px;
		}
</style>
        <style type="text/css" >
     body{
                font-size:13px;
                font-family:"Arial";
            }
            #mapper{
                border:5px solid #EEE;
                 max-width:35px;
                 max-height:35px;
                /*max-height:100px;*/
                
             /*    min-height:100px; */
                z-index:1000;
                position:absolute;
                top:0;
                display:none;
            }

            #planetmap div{

                display:block;
                position:absolute;
            }




            #main_panel{
                margin: auto;
                margin-top:150;
                padding: 10px;
                width: 1000px;
            }
            #url_panel{

            }
            #form_panel{
                float: left;
                background:#eee;
                border:5px solid #FFF;
                outline:1px solid #eee;
                left: 100px;
                padding: 5px;
                position: absolute;
                top: 40px;
                width: 310px;
                display:none;
                z-index:2000;
            }

            #form_panel input,textarea{
                padding:3px;
                background:#FFF;
                border:1px solid #CFCFCF;
                color:#000;
            }

            #image_panel{
                float:left;
                width:auto;
                position:relative;
                margin:auto;
            }
            #image_panel img{
                margin-left:auto;top:-102px;
                max-width: 600px;
                overflow: hidden;

            }


            #form_panel .label{
                float:left;
                width:80px;
                padding:5px;
            }

            #form_panel .field{
                float:left;
                width:200px;
                padding:5px;
            }

            #form_panel .row{
                clear:both;
            }

            .tagged_title{
                background: none repeat scroll 0 0 #538DD3;
                border: 2px solid;
                color: #FFFFFF;
                font-size: 12px;
                font-weight: bold;
                padding: 3px;
                margin-top:5px;
            }


            #info_panel{
                padding:10px;
                margin:20px 0;
                background:#eee;
            }


            input[type='button']{
                background: none repeat scroll 0 0 #2769C4;
                border: 1px solid #CFCFCF;
                color: #FFFFFF;
                font-weight: bold;
                height: 30px;
                padding: 5px;
            }




        </style>
        <%int posx,posy,posw,posh; %>
        <script>
        $(document).ready(function(){


            $(".slidingDiv").hide();
            $(".show_hide").show();

        $('.show_hide').mouseover(function(){
            $(".slidingDiv").slideToggle();
        });
        $('.show_hide').mouseout(function(){
            $(".slidingDiv").slideToggle();
        });

        });
        </script>
        </head>
     <body>
        


     <%String fileName=request.getParameter("fileName");
     String user_id=request.getParameter("user_id");
     int image_id=Integer.parseInt(request.getParameter("image_id"));
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
				<li><a href="../homepage.jsp?user_id=<%=user_id%>" >Home</a></li>
			   <li><a href="../Profile/display_profile.jsp?user_id=<%=user_id%>" >Profile</a></li>
				
				
			</ul>
		</div>
    
    
    
    
    
    
    
    
    
 <div id='main_panel'>

             <div style='margin: auto; width: 600px;'>
                <div id='image_panel' >
                 <img src="/xyz/DisplayImages/?fileName=<%=fileName%>" id='imageMap'  /> 
                    <div id='mapper' ><img src='save.png' onclick='openDialog()' /></div>
 <a href="#" class="show_hide">Show Tags</a>
 <%
Statement st = null,st1=null;

 ResultSet rs=null,rs1=null;
 st=Database.dbconnect();
 st1=Database.dbconnect();
 String sql="select * from tag where image_id='"+image_id+"'";
 String sql1;

 rs=st.executeQuery(sql);
 

String fname="";
 
 
 
 while(rs.next()) 
 {
	 double left=rs.getDouble("posx");
	 double top=rs.getDouble("posy");
	 double width=rs.getDouble("posw");
	 double height=rs.getDouble("posh");
	 int friend_id=rs.getInt("friend_id");
	 sql1="select fname from user_detail where user_id='"+friend_id+"'";
	 rs1=st1.executeQuery(sql1);
	 if(rs1.next())
	 {
		 fname=rs1.getString("fname");
	 }
	 %>
	
	   <div   class="slidingDiv" style="border-style: groove;position:absolute;top:<%=top-22%>px;left:<%=left%>px;width:60px;height:15px;" ><%=fname%></div> 
	 <div   class="slidingDiv" style="border-style: groove;position:absolute;top:<%=top%>px;left:<%=left%>px;width:<%=width%>px;height:<%=height%>px;" ></div>
	
	 
 <% }
 
 %>
 

                  </div> 
                    
                </div>

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