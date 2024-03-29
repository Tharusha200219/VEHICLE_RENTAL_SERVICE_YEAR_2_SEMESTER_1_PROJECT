<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <title>List of Reviews</title>
	<link rel="stylesheet" type="text/css" href="styles/list.css"/>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles/home.css">
    <style>
          .btn {
            background-color: rgb(193, 246, 201);
            color: rgb(0, 0, 0);
            border: none;
            border-radius: 4px;
            padding: 5px 10px;
            cursor: pointer;
            text-decoration: none;
        }
        .del{
            background-color: rgb(244, 101, 97);
            color: rgb(0, 0, 0);
            border: none;
            border-radius: 4px;
            padding: 5px 10px;
            cursor: pointer;
            text-decoration: none;
        }th {
            background-color: rgb(171, 246, 182);
            color: black;
        }
        h1{
        	text-align:center;
        
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        
        <img alt="logo" class="veh"src="images/rent4u_png.png">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
        
            <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="signup.jsp">Sign up</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Offerdisplayservlet">Offers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="homeView.jsp">vehicles</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ListReviewsServlet">Customer Feedback</a>
                </li>
            </ul>
        </div>
    </nav>
    <br><br><br>
    <h1>Review List</h1><br><br><br>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Rating</th>
            <th>Review</th>
            <th>Actions</th>
        </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td><c:out value="${user.id}" /></td>
                <td><c:out value="${user.name}" /></td>
                <td><c:out value="${user.email}" /></td>
                <td><c:out value="${user.rating}" /></td>
                <td><c:out value="${user.review}" /></td>
                <td>
                    <a class="btn" href="UpdateUserServlet?id=${user.id}">Update</a>
                    <a class="del" href="DeleteUserServlet?id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
