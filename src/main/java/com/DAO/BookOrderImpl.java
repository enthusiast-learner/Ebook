package com.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.Entity.BookOrderDetails;
import com.mysql.jdbc.Connection;


public class BookOrderImpl implements BookOrderDao{
	
	private java.sql.Connection con;
	
	

	public BookOrderImpl(java.sql.Connection con) {
		super();
		this.con = con;;
	}



	@Override
	public int getOrderNo() {
		int i = 1;
		try {
			String sql = "select * from book_order";
			PreparedStatement ps = con.prepareStatement(sql);
			  ResultSet rs = ps.executeQuery();
			  
			  while(rs.next()) {
				  i++;
			  }
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
				return i;
	}



	@Override
	public boolean saveOrder(List<BookOrderDetails> blist) {
		
		boolean f = false;
		
		try {
			String sql = "insert into book_order (order_id,username,email,address,mobile,bookName, author,price,paymentType) values (?,?,?,?,?,?,?,?,?)";
			
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement(sql);
			
			
			for(BookOrderDetails b : blist) {
				ps.setString(1,b.getOrder_id());
				ps.setString(2, b.getUsername());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFullAddress());
				ps.setString(5, b.getMobile());
				ps.setString(6,b.getBookName());
				ps.setString(7,b.getAuthor());
				ps.setDouble(8,b.getPrice());
				ps.setString(9,b.getPaymentType());
				
				ps.addBatch();
			
			}
			int[] i = ps.executeBatch();
			con.commit();
			f = true;
			
			con.setAutoCommit(true);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return f;
	}


//	gettting the data of ordered books

	@Override
	public List<BookOrderDetails> getOrderedBook(String email) {
		// TODO Auto-generated method stub
		
		List<BookOrderDetails> bodlist = new ArrayList<>();
		BookOrderDetails o = null;
		try {
			
			String sql = "select * from book_order where email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			 ResultSet rs= ps.executeQuery();
			 
			 while(rs.next()) {
				 o = new BookOrderDetails();
				 o.setId(rs.getInt(1));
				 o.setOrder_id(rs.getString(2));
				 o.setUsername(rs.getString(3));
				 o.setEmail(rs.getString(4));
				 o.setFullAddress(rs.getString(5));
				 o.setMobile(rs.getString(6));
				 o.setBookName(rs.getString(7));
				 o.setAuthor(rs.getString(8));
				 o.setPrice(rs.getDouble(9));
				 o.setPaymentType(rs.getString(10));
				 
				 bodlist.add(o);
				 
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bodlist;
	}



	@Override
	public List<BookOrderDetails> getAllOrderedBookAdmin() {
		// TODO Auto-generated method stub
		
		List<BookOrderDetails> bodlist = new ArrayList<>();
		BookOrderDetails o = null;
		try {
			
			String sql = "select * from book_order";
			PreparedStatement ps = con.prepareStatement(sql);
			
			 ResultSet rs= ps.executeQuery();
			 
			 while(rs.next()) {
				 o = new BookOrderDetails();
				 o.setId(rs.getInt(1));
				 o.setOrder_id(rs.getString(2));
				 o.setUsername(rs.getString(3));
				 o.setEmail(rs.getString(4));
				 o.setFullAddress(rs.getString(5));
				 o.setMobile(rs.getString(6));
				 o.setBookName(rs.getString(7));
				 o.setAuthor(rs.getString(8));
				 o.setPrice(rs.getDouble(9));
				 o.setPaymentType(rs.getString(10));
				 
				 bodlist.add(o);
				 
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bodlist;
	}

}
