 <%@page import="com.connection.*" %>
 <%@ page import="java.sql.*" %>
<html>

    <head>
        <title>View your tag</title>
        <link href="css/jquery-ui.tag.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="js/jquery.tag.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui.tag.min.js"></script>
        <style type="text/css" >

            body{
                font-size:13px;
                font-family:"Arial";
            }
            #mapper{
                border:5px solid #EEE;
                width:100px;
                height:100px;
                min-width:100px;
                min-height:100px;
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
                width:600px;
                position:relative;
            }
            #image_panel img{
                left:0;top:-102px;
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
        $(".tagged").live("mouseover",function(){
            if($(this).find(".openDialog").length == 0){
                $(this).find(".tagged_box").css("display","block");
                $(this).css("border","5px solid #EEE");

                $(this).find(".tagged_title").css("display","block");
            }
		

        });
           
           

          
        function show(id) {
        	
            document.getElementByName(id).style.visibility = "visible";
          }
          function hide(id) {
            document.getElementByName(id).style.visibility = "hidden";
          }



        </script>
        </head>
     <body>
     
    
 <div id='main_panel'>

             <div style='margin: auto; width: 600px;'>
                <div id='image_panel' >
                 <img src='tagging.jpg' id='imageMap'  /> 
                    <div id='mapper' ><img src='save.png' onclick='openDialog()' /></div>
 <%
Statement st = null;
int image_id=1;
 ResultSet rs=null;
 st=Database.dbconnect();
 String sql="select * from tag where image_id='"+image_id+"'";
 rs=st.executeQuery(sql);
 while(rs.next()) 
 {
	 double left=rs.getDouble("posx");
	 double top=rs.getDouble("posy");
	 double width=rs.getDouble("posw");
	 double height=rs.getDouble("posh");
	 String tag_name=rs.getString("tag_name");
	 %>
	
	   <div   class="tagged_name" style="border-style: groove;position:absolute;top:<%=top-22%>px;left:<%=left%>px;width:60px;height:15px;" ><%=tag_name%></div> 
	 <div   class="tagged_box" style="border-style: groove;position:absolute;top:<%=top%>px;left:<%=left%>px;width:<%=width%>px;height:<%=height%>px;" ></div>
	
	 
 <% }
 
 %>
 

                  </div> 
                    
                </div>

            </div>
        
        </div> 
    </body>
            </html>