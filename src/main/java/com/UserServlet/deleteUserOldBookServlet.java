package com.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;

import database.DBConnection;

@WebServlet("/delUserOldBook")
public class deleteUserOldBookServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int bid = Integer.parseInt(req.getParameter("bid"));

			BooksDAOImpl bd = new BooksDAOImpl(DBConnection.getCon());
			Boolean b = bd.delUserOldBook(bid);

			HttpSession session = req.getSession();

			if (b) {
				System.out.println("users old book del succesfully");

				session.setAttribute("succmsg", "Book deleted");
				resp.sendRedirect("userOldBook.jsp");
			}

			else {
				System.out.println("error");

				session.setAttribute("failmsg", "something went wrong..");
				resp.sendRedirect("userOldBook.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
