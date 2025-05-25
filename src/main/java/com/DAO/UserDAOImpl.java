package com.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;

import org.apache.catalina.User;

import com.Entity.UserEntity;


public class UserDAOImpl implements UserDAO	 {

	private Connection con;

	public UserDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean userRegister(UserEntity us) {
		boolean f = false;
		
		try {
			String q = "insert into user  (name,email,mobile,password) values (?,?,?,?) ";
			PreparedStatement ps = con.prepareStatement(q);
			ps.setString(1,us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getMobile());
			ps.setString(4, us.getPassword());
			
			  int affectedrow = ps.executeUpdate();
			  
			  if(affectedrow > 0 ) {
				  f = true ;
			  }
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

	@Override
	public UserEntity loginUser(UserEntity user) {
		
		UserEntity us = null ;
		
		try {
			String q = "select * from user where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(q);
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPassword());
			
			 java.sql.ResultSet rs= ps.executeQuery();
			 
			 if(rs.next()) {
				us =  new UserEntity();
				us.setUid(rs.getInt("uid"));
				us.setName(rs.getString("name"));
				us.setEmail(rs.getString("email"));
				us.setMobile(rs.getString("mobile"));
				us.setPassword(rs.getString("password"));
				us.setAddress(rs.getString("address"));
				us.setLandmark(rs.getString("landmark"));
				us.setCity(rs.getString("city"));
				us.setState(rs.getString("state")); 
				us.setPincode(rs.getString("pincode"));
				
				
			 }
		}
		catch(Exception e){
			e.printStackTrace();
		}
//		if no match record found just return the null user
		return us;
		
		
	}
	
	
}
