package com.UserServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderDao;
import com.DAO.BookOrderImpl;
import com.DAO.CartDaoImpl;
import com.Entity.BookDetails;
import com.Entity.BookOrderDetails;
import com.Entity.CartDetails;

import database.DBConnection;

@WebServlet("/orderServlet")
public class BookOrderServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			HttpSession session = req.getSession();

			int uid = Integer.parseInt(req.getParameter("uid"));

			String username = req.getParameter("username");
			String email = req.getParameter("email");
			String mobile = req.getParameter("mobile");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("paymentType");

			String fullAddress = address + "," + landmark + "," + city + "," + "state" + "," + pincode;

//		System.out.println(name+email+fullAddress+mobile+city);

			CartDaoImpl cdao = new CartDaoImpl(DBConnection.getCon());
			List<CartDetails> cartDetailList = cdao.getBookByUser(uid);
			
			
			if(cartDetailList.isEmpty()) {
				session.setAttribute("cartempty", "Add Item");
				resp.sendRedirect("cart.jsp");
			}
			
			else {

				BookOrderImpl bod = new BookOrderImpl(DBConnection.getCon());

				int i = bod.getOrderNo();

				ArrayList<BookOrderDetails> bookOrder = new ArrayList();

				for (CartDetails c : cartDetailList) {
					BookOrderDetails bo = new BookOrderDetails();
//				  System.out.println(c.getBookname() + c.getAuthor() +c.getUid() + c.getPrice());
					bo.setOrder_id("BOOK-ORD_OO" + i);
					bo.setUsername(username);
					bo.setEmail(email);
					bo.setMobile(mobile);
					bo.setFullAddress(fullAddress);
					bo.setBookName(c.getBookname());
					bo.setAuthor(c.getAuthor());
					bo.setPrice(c.getPrice());;
					bo.setPaymentType(paymentType);

					bookOrder.add(bo);
					i++;
				}

				if ("noselect".equals(paymentType)) {
					session.setAttribute("choosePayment", "Please Select Payment Type..");
					resp.sendRedirect("cart.jsp");
				} else {
					boolean f = bod.saveOrder(bookOrder);

					if (f) {
						resp.sendRedirect("orderSuccessfull.jsp");
						System.out.println("order success");
					} else {
						session.setAttribute("failorder", "Order Failed! Please try again..");
						System.out.println("order fail ..error");
					}
				}
			}
			
			


		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
