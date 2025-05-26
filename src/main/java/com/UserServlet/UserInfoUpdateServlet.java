package com.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;	
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DAO.UserDAOImpl;
import com.Entity.UserEntity;

import database.DBConnection;
@MultipartConfig
@WebServlet("/updateUserinfo")
public class UserInfoUpdateServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			System.out.println("UID Parameter: " + req.getParameter("uid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String mobile = req.getParameter("mobile");
			String password = req.getParameter("password");

			UserEntity us = new UserEntity();
			us.setUid(uid);
			us.setName(name);
			us.setEmail(email);
			us.setMobile(mobile);
			
			

			HttpSession session = req.getSession();

			UserDAOImpl ud = new UserDAOImpl(DBConnection.getCon());

			
			//if password is correct then only update
			boolean b = ud.checkPassword(uid, password);

			if (b) {

				boolean f = ud.updateUserInfo(us);

				if (f) {
					System.out.println("update successfully");
					session.setAttribute("succmsg", "Update succesfully");
					resp.sendRedirect("editProfile.jsp");
				} else {
					System.out.println("update fail");
					session.setAttribute("failmsg", "something went wrong");
					resp.sendRedirect("editProfile.jsp");
				}
			}
			else {
				System.out.println("password incorrect");
			    session.setAttribute("failmsg", "Incorrect password");
			    resp.sendRedirect("editProfile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
