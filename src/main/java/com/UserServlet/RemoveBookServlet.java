package com.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDaoImpl;

import database.DBConnection;

@WebServlet("/remove_book_servlet")
public class RemoveBookServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		CartDaoImpl cd = new CartDaoImpl(DBConnection.getCon());
		 boolean b = cd.deleteBook(cid);
		 HttpSession session = req.getSession();
		 
		 if(b) {
			 session.setAttribute("succmsg", "Book Removed from Cart");
			 resp.sendRedirect("cart.jsp");
		 }
		 else {
			 session.setAttribute("failmsg", "Error! Try again!");
			 resp.sendRedirect("cart.jsp");
		 }
	}
	
}
