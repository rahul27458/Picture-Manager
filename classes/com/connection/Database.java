/*
  Used to connect to database

*/
package com.connection;
import java.sql.*;		

import com.AES.AESencrp; 
import com.util.PropertyLoader;
public class Database {
	
	 public static ResultSet rs=null;
	    public static Statement st=null;
	    public static Connection conn=null;
		public static Statement dbconnect(){
			//database connection
			try{
				String username = PropertyLoader.getDBUserName();
				String password=AESencrp.decrypt(PropertyLoader.getDBPassword());	// AES password decryption
				try {
					Class.forName("com.ibm.db2.jcc.DB2Driver");
				} catch (ClassNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				conn=DriverManager.getConnection("jdbc:db2://localhost:50000/TESTDB1:retrieveMessagesFromServerOnGetMessage=true;",username,password);
				
			    if(conn==null)
			    {  
			    	return null;
			    
			    }
			    
			    st= conn.createStatement();
		  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
			return st;
		}
}

