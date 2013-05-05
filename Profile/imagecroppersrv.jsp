<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
 <%@page import="java.awt.image.BufferedImage"%>
 <%@ page import ="java.util.*" %>
 <%@ page import ="java.io.*" %>
 <%@ page import ="javax.imageio.ImageIO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%


String user_id=request.getParameter("user_id");
Statement st=null;
PrintWriter printer=response.getWriter();
int x1=0,y1=0,x2=0,y2=0,w=0,h=0;
String destFile="" ;
try
{
int image_id=Integer.parseInt(request.getParameter("image_id"));
//Get all the parameters which were populated by JCrop
x1=Integer.parseInt(request.getParameter("x1"));
y1=Integer.parseInt(request.getParameter("y1"));
x2=Integer.parseInt(request.getParameter("x2"));
y2=Integer.parseInt(request.getParameter("y2"));
w=Integer.parseInt(request.getParameter("w"));
h=Integer.parseInt(request.getParameter("h"));
/* System.out1.println(x1+" "+y1+" "+x2+" "+y2+" "+w+" "+" "+h); */
st=Database.dbconnect();
String sql="delete from tag where image_id="+image_id;
st.executeUpdate(sql);
//Get the file name from the server
String file=request.getParameter("file");
int dotformat=file.lastIndexOf('.');
String format=file.substring(dotformat+1);
printer.println("file formats:"+format);
 String serverPath=getServletContext().getRealPath("/");
String sourceFile=serverPath+file; 
printer.println("filename is:"+sourceFile);
//Forming the dest file path with t suffix. So, if the file is a.jpg, dest file will be at.jpg
int x = sourceFile.lastIndexOf(".");
printer.println("destfile12:"+ x);
destFile = (sourceFile.substring(0, x)+"t"+sourceFile.substring(x, sourceFile.length()));
printer.println("destfile:"+destFile);
//Get the buffered image reference
printer.println("File in C drive:C:\\"+file);
BufferedImage image=ImageIO.read(new File("C:/"+file));

//Get the sub image
BufferedImage out1=image.getSubimage(x1,y1,w,h);
printer.println("upload==="+"C:\\"+file);

//Store the image to a new file
ImageIO.write(out1,format,new File("C:/"+file));

//Sending the output to the client by showing the cropped image with dimensions
/* request.setAttribute("file",file);
response.setContentType("text/html"); */
printer.println("Photo cropped from "+x1+","+y1+" to the width of "+w+" and height of "+h);
printer.println("<img src="+destFile+">");
//response.sendRedirect("printimg.jsp?destFile="+destFile);

response.sendRedirect("display_profile.jsp?user_id="+user_id); 
}
catch(Exception e)
{
	
	response.sendRedirect("display_profile.jsp?user_id="+user_id); 
	/*printer.println("INSIDE CATCH");
	printer.println("Photo cropped from "+x1+","+y1+" to the width of "+w+" and height of "+h);
  printer.println("<img src=\""+destFile+"\" />");*/
}

%>
</body>
</html>