<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

<%@include file="../component/css_js.jsp"%>

</head>
<body>
	<c:if test="${empty doctorObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Change Password</p>
						<c:if test="${not empty successMsg }">
							<p class="text-center text-success fs-3">${successMsg }</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>
						<c:if test="${not empty FailedMsg }">
							<p class="text-center text-danger fs-5">${FailedMsg }</p>
							<c:remove var="FailedMsg" scope="session" />
						</c:if>
						<form action="../doctorChangePassword" method="post">
							<div class="mb-3">
								<label>Enter Old Password</label><input required="required"
									class="form-control" type="text" name="oldPassword">
							</div>
							<div class="mb-3">
								<label>Enter New Password</label><input required="required"
									class="form-control" type="text" name="newPassword">
							</div>
							<input type="hidden" value="${doctorObj.id }" name="uid">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-5 offset-md-2">
				<div class="card  paint-card">
				<p class="text-center">Edit Profile</p><c:if test="${not empty successMsgd }">
							<p class="text-center text-success fs-3">${successMsgd }</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>
						<c:if test="${not empty FailedMsgd }">
							<p class="text-center text-danger fs-5">${FailedMsgd }</p>
							<c:remove var="FailedMsg" scope="session" />
						</c:if>
					<div class="card-body">
						<form action="../doctorUpdateProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input
									required="required" name="fullname" type="text" value="${doctorObj.fullName }"
									class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label> <input required="required" value="${doctorObj.dob}"
									name="dob" type="date" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									required="required" name="qualification" type="text" value="${doctorObj.qualification}"
									class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									type="date" class="form-control">
									<option>${doctorObj.specialist}</option>
									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConnection());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getspecialistName()%></option>
									<%
									}
									%>
								</select>

							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input
									required="required" name="email" type="text" readonly="readonly" value="${doctorObj.email}"
									class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label> <input
									required="required" name="mobno" type="text" value="${doctorObj.mobno}"
									class="form-control">
							</div>
							
							<input type="hidden" name="id" value="${doctorObj.id }">
						
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>