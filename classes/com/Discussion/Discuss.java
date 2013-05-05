package com.Discussion;
import java.sql.*;

import com.connection.Database;
public class Discuss {
	
	public static Statement st=null;
	public static ResultSet rs=null;
	
	public static boolean dbInsert(String post_name,String category,String postdescription,int user_id){
		
		try{
			
			
			st=Database.dbconnect();
		    String sql="insert into post(user_id,time_stamp,post_name,category,postdescription)values('"+user_id+"',current timestamp,'"+post_name+"','"+category+"','"+postdescription+"')";
		   int i=st.executeUpdate(sql);
		   if(i!=0){
			return true;   
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
	}


