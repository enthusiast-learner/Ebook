package com.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

	@Override
	public boolean checkPassword(int uid , String password) {
		Boolean b = false;
		
		try {
			
			String sql ="select * from user where uid=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setString(2, password);
			
			  ResultSet rs = ps.executeQuery();
			  
			  while(rs.next()) {
				  b=true;
			  }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}

	@Override 
	public boolean updateUserInfo(UserEntity us) {
		boolean b = false;
		try {
			
			String sql = "update user set name=? ,email=? ,mobile=? where uid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getMobile());
			
			
			ps.setInt(4, us.getUid());
			System.out.println(us.getUid());
			  int affectedrow = ps.executeUpdate();
			  
			  if(affectedrow > 0 ) {
				  b = true ;
			  }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return b;
	}
	
	
}