package com.Registration;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    // Initialize variables
	String s;
	Connection con;
	Statement st;
	ResultSet rs;
	PrintWriter out ;
 
    public Register() {
        super();
        // connect to database
     
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   try
	        {
	        	String username1="root";
	        	String password="root";	
	        	Class.forName("com.ibm.db2.jcc.DB2Driver");
	        	 con=DriverManager.getConnection("jdbc:db2://localhost:50000/testdb1",username1,password);
	        	if(con!=null)
	        	{
	        		out.println("connected");
	        	}
	        }catch(SQLException e){
	        		e.printStackTrace();
	        	} catch (ClassNotFoundException e) {
				// to handle class not found exception
				e.printStackTrace();
			}
	}

}
