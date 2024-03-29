<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Payment</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    
    <style>   
     .main {
          background: url(images/pay.jpg) no-repeat center center fixed; 
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
        }
    .in{
        font-family:Arial, Helvetica, sans-serif ;
        display: flex;
        justify-content: center;
        align-items: center; 
        height: 10vh;
        font-weight: 900;
    }
    .veh{
    width: 100px;
    height: 90px;
    position: absolute;
    }
    .bt{
    color: black;
    }
    .container1{
    background-color: rgb(0, 250, 146);
    height: 200px;
    text-align: center;
    font-weight: bold;
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
    }
    </style>
</head>
<body class="main">

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <img alt="logo" class="veh" src="images/rent.png">
        
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
    <br><br>
    <h1 class="in">Payment</h1>
    <div class="container mt-5">
        
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form action="PaymentInsertServlet" method="post" class="rounded p-3 shadow-sm bg-light" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="cardHolderName">Card Holder Name:</label>
                        <input type="text" class="form-control" id="cardHolderName" name="cardHolderName" placeholder="Tharusha Rashmika Sandakelum" required>
                    </div>
                    <div class="form-group">
                        <label for="creditCardNumber">Credit Card Number:</label>
                        <input type="tel" class="form-control" id="creditCardNumber" name="creditCardNumber" inputmode="numeric" pattern="\d*" autocomplete="cc-number" maxlength="16" placeholder="xxxx xxxx xxxx xxxx" required>
                        
                        
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="expiryDate">Expiry Date:</label>
                            <input type="text" class="form-control" id="expiryDate" name="expiryDate" maxlength="5" placeholder="01/25"required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="vcc">CVV:</label>
                            <input type="text" class="form-control" id="cvv" name="cvv" maxlength="3" placeholder="xxx" required>
                        </div>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="withDriver" name="withDriver">
                        <label class="form-check-label" for="withDriver">With Driver</label>
                    </div>
                    <div class="form-group mt-3">
                        <label for="carModelNumber">Car Model Number:</label>
                        <input type="text" class="form-control" id="carModelNumber" name="carModelNumber" required>
                    </div>
                    <button type="submit" class="btn btn-primary mt-3">Insert Payment</button>
                </form>
            </div>
        </div>
    </div>
    <script>
        function validateForm() {
            var cardHolderName = document.getElementById("cardHolderName").value;
            var creditCardNumber = document.getElementById("creditCardNumber").value;
            var expiryDate = document.getElementById("expiryDate").value;
            var cvv = document.getElementById("cvv").value;
            var carModelNumber = document.getElementById("carModelNumber").value;

            if (cardHolderName === "") {
                alert("Card Holder Name is required");
                return false;
            }

            if (creditCardNumber === "" || !/^\d{16}$/.test(creditCardNumber)) {
                alert("Please enter a valid 16-digit Credit Card Number");
                return false;
            }

            if (expiryDate === "" || !/^\d{2}\/\d{2}$/.test(expiryDate)) {
                alert("Please enter a valid Expiry Date in MM/YY format");
                return false;
            }

            if (cvv === "" || !/^\d{3}$/.test(cvv)) {
                alert("Please enter a valid 3-digit CVV");
                return false;
            }

            if (carModelNumber === "") {
                alert("Car Model Number is required");
                return false;
            }

            return true;
        }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
