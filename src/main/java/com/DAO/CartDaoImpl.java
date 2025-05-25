package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.BookDetails;
import com.Entity.CartDetails;
import com.mysql.cj.protocol.Resultset;

public class CartDaoImpl implements CartDAO {
	
	
	private Connection con;
	public CartDaoImpl (Connection con) {
		this.con = con;
	}

	@Override
	public boolean addCart(CartDetails c) {
		Boolean b = false;
		
		try {
			String sql = " insert into cart(bid,uid,bookname,author,price,totalprice) values (?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getBookname());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalprice());
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				b = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return b;
	}

	@Override
	public List<CartDetails> getBookByUser(int userid) {
		// TODO Auto-generated method stub
		List<CartDetails> cartdetails = new ArrayList<CartDetails>();
		CartDetails cd = null;
		double totalPrice = 0;
		
		try {
			
			String sql = "select * from cart where uid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userid);
			
			   ResultSet rs= ps.executeQuery();
		
			while(rs.next()) {
				cd = new CartDetails();
				cd.setCid(rs.getInt(1));
				cd.setBid(rs.getInt(2));
				cd.setUid(rs.getInt(3));
				cd.setBookname(rs.getString(4));
				cd.setAuthor(rs.getString(5));
				cd.setPrice(rs.getDouble(6));
				
				totalPrice = totalPrice + rs.getDouble(7);
				cd.setPrice(totalPrice);
				cartdetails.add(cd);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cartdetails;
	}

	@Override
	public Boolean deleteBook(int cid) {
		boolean b = false;
		try {
			String sql = "delete from cart where cid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, cid);
			
			int i =ps.executeUpdate();
			if(i == 1) {
				b =true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}

}
