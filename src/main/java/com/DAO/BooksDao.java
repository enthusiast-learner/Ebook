package com.DAO;

import java.util.List;

import com.Entity.BookDetails;

public interface BooksDao {
	public boolean addBooks(BookDetails bd);
	
	public List<BookDetails> getAllBook();
	
	public BookDetails getbookbyId(int id);
	
	public boolean updateBook(BookDetails bd);
	
	public boolean deleteBook(int id);
	
	public List<BookDetails> getNewBooks();
	
	public List<BookDetails> getRecentBooks();
	
	public List<BookDetails> getOldBooks();
	
	public List<BookDetails> getAllRecentBooks();
	
	public List<BookDetails> getAllOldBooks();
	
	public List<BookDetails> getAllNewBooks();
	
	public List<BookDetails> getBookByOld(String email, String category);
	
	public boolean delUserOldBook(int bid);
	
	public List<BookDetails> getBookBySearch(String ch);
	
	
	
	 
}
