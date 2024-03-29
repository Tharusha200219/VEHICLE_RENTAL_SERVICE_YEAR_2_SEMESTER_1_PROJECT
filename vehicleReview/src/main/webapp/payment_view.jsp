<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
    <title>Payment View</title>
  <link rel="stylesheet" href="styles/payment_view.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles/home.css">
    <style>
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
    <br>
    <h1>Payment View</h1><br>
    <div class="container">
        <table>
            <tr>
                <th>Payment ID</th>
                <th>Card Holder Name</th>
                <th>Credit Card Number</th>
                <th>Expiry Date</th>
                <th>CVV</th>
                <th>With Driver</th>
                
                <th>Car Model Number</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${payments}" var="payment">
                <tr>
                    <td>${payment.paymentId}</td>
                    <td>${payment.cardHolderName}</td>
                    <td>${payment.creditCardNumber}</td>
                    <td>${payment.expiryDate}</td>
                    <td>${payment.cvv}</td>
                    <td>${payment.withDriver ? 'Yes' : 'No'}</td>
                    
                    <td>${payment.carModelNumber}</td>
                    <td class="button-container">
                        <a href="PaymentUpdateServlet?paymentId=${payment.paymentId}" class="button">Update</a>
                        <form action="PaymentDeleteServlet" method="post" style="display: inline;">
                            <input type="hidden" name="paymentId" value="${payment.paymentId}">
                            <input type="submit" class="button button-delete" value="Delete">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
