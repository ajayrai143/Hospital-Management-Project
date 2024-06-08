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
import com.entity.Doctor;

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet{

	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String fullName=req.getParameter("fullname");
			String dob=req.getParameter("dob");
			String qualification=req.getParameter("qualification");
			String spec=req.getParameter("spec");
			String email=req.getParameter("email");
			String mobno=req.getParameter("mobno");
			String password=req.getParameter("password");
			Doctor d = new Doctor(fullName, dob, qualification, spec, email, mobno, password);
			DoctorDao dao = new DoctorDao(DBConnect.getConnection());
			boolean f = dao.registerDoctor(d);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("successMsg", "Doctor added successfully");
				resp.sendRedirect("admin/doctor.jsp");
				
			}else {
				session.setAttribute("FailedMsg", "some issue happened");
				resp.sendRedirect("admin/doctor.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
