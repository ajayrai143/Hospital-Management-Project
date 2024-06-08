package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;
@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {

			int id =Integer.parseInt(req.getParameter("id")) ;
			int did = Integer.parseInt(req.getParameter("did"));
			String comm= req.getParameter("comm");
			
			HttpSession session = req.getSession();
			AppointmentDao dao = new AppointmentDao(DBConnect.getConnection());
			boolean f = dao.updateCommentStatus(id, did, comm);
			
			if(f) {
				session.setAttribute("succMsg", "Successfully updated the comment");
				resp.sendRedirect("doctor/patient.jsp");

			}else {
				session.setAttribute("FailedMsg", "something went wrong");
				resp.sendRedirect("doctor/patient.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
