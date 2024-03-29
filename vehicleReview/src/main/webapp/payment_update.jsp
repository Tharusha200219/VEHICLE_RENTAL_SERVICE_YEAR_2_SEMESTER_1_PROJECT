<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Payment</title>
	<link rel="stylesheet" href="styles/payment_update.css">
	<style>
		 body {
          background: url(images/addd.jpg) no-repeat center center fixed; 
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
        }
        h1{
        color:white;
        }
        .container {
            width: 1000px;
            height: 500px;
            margin: 20px auto;
            background-color: rgb(151, 166, 158);
            
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
	</style>
</head>
<body>
<div class="main">
    <h1>Update Payment</h1>
    
    <div class="container">
        <form action="PaymentUpdateServlet" method="post"><br><br>

            <input type="hidden" name="paymentId" value="${payment.paymentId}">
        Card Holder Name: <input type="text" class="bl" name="cardHolderName" value="${payment.cardHolderName}" required><br>
        Credit Card Number: <input type="text" class="bl" name="creditCardNumber" maxlength="16" value="${payment.creditCardNumber}" required><br>
        Expiry Date: <input type="text" class="bl" name="expiryDate" value="${payment.expiryDate}" required><br>
        CVV:<br> <input type="text" class="bl" maxlength="3" name="cvv" value="${payment.cvv}" required><br><br>
        
        <label for="withDriver">With Driver:</label>
        <input type="checkbox" name="withDriver" id="withDriver" ${payment.withDriver ? 'checked' : ''}><br><br><br>
        Car Model Number: <input class="bl" type="text" name="carModelNumber" value="${payment.carModelNumber}" required><br>
        <input type="submit" value="Update Payment">
        </form>
    </div>
    </div>
</body>
</html>
