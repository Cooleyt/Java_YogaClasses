<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New</title>
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
<h1>Create a Course</h1>
	<form:form action="/makeCourse/${course.id}" method = "post" modelAttribute = "course">
		<form:hidden path="user" value="${user}"/>
		<p>
			<form:label path="className">Class Name</form:label>
			<form:errors path = "className"/>
			<form:input path = "className"/>
		</p>
		<p>
		<select class="form-input" name = "weekDay">
			<option selected>Day of the Week</option>
		    <option value="Monday">Monday</option>
		    <option value="Tuesday">Tuesday</option>
		    <option value="Wednesday">Wednesday</option>
		    <option value="Thursday">Thursday</option>
		    <option value="Friday">Friday</option>
		    <option value="Saturday">Saturday</option>
		    <option value="Sunday">Sunday</option>
		</select>
			<form:errors path = "weekDay"/>
			
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
			<a href="http://localhost:8080/dashboard">Back to Class Schedule</a>
	
	</form:form>
</body>
</div>
</html>