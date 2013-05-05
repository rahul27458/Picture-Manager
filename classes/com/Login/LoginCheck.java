package com.Login;
import java.sql.*;	

import com.connection.Database;

public class LoginCheck {
	//public static Connection conn=null;
    
   public static ResultSet rs=null,rs1=null;
    public static Statement st=null,st1=null;
	public static String validate(String email_id,String user_password){
		//database connection
		try{
			st=Database.dbconnect();
			st1=Database.dbconnect();
		    String sql="select email_id,user_password from user_detail";
		    rs=st.executeQuery(sql);
		  //check whether email activation has been done
		    String sqlactivation="select activation from user_detail where email_id='"+email_id+"'";
		  
		    	//check whether user is valid
		    while(rs.next()){
		    	String ret_useremail=rs.getString(1);
		         String ret_password=rs.getString(2);
		    	if(email_id.equals(ret_useremail) && user_password.equals(ret_password)){
		    		  rs1=st1.executeQuery(sqlactivation);
		    		  if(rs1.next())
		    		  {
		    		  if(rs1.getInt("activation")==1)
		    		return "validated";
		    		  else
		    			  return "inactive";
		    	}
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
		return "wrongdetails";
	
	}
}
