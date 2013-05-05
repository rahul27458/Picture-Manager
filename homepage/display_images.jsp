<%@page import="java.io.FileInputStream"%>
<%
	FileInputStream fis = null;

	byte b [] = null;
	
	String fileName = request.getParameter("fileName");
	System.out.println("Images " + fileName);
	if(fileName != null && !fileName.trim().equals("")) {
		
		try {
			fis = new FileInputStream("C:/Users/rahul/workspace/tgmc/upload/images/" + fileName);
		System.out.println("FileName " + fileName);
			b = new byte[fis.available()];
			fis.read(b);
			
			response.reset();			
			response.setContentType("image/jpeg");
			response.getOutputStream().write(b);
			response.getOutputStream().flush();
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			try {
				if(fis != null) {
					fis.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
%>