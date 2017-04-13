package models;

import java.text.*;
import java.util.*;
import java.sql.*;
import java.util.Date;

public class userDao {
	static Connection currentCon = null;
	static ResultSet rs = null;
	
	public static user login(user u){
		
		Statement stmt = null;    
			
		String username = u.getName();    
		String password = u.getPass();
		//Date regDate= u.getregDate();
		//String email = u.getEmail();
		
		 String searchQuery = "select * from Student where username=" + "'" + username + "'" + " and password ='" + password + "'";
		 
		 try{
			 currentCon = ConnectionManager.getConnection();
	         stmt=currentCon.createStatement();
	         rs = stmt.executeQuery(searchQuery);
	         if (rs.next()) {
	        	u.setValid(true);
	         	String Uname = rs.getString(username);
	         	//Date UregDate = rs.getDate(regDate);
	         //	String Uemail = rs.getString(email);
	             System.out.println("welcome " + Uname);
	         } else {
	        	 u.setValid(false);
	             System.out.println("Invalid password ");
	         }

		 }
		 catch(Exception e){}
		
		return u;
		
	}
}
