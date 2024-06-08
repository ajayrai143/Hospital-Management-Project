<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/1395.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

<%@include file="../component/css_js.jsp"%>
</head>
<body>

	<c:if test="${empty doctorObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Patient Comment</p>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDao dao = new AppointmentDao(DBConnect.getConnection());
						Appointment ap=dao.getAppointmentById(id);
						%>

						<form class="row" action="../updateStatus" method="post">
							<div class="col-md-6">
								<label>Patient Name</label> <input type="text"
									class="form-control" value="<%=ap.getFullName() %>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label>Age</label> <input type="text" class="form-control"
									value="<%=ap.getAge() %>" readonly="readonly">
							</div>

							<div class="col-md-6">
								<label>Mob No</label> <input type="text" class="form-control"
									value="<%=ap.getPhNo() %>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label>Disease</label> <input type="text" class="form-control"
									value="<%=ap.getDiseases() %>" readonly="readonly">
							</div>
							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea rows="3" cols="" required="required" name="comm"></textarea>
							</div>
							<input type="hidden" name="id" value="<%=ap.getId()%>"> <input
								type="hidden" name="did" value="<%=ap.getDoctorId()%>">
							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>





</body>
</html>