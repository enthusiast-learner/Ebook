package com.DAO;

import java.util.List;

import com.Entity.BookDetails;
import com.Entity.CartDetails;

public interface CartDAO {
	public boolean addCart(CartDetails c) ;
//	getting cart added book of particular user by userid
	public List<CartDetails> getBookByUser( int userid);
	public Boolean deleteBook(int cid);
}
