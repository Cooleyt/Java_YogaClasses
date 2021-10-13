<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>   
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>One</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/5.0.1/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/5.0.1/js/bootstrap.min.js"></script>
</head>
<div
  class="sm-image"
  style="
    background-image: url('https://t4.ftcdn.net/jpg/03/53/69/47/360_F_353694700_lsrADp9I4upIkW4V4Oj2Wwi2Ji6C0jjb.jpg');
    height: 100vh;
  "
>
<body>

<h2>${course.className} with ${course.user.name}</h2>
	
	<h5>Day: ${course.weekDay}</h5>
	<h5>Cost:$ ${course.price}</h5>
	<h5>Description: ${course.description}</h5>
	
	<c:choose>
		<c:when test="${course.user.id == user.id}">
			<a href = "/editCourse/${course.id}">Edit</a>
			<a href = "/destroy/${course.id}">Delete</a>
			</c:when>
			<c:otherwise>
				<u style="color:red;">Only instructors can edit their courses</u>
			</c:otherwise>
	</c:choose>
	

	<a href="http://localhost:8080/dashboard">Back to Class Schedule</a>
	
</body>
</div>
</html>