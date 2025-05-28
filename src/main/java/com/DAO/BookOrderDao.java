package com.DAO;

import java.util.List;

import com.Entity.BookOrderDetails;

public interface BookOrderDao {
	public int getOrderNo();
	public boolean saveOrder(List<BookOrderDetails> blist);
	
	public List<BookOrderDetails> getOrderedBook(String email);
	
	
	public List<BookOrderDetails> getAllOrderedBookAdmin();
	
	
}
