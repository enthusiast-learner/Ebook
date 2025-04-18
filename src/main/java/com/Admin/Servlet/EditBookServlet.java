package com.Admin.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;
import com.Entity.BookDetails;

import database.DBConnection;
@MultipartConfig
@WebServlet("/editBookServlet")
public class EditBookServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bookname = req.getParameter("Bookname");
			String authorname = req.getParameter("Authorname");
			Double price = Double.parseDouble(req.getParameter("price"));
			String status = req.getParameter("status");

			
			System.out.println("ID: " + req.getParameter("id")); // Debugging

//			call update method from daoimpl
			BooksDAOImpl bdao = new BooksDAOImpl(DBConnection.getCon());
			BookDetails bd = new BookDetails();
			bd.setBook_id(id);
			bd.setBookname(bookname);
			bd.setAuthor(authorname);
			bd.setPrice(price);
			bd.setStatus(status);	
			
			boolean f = bdao.updateBook(bd);
			
			HttpSession session  = req.getSession();
			
			if(f) {
				
				resp.sendRedirect("admin/allbooks.jsp");
				session.setAttribute("succmsg", "Book updated successfully");
			}
			else {
			
				resp.sendRedirect("admin/allbooks.jsp");
				session.setAttribute("failmsg", "Something wrong on server");
			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}

	}
}
