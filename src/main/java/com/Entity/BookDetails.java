package com.Entity;

public class BookDetails {
	private int book_id;
	private String bookname;
	private String author;
	private Double price;
	private String bookCategory;
	private String status;
	private String photo;
	private String email;
	public BookDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookDetails(String bookname, String author, Double price, String bookCategory, String status, String photo,String email) {
		super();
		
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.bookCategory = bookCategory;
		this.status = status;
		this.photo = photo;
		this.email = email;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail() {
		return email;
	}
	@Override
	public String toString() {
		return "BookDetails [book_id=" + book_id + ", bookname=" + bookname + ", author=" + author + ", price=" + price
				+ ", bookCategory=" + bookCategory + ", status=" + status + ", photo=" + photo + ", email=" + email
				+ "]";
	}
	
	
	
	
	
}
