package com.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;
import com.DAO.CartDaoImpl;
import com.Entity.BookDetails;
import com.Entity.CartDetails;

import database.DBConnection;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
//			taking bid and uid from url when we click on addtoCart button
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			
//			first we are getting the book by id and store bookdetails in bd
			 BooksDAOImpl bdao = new BooksDAOImpl(DBConnection.getCon());
			   BookDetails bd= bdao.getbookbyId(bid);
			   
//			   now we are setting the bookdetails and bid,uid to cartDetails pojo
			   CartDetails cd = new CartDetails();
			   cd.setBid(bid);
			   cd.setUid(uid);
			   cd.setBookname(bd.getBookname());
			   cd.setAuthor(bd.getAuthor());
			   cd.setPrice(bd.getPrice());
			   cd.setTotalprice(bd.getPrice());
			   
//			   injecting the connection to cartDaoImpl and calling the addCart() for inserting the bookdetails inside cart
			   CartDaoImpl cdao = new CartDaoImpl(DBConnection.getCon());
			     boolean f  = cdao.addCart(cd);
			     
			      HttpSession session= req.getSession();
			     
			     if(f) {
			    	 session.setAttribute("addcart", "Book added to cart");
			    	 resp.sendRedirect("allNewBooks.jsp");
			    	 System.out.println("add cart successfully");
			     }
			     else {
			    	 session.setAttribute("addcartfail", "Something Wrong on server");
			    	 resp.sendRedirect("allNewBooks.jsp");
			    	 System.out.println("not added to cart");
			     }
			   
					
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
