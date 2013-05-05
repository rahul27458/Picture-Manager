package com.AdminLogin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.AES.AESencrp;

public class AdminCheck {
	public static Connection conn=null;
    
	   public static ResultSet rs=null;
	    public static Statement st=null;
		public static boolean validate(String user_email,String user_password){
			//database connection
			try{
				String username = "root";
				String password=AESencrp.decrypt("Wz8gvD7s9Skl8un0iNCmZg==");	
				try {
					Class.forName("com.ibm.db2.jcc.DB2Driver");
				} catch (ClassNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				conn=DriverManager.getConnection("jdbc:db2://localhost:50000/TESTDB1:retrieveMessagesFromServerOnGetMessage=true;",username,password);
				
			    st= conn.createStatement();
			    String sql="select username,password from admin_login";
			    rs=st.executeQuery(sql);
			    //check whether user is valid
			    while(rs.next()){
			    	String ret_useremail=rs.getString(1);
			         String ret_password=rs.getString(2);
			    	if(user_email.equals(ret_useremail) && user_password.equals(ret_password)){
			    		return true;
			    	}
			    	
			    }
				
		  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			
				try {
				if(rs != null) {
				rs.close ();
				}
				if(st != null) {
				st.close ();
				}
				if(conn != null) {
				conn.close();
				}
				}catch(SQLException e){
					e.printStackTrace();
				}
		}
			return false;
		
		}
}
