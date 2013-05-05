package com.password;
import java.sql.*;

import com.connection.Database;
public class PasswordChecker {
	public static ResultSet rs=null;
    public static Statement st=null;
	public static boolean validate(String user_password,int user_id){
		//database connection
		try{
			st=Database.dbconnect();
			
		    String sql="select user_password from user_detail where user_id="+user_id;
		    rs=st.executeQuery(sql);
		    //check whether user is valid
		    while(rs.next()){
		    	String ret_userpassword=rs.getString(1);
		         
		    	if(user_password.equals(ret_userpassword)){
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
			
			}catch(SQLException e){
				e.printStackTrace();
			}
	}
		return false;
	
	}
	public static boolean  passwordUpdate(String new_password,int user_id){
		try{
			st=Database.dbconnect();
		    
		    String sql="update user_detail set user_password='"+new_password+"' where user_id="+user_id;
		    st.executeUpdate(sql);
		   
		   
			
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
			
			}catch(SQLException e){
				e.printStackTrace();
			}
	}
		
		return true;
	}

}
