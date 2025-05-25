package com.UserServlet;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;

import com.Entity.UserEntity;

import database.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	String email = req.getParameter("email");
	String password = req.getParameter("password");
	
	UserEntity us = new UserEntity();
	us.setEmail(email);
	us.setPassword(password);
	
	UserDAOImpl ud = new UserDAOImpl(DBConnection.getCon());
	
	  HttpSession session = req.getSession();
	
	if("admin@gmail.com".equals(email)) {
	
		UserEntity user = new UserEntity();
		user.setName("Admin");
		user.setEmail(email);
		session.setAttribute("userinfo",user);
		session.setAttribute("useremail", user.getEmail());
//		System.out.println(user.getEmail());
		resp.sendRedirect("admin/home.jsp");
	}
	else {
		UserEntity users= ud.loginUser(us);
		
		
		  if(users!=null) {
			  session.setAttribute("userinfo", users);
			 
			  resp.sendRedirect("index.jsp");
//			  resp.sendRedirect("home.jsp");
			  System.out.println("login suceesfully");
			  System.out.println(users.getName());
			  
		  }
		  else {
			  resp.sendRedirect("loginpage.jsp");
			  session.setAttribute("logfail", "Login Failed..Please try again");  
			  System.out.println("login fail");
		  }
		
	}  
}
}
