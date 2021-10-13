<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>   
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
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
<h1>Welcome, ${user.name}.</h1>
<h4>Class Schedule</h4>
<a href="/newCourse">Create a New Course!</a>
<a href="/logout">Logout</a>
	<table class="table table-light table-striped table-hover table-bordered">
		<thead>
			<tr>
				<th class="align-middle">Name</th>
				<th class="align-middle">Instructor</th>
				<th class="align-middle" scope="col">Day of the Week</th>
				<th class="align-middle" scope="col">Price</th>
				<th class="align-middle" scope="col">Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${allCourses}">
				<tr class = "table-secondary">
					<td><a href="/oneCourse/${i.id}">
						<c:out value="${i.className}"></c:out></a>
					</td>
					<td>
						<c:out value="${i.user.name}"></c:out>
					</td>
					<td>	
						<c:out value="${i.weekDay}"></c:out>
					</td>
					<td>	
						$<c:out value="${i.price}"></c:out>
					</td>
					
					<td>
					<c:choose>
						<c:when test="${i.user.id == user.id}">
							<a href = "/editCourse/${i.id}">Edit</a>
							<a href = "/destroy/${i.id}">Delete</a>
						</c:when>
						<c:otherwise>
								<p style="color:red;">Nameste away from this course</p>
						</c:otherwise>
					</c:choose>
					</td>	
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>