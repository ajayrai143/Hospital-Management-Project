<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/css_js.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

	<%@include file="component/navbar.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
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
						<form action="userChangePassword" method="post">
							<div class="mb-3">
								<label>Enter Old Password</label><input required="required"
									class="form-control" type="text" name="oldPassword">
							</div>
							<div class="mb-3">
								<label>Enter New Password</label><input required="required"
									class="form-control" type="text" name="newPassword">
							</div>
							<input type="hidden" value="${userObj.id }" name="uid">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>