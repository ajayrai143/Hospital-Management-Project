package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
@WebServlet("/userChangePassword")
public class ChangePassword extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uid=Integer.parseInt(req.getParameter("uid"));
		String oldPassword=req.getParameter("oldPassword");
		String newPassword=req.getParameter("newPassword");

		UserDao dao = new UserDao(DBConnect.getConnection());

		HttpSession session = req.getSession();

		if(dao.checkOldPassword(uid, oldPassword)) {
			if(dao.changePassword(uid, newPassword)) {
				session.setAttribute("successMsg", "Password changed successfully");
				resp.sendRedirect("change_password.jsp");
			}
			else {
				session.setAttribute("FiledMsg", "Something wrong on server");
				resp.sendRedirect("change_password.jsp");
			}
		}else {
			session.setAttribute("FiledMsg", "old Password incorrect");
			resp.sendRedirect("change_password.jsp");
		}
	}



}
