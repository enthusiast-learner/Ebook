package com.Admin.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;

import database.DBConnection;
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet{

@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		BooksDAOImpl bd = new BooksDAOImpl(DBConnection.getCon());
	   boolean f =	bd.deleteBook(id);
	   
	   HttpSession session = req.getSession();
	   
	   if(f) {
		   session.setAttribute("succmsg", "Book Deleted Successfully");
		   resp.sendRedirect("admin/allbooks.jsp");
		  
	   }
	   else {
		   session.setAttribute("failmsg", "Somthing went wrong");
		   resp.sendRedirect("admin/allbooks.jsp");
		  
	   }
	   
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
}
}
