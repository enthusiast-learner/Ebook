package com.Entity;

public class BookOrderDetails {

	private int id;
	private String order_id;
	private String username;
	private String email;
	private String mobile;
	private String fullAddress;
	private String bookName;
	private String author;
	private double price;
	
	private String paymentType;
	
	
	
	public BookOrderDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public String getUsername() {
		return username;
	}
	public String getEmail() {
		return email;
	}
	public String getMobile() {
		return mobile;
	}
	public String getFullAddress() {
		return fullAddress;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getBookName() {
		return bookName;
	}
	public String getAuthor() {
		return author;
	}
	public double getPrice() {
		return price;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	
	
}
