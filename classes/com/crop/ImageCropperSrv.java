package com.crop;

import java.awt.image.BufferedImage;
import java.io.*;


import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;



/**
 * A servlet which crops the image based on the JCrop tools parameters
 * @author SANTHOSH REDDY MANDADI
 * @version 1.0
 * @since 04th September 2009
 */
public class ImageCropperSrv extends HttpServlet
{
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public void service(HttpServletRequest request, 
                     HttpServletResponse response) throws ServletException, IOException
  {
	  PrintWriter printer=response.getWriter();
	  int x1=0,y1=0,x2=0,y2=0,w=0,h=0;
	  String destFile="" ;
	try
	{
    //Get all the parameters which were populated by JCrop
   x1=Integer.parseInt(request.getParameter("x1"));
     y1=Integer.parseInt(request.getParameter("y1"));
     x2=Integer.parseInt(request.getParameter("x2"));
     y2=Integer.parseInt(request.getParameter("y2"));
    w=Integer.parseInt(request.getParameter("w"));
     h=Integer.parseInt(request.getParameter("h"));
    System.out.println(x1+" "+y1+" "+x2+" "+y2+" "+w+" "+" "+h);
    
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
    BufferedImage image=ImageIO.read(new File("D:/"+file));

    //Get the sub image
    BufferedImage out=image.getSubimage(x1,y1,w,h);

    
    

	printer.println("upload==="+"D:\\"+file);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Store the image to a new file
    ImageIO.write(out,format,new File("D:\\"+file));
    
    //Sending the output to the client by showing the cropped image with dimensions
    request.setAttribute("file",file);
    response.setContentType("text/html");
    printer.println("Photo cropped from "+x1+","+y1+" to the width of "+w+" and height of "+h);
    printer.println("<img src="+destFile+">");
    //response.sendRedirect("printimg.jsp?destFile="+destFile);
    RequestDispatcher dispatcher = request.getRequestDispatcher("Profile/printimg.jsp");
    if (dispatcher != null){
            dispatcher.forward(request, response);
    } 
	}
	catch(Exception e)
	{
		e.printStackTrace();
		printer.println("INSIDE CATCH");
		printer.println("Photo cropped from "+x1+","+y1+" to the width of "+w+" and height of "+h);
	    printer.println("<img src=\""+destFile+"\" />");
	}
	}
	
}