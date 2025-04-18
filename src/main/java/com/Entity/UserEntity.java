package com.Entity;

//POJO class - plain old java object
public class UserEntity {

	//private fields : encapsulation and can't change directly
	private int uid;
	private String name;
	private String email;
	private String mobile;
	private String password;
	private String address;
	private String landmark;
	private String city;
	private String state;
	private String pincode;
	
	
	
	
	
	public UserEntity(int uid , String name, String email, String mobile, String password) {
		super();
		this.uid = uid;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.password = password;
	}
	public UserEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	

	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "UserEntity [uid=" + uid + ", name=" + name + ", email=" + email + ", mobile=" + mobile + ", password="
				+ password + ", address=" + address + ", landmark=" + landmark + ", city=" + city + ", state=" + state
				+ ", pincode=" + pincode + "]";
	}
}
