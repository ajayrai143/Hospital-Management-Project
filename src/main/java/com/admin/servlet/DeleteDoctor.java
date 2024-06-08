package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		try {

			int id=Integer.parseInt(req.getParameter("id"));

			DoctorDao dao = new DoctorDao(DBConnect.getConnection());
			boolean f = dao.deleteDoctor(id);

			HttpSession session = req.getSession();

			if(f) {
				session.setAttribute("successMsg", "Doctor Deleted successfully");
				resp.sendRedirect("admin/view_doctor.jsp");

			}else {
				session.setAttribute("FailedMsg", "some issue happened");
				resp.sendRedirect("admin/view_doctor.jsp");

			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



}
