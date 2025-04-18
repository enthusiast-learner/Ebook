package com.UserServlet;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
//import com.DAO.UserDao;
import com.Entity.UserEntity;

import database.DBConnection;

//servlet mapping 
//mapping servlet to this  URL /RegisterServlet
//when user submit registration form to this url ,  /RegisterServlet this servlet runs
@WebServlet("/RegisterServlet")

//inheriting HttpServlet , making it a web container
public class RegisterServlet extends HttpServlet {
	@Override
//	doPost() : handles form submission 
//	req : incoming request (form data)
//	resp : redirecting (giving dynamic resp to client)
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		getting user data from Form and setting it to String name,email,pass,mobile
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String mobile = req.getParameter("mobile");
		String password = req.getParameter("password");
		String check = req.getParameter("check");
		
		
//		System.out.println(name + email + mobile + password + check);
//		contructor injection concept
//		DBConnection.getCon() : returns connection object 
//		and pass it to userDao bcoz to avoid re-creating connection inside every DAO method
//		to call userDao method we need connection
//		for doing operation on database using userDao methods, the UserDao need to talk to the DB to do that so it need a connection object 
//		without connection userdao cant talk to the DB
//		UserDAOImpl ud = new UserDAOImpl(DBConnection.getCon());
		
//		creating user object and setting values to this object
		UserEntity user = new UserEntity();
//		setting this (user data) value to user object which we taken from form  
		user.setName(name);
		user.setEmail(email);
		user.setMobile(mobile);
		user.setPassword(password);
//		
//		
//		calling addUser() from UserDao , its method return type is boolean 
//		passing user POJO object to addUser as input and this method tries to insert it into DB
//		 boolean f = ud.userRegister(user);
		 
		 HttpSession session = req.getSession();
//		if checkbox is null dont create db connection
		 if(check!=null) {
			 UserDAOImpl ud = new UserDAOImpl(DBConnection.getCon());
			 boolean f = ud.userRegister(user);
//			 creating session object and req.getSession(); getting /creating session 
//			 session : used to store temporary data across pages (success/fail msg)
			
			 
//			 if f==true
			 if (f) {
				    session.setAttribute("regsuc", "Register Successfully");
				    resp.sendRedirect("registrationpage.jsp");
				} else {
				    session.setAttribute("regfail", "Please try again..");
				    resp.sendRedirect("registrationpage.jsp"); // ✅ don't forget this!
				}
		 }
		 else {
//			 System.out.println("Please check terms and conditions");
			 session.setAttribute("failmsg", "Please Agree terms and Conditions");
			 resp.sendRedirect("registrationpage.jsp");
		 }

	}
}


//static Connection con : it keeps only single copy of connection 
//the connection is already established and store into the con object , So avoid creating new connection everytime and use this con object
//DBConnection.getCon() : we are reusing the connection object 

