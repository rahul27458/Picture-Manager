package com.Model;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DisplayImages extends HttpServlet {
	
	/**
	 * 
	 */
	

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ServletOutputStream sos = null;
		FileInputStream fis = null;
		
		byte b[] = null;
		
		try {
			sos = response.getOutputStream();
			
			fis = new FileInputStream("D:\\" + request.getParameter("fileName"));
			b = new byte[fis.available()];
			fis.read(b);
			
			sos.write(b);
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			try {
				if(sos != null) {
					sos.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
