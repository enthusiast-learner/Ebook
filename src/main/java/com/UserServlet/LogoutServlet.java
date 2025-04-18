package com.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logoutservlet")
public class LogoutServlet extends HttpServlet {
	 @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			session.removeAttribute("userinfo");
			
			session.setAttribute("logoutmsg", "Logout sucessfully");
			resp.sendRedirect("loginpage.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
