<html>
    <head>
        <title>Image Tagging</title>
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
</style>
        <style type="text/css" >
        #log_out{
		position:absolute;
		top:10px;
		right:10px;
		}
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
        <%String user_id=request.getParameter("user_id");
      String image_id=request.getParameter("image_id"); 
        %>
        <script>
            $(document).ready(function() {
                


                $("#imageMap").click(function(e){


                    var image_left = $(this).offset().left;
                    var click_left = e.pageX;
                    var left_distance = click_left - image_left;

                    var image_top = $(this).offset().top;
                    var click_top = e.pageY;
                    var top_distance = click_top - image_top;

                    var mapper_width = $('#mapper').width();
                    var imagemap_width = $('#imageMap').width();

                    var mapper_height = $('#mapper').height();
                    var imagemap_height = $('#imageMap').height();


			



                    if((top_distance + mapper_height > imagemap_height) && (left_distance + mapper_width > imagemap_width)){
                        $('#mapper').css("left", (click_left - mapper_width - image_left  ))
                        .css("top",(click_top - mapper_height - image_top  ))
                        .css("width","100px")
                        .css("height","100px")
                        .show();
                    }
                    else if(left_distance + mapper_width > imagemap_width){


                        $('#mapper').css("left", (click_left - mapper_width - image_left  ))
                        .css("top",top_distance)
                        .css("width","100px")
                        .css("height","100px")
                        .show();
			
                    }
                    else if(top_distance + mapper_height > imagemap_height){
                        $('#mapper').css("left", left_distance)
                        .css("top",(click_top - mapper_height - image_top  ))
                        .css("width","100px")
                        .css("height","100px")
                        .show();
                    }
                    else{


                        $('#mapper').css("left",left_distance)
                        .css("top",top_distance)
                        .css("width","100px")
                        .css("height","100px")
                        .show();
                    }


                    $("#mapper").resizable({ containment: "parent" });
                    $("#mapper").draggable({ containment: "parent" });
                    
                });


            });




            $(".tagged").live("mouseover",function(){
                if($(this).find(".openDialog").length == 0){
                    $(this).find(".tagged_box").css("display","block");
                    $(this).css("border","5px solid #EEE");

                    $(this).find(".tagged_title").css("display","block");
                }
			

            });

            $(".tagged").live("mouseout",function(){
                if($(this).find(".openDialog").length == 0){
                    $(this).find(".tagged_box").css("display","none");
                    $(this).css("border","none");
                    $(this).find(".tagged_title").css("display","none");
                }
			

            });

            $(".tagged").live("click",function(){
                $(this).find(".tagged_box").html("<img src='del.png' class='openDialog' value='Delete' onclick='deleteTag(this)' />\n\
        <img src='save.png' onclick='editTag(this);' value='Save' />");

                var img_scope_top = $("#imageMap").offset().top + $("#imageMap").height() - $(this).find(".tagged_box").height();
                var img_scope_left = $("#imageMap").offset().left + $("#imageMap").width() - $(this).find(".tagged_box").width();

                $(this).draggable({ containment:[$("#imageMap").offset().left,$("#imageMap").offset().top,img_scope_left,img_scope_top]  });

            });

            var addTag = function(){
                var position = $('#mapper').position();


                var pos_x = position.left;
                var pos_y = position.top;
                var pos_width = $('#mapper').width();
                var pos_height = $('#mapper').height();
               
              
                $('#planetmap').append('<div class="tagged"  style="width:'+pos_width+';height:'+
                    pos_height+';left:'+pos_x+';top:'+pos_y+';" ><div   class="tagged_box" style="width:'+pos_width+';height:'+
                    pos_height+';display:none;" ></div><div class="tagged_title" style="top:'+(pos_height+5)+';display:none;" >'+
                    $("#title").val()+'</div></div>');

              
               var hiddentitle1=document.getElementById("hiddentitle").value;
              
               
       
            
                  var xmlhttp;
              
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
               
                xmlhttp.open("POST","../TagServlet?posx="+pos_x+"&posy="+pos_y+"&posw="+pos_width+"&posh="+pos_height+"&tag_name="+$("#title").val()+"&friend_emailid="+hiddentitle1+"&user_id="+<%=user_id%>+"&image_id="+<%=image_id%>,true);
                xmlhttp.send(); 
                
                
                $("#mapper").hide();
                $("#title").val('');
                $("#form_panel").hide();
                
                
                

            };

            var openDialog = function(){
                $("#form_panel").fadeIn("slow");
            };

            var showTags = function(){
                $(".tagged_box").css("display","block");
                $(".tagged").css("border","5px solid #EEE");
                $(".tagged_title").css("display","block");
            };

            var hideTags = function(){
                $(".tagged_box").css("display","none");
                $(".tagged").css("border","none");
                $(".tagged_title").css("display","none");
            };
		
            var editTag = function(obj){

                $(obj).parent().parent().draggable( 'disable' );
                $(obj).parent().parent().removeAttr( 'class' );
                $(obj).parent().parent().addClass( 'tagged' );
                $(obj).parent().parent().css("border","none");
                $(obj).parent().css("display","none");
                $(obj).parent().parent().find(".tagged_title").css("display","none");
                $(obj).parent().html('');

            }

            var deleteTag = function(obj){
                $(obj).parent().parent().remove();
            };



        </script>
    </head>
    <body>
   
<script type="text/javascript">


function showHint(str1)
{  
 var xmlhttp;
if (str1.length==0)
  { 
  document.getElementByName("title").innerHTML="";
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
    document.getElementById("txtHint1").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","tagHint.jsp?q="+str1+"&user_id="+<%=user_id%>,true);
xmlhttp.send(); 
}
</script>
    
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
	
    <%String fileName=request.getParameter("fileName"); %>
        <div id='main_panel'>

             <div style='margin: auto; width: 600px;'>
                <div id='image_panel' >
                    <img src="/xyz/DisplayImages/?fileName=<%=fileName%>" id='imageMap'  />
                    <div id='mapper' ><img src='../images/save.png' onclick='openDialog()' /></div>

                    <div id="planetmap">

                    </div>
                    <div id='form_panel'>
                        <div class='row'>
                            <div class='label'>Title</div><div class='field'><form name="taggs" method="GET"><input type='text' id='title' name="title" onkeyup="showHint(this.value)"/>
                            <input type="hidden" id="hiddentitle">
                            
                            </form></div>
                         <span id="txtHint1"></span>
                        </div>
                        <div class='row'>
                            <div class='label'></div>
                            <div class='field'>
                                <input type='button' value='Add Tag' onclick='return addTag()' />
							
                            </div>
                        </div>

                    </div>
                </div>

            </div>
            <div style="clear: both;
                 margin: 20px auto;
                 padding: 20px 0;
                 text-align: center;
                 width: 600px;">
                  <form action="display_profile.jsp">
                  <%-- <input type="hidden" name="fileName" value="<%=fileName%>" /> --%>
     			<input type="hidden" name="user_id" value="<%=user_id%>" />
                 <input type="submit" value="Done Tagging">
                 </form> 
                <!-- <input type="button" value="Show Tags" onclick="showTags()" />
                <input type="button" value="Hide Tags" onclick="hideTags()" /> -->
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




