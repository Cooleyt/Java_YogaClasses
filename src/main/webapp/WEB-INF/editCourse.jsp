<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>   
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
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
<h1>Edit ${course.className}</h1>

<form:form action="/editingCourse/${course.id}" method = "post" modelAttribute = "course">
		<input type="hidden" name="_method" value="put">
		<form:hidden path="user" value="${user}"/>
		<p>
			<form:label path="className">Class Name</form:label>
			<form:errors path = "className"/>
			<form:input path = "className"/>
		</p>
				<p>
			<form:label path="weekDay">Day of the Week</form:label>
			<form:errors path = "weekDay"/>
			<form:input path = "weekDay"/>
		</p>
		<p>
			<form:label path="price">Price</form:label>
			<form:errors path = "price"/>
			<form:input type="number" path = "price"/>
		</p>
		<p>
			<form:label path="description">Description</form:label>
			<form:errors path = "description"/>
			<form:input path = "description"/>
		</p>
		
		<input type="submit" value = "Submit">
			<a href = "/destroy/${i.id}">Delete</a>
			<a href="http://localhost:8080/dashboard">Back to Class Schedule</a>
	
	</form:form>
</body>
</div>
</html>