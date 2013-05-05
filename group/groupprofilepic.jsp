<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.connection.*" %>
<%@ page import="java.sql.*" %>
 <%@page import="com.beans.PostBean"%>
 <%@ page import ="java.io.*" %>
 <%@ page import ="java.util.*" %>
  <%@ page import ="org.apache.commons.fileupload.FileItemIterator"%>
 <%@ page import ="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
 <%@ page import ="org.apache.commons.fileupload.FileUploadException"%>
  <%@ page import ="com.Model.FileUpload2" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%Statement st = null;
Connection con=null;
ResultSet rs=null;

try
{
st=Database.dbconnect();
}
catch(Exception e)
{
	e.printStackTrace();
}

// TODO Auto-generated method stub

try
{
	
response.setContentType("text/html");
boolean isMultiPart=ServletFileUpload.isMultipartContent(request);

if(isMultiPart)
{
  ServletFileUpload upload= new ServletFileUpload();
  try{
	  FileItemIterator itr= upload.getItemIterator(request);
	  while(itr.hasNext())
	  {
		org.apache.commons.fileupload.FileItemStream item=itr.next();
		 if(item.isFormField()){
			  String fieldName=item.getFieldName();
			 InputStream is=item.openStream();
			 byte[] b=new byte[is.available()];
			 is.read(b);
			 
			  String value=new String(b);
			  response.getWriter().println(fieldName+":"+value+"<br/>");
			  
		 }
		 else{
			 // upload
			
			 String path=getServletContext().getRealPath("/");
				response.getWriter().println("path"+path);
			
			 
			 
			 
			 
			
			
			   String filename=FileUpload2.processFile(path, item);
            
			   String user_ids=request.getParameter("user_id");
			   String group_ids=request.getParameter("group_id");
				
			   	Integer user_id=Integer.parseInt(user_ids);
			   	Integer group_id=Integer.parseInt(group_ids);

			  // boolean recordInserted = false;
		      try{
		    	  
				String str="update groups set profilepic='"+filename+"' where group_id="+group_id;
				int i=st.executeUpdate(str);
			
				if(i!=0)
				{

					response.getWriter().println("inserted"+user_ids);
					
					response.sendRedirect("groups.jsp?user_id="+user_ids+"&group_id="+group_id);


				}
				else{
					response.getWriter().println("not inserted");
				}
				
			   

		   }catch(SQLException e){
			   e.printStackTrace();
		      }
		      finally{
		    	  try {
		    	  
		    	  } catch(Exception e){
		    		  e.printStackTrace();
		    	  }
		      }
		      
			   
			   }
			
		}
	  }
 

  catch(FileUploadException ex)
  {
	  ex.printStackTrace();
  }
}
}
catch(Exception e)
{
	e.printStackTrace();
}




%>

</body>
</html>