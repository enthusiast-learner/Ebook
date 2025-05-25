package com.UserServlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BooksDAOImpl;
import com.Entity.BookDetails;

import database.DBConnection;
@MultipartConfig
@WebServlet("/addOldBook")
public class AddOldBookServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String bookname = req.getParameter("Bookname");
			String author = req.getParameter("Authorname");
			Double price = Double.parseDouble(req.getParameter("price"));
			String category = "Old Book";
			String status = "Active";
			
			String useremail = req.getParameter("user");

			Part part = req.getPart("photo");
			String fileName = part.getSubmittedFileName();
			String email = req.getParameter("useremail");

			HttpSession session = req.getSession();
			

			BookDetails bd = new BookDetails(bookname, author, price, category, status, fileName , useremail);

			System.out.println(bd);

			BooksDAOImpl bdi = new BooksDAOImpl(DBConnection.getCon());
			System.out.println("Book category: " + req.getParameter("category"));
			
			
			
			
			
//			System.out.println(path);
			boolean b = bdi.addBooks(bd);

			if (b) {
				String path = getServletContext().getRealPath("/books");
				System.out.println(path);
				File f = new File(path);
				 if (!f.exists()) {
				        f.mkdirs(); // <-- creates folder if it doesn't exist
				    }
				part.write(path + File.separator + fileName);
				session.setAttribute("succmsg", "Book add successfully");
				System.out.println("added");
				resp.sendRedirect("sellBook.jsp");
				
			} else {
				session.setAttribute("failmsg", "Try again");
				System.out.println("fail");
				resp.sendRedirect("sellBook.jsp");
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
