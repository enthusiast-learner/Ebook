package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.BookDetails;

public class BooksDAOImpl implements BooksDao {

	private Connection conn;

	public BooksDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDetails bd) {
		boolean f = false;
		try {
			String q = "insert into book_details(bookname,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(q);

			ps.setString(1, bd.getBookname());
			ps.setString(2, bd.getAuthor());
			ps.setDouble(3, bd.getPrice());
			ps.setString(4, bd.getBookCategory());
			ps.setString(5, bd.getStatus());
			ps.setString(6, bd.getPhoto());
			ps.setString(7, bd.getEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<BookDetails> getAllBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String q = "select * from book_details";
			PreparedStatement ps = conn.prepareStatement(q);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

//				when the data retrieve from db one by one object create and store into list 
				b = new BookDetails();

				b.setBook_id(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDetails getbookbyId(int id) {

		BookDetails b = null;

		try {

			String sql = "select * from book_details where book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDetails();
				b.setBook_id(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	@Override
	public boolean updateBook(BookDetails bd) {

		boolean f = false;

		try {

			String sql = "update book_details set bookname=?,author=?,price=?,status=? where book_id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, bd.getBookname());
			ps.setString(2, bd.getAuthor());
			ps.setDouble(3, bd.getPrice());
			ps.setString(4, bd.getStatus());
			ps.setInt(5, bd.getBook_id());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	@Override
	public boolean deleteBook(int id) {
		boolean f = false;

		try {

			String sql = "delete from book_details where book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int affectedrow = ps.executeUpdate();

			if (affectedrow > 0) {
				f = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return true;
	}

	@Override
	public List<BookDetails> getNewBooks() {
		List<BookDetails> bookdetails = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {

			String sql = "select * from book_details where bookCategory=? and status = ? order by book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New Book");
			ps.setString(2, "Available");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetails();
				b.setBook_id(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				bookdetails.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bookdetails;
	}

	@Override
	public List<BookDetails> getRecentBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "SELECT * FROM book_details WHERE status = ? ORDER BY book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Available");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetails();
				b.setBook_id(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "Select * from book_details where bookCategory='Old Book'";
			PreparedStatement ps = conn.prepareStatement(sql);
//			ps.setString(1, "Old Book");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetails();
				b.setBook_id(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookDetails> getAllRecentBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "SELECT * FROM book_details WHERE status = ? ORDER BY book_id DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Available");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBook_id(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "Select * from book_details where bookCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old Book");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDetails();
				b.setBook_id(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookDetails> getAllNewBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {

			String sql = "select * from book_details where bookCategory=? and status = ? order by book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New Book");
			ps.setString(2, "Available");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				b = new BookDetails();

				b.setBook_id(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookDetails> getBookByOld(String email, String category) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "select * from book_details where bookCategory=? and email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, email);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDetails();
				b.setBook_id(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean delUserOldBook(int bid) {
		
		Boolean b = false;
		
		try {
			
			String sql = "delete from book_details where book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				b= true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}

	@Override
	public List<BookDetails> getBookBySearch(String ch) {
	
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "select * from book_details where bookname like ? or author like ? or bookCategory like ? and status like ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Available");
	

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDetails();
				b.setBook_id(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
		return list;
	}


}
