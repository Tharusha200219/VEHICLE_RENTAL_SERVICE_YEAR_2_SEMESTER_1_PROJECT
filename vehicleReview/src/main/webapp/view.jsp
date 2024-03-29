<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>List of Reviews</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="styles/view_review.css">
    <link rel="stylesheet" href="styles/home.css">
    <style>
		  body {
            background-image: url('images/show_review_bc.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #fff;
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
    <div class="container">
        <h1 class="header1">Reviews</h1>
                    <a href="create.jsp"><button type="button" id="B3" class="btn">ADD REVIEW</button></a>
                    <a href="index.jsp"><button type="button" id="B3" class="btn">HOME</button></a>
        <div class="header3">

        </div>

        <c:forEach items="${users}" var="user">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">${user.name}</h5>
                    <p class="card-subtitle mb-2 text-muted">Rating: ${user.rating}</p>
                    <p class="card-text">${user.review}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
