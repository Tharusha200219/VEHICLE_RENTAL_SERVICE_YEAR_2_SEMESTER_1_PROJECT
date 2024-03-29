<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Review</title>
    <link rel="stylesheet" type="text/css" href="styles/addreview(create).css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles/home.css">
    <style>
        .main {
            background: url(images/bc.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
        
        .av {
            background-color: beige;
        }
        .box {
            margin-top: 10px;
            width: 800px;
            height: 700px;
            background-color: rgb(0, 0, 0);
            margin-left: 321px;
            background: transparent;
            background-color: rgba(0, 0, 0, 0.4);
            box-shadow: 5px 1px 30px rgb(0, 0, 0);
            border: 1px solid rgb(255, 255, 255);
            border-radius: 20px;
        }
        .re1 {
            font-family: Arial, Helvetica, sans-serif;
            margin-top: 4px;
            font-size: 50px;
            margin-left: 590px;
            color: rgb(255, 255, 255);
        }
        .re13 {
            width: 700px;
            height: 20px;
            margin-left: 40px;
            font-size: 30px;
            
            color: rgb(254, 254, 254);
        }
        .re130{
			font-size: 20px;
			width: 700px;
            height: 30px;
            margin-left: 40px;
            border-radius: 9px;
            
		}
        .re130:hover {
            transform: scale(1.03);
            transition: 0.2s;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 15px;
            
            color: #000000;
        }

        .re11 {
            font-family: Arial, Helvetica, sans-serif;
            margin-top: 40px;
            font-size: 20px;
            margin-left: 80px;
            width: 600px;
            height: 200px;
            
            background-color: rgba(255, 255, 255, 0.4);
            box-shadow: 3px 1px 20px rgb(0, 0, 0);
            color: rgb(255, 255, 255);
            border-radius: 9px;

        }
        .re11:hover {
            transform: scale(1.03);
            transition: 0.2s;
            font-size: 24px;
            background-color: white;
            color: #000000;
        }
        .re12 {
            font-family: Arial, Helvetica, sans-serif;
            margin-top: 40px;
            font-size: 30px;
            margin-left: 270px;
            width: 240px;
            height: 50px;
            border-radius: 10px;
            border: solid white;
            background-color: rgb(255, 255, 255);
            cursor: pointer;
        }
        .re12:hover {
            background-color: rgb(192, 248, 208);
            transition: 0.7s;
            transform: scale(1.03);
            border: solid rgb(180, 249, 191);
        }
    </style>
</head>
<body class="main">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <img alt="logo" class="veh" src="images/rent4u_png.png">
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
    <h1 class="re1">Add Review</h1>
    <form action="CreateuserServlet" method="post" class="box" onsubmit="return validateForm()">
        <label for="name" class="re13">Name:</label>
        <input type="text" id="name" name="name" maxlength="30" required class="re130"><br><br>

        <label for="email" class="re13">Email:</label>
        <input type="email" id="email" name="email" required class="re130"><br><br>

        <label for="rating" class="re13">Rating:</label><br><br>
        <select id="rating" name="rating" class="re130">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select><br><br>

        <label for="review" class="re13">Review:</label>
        <textarea id="review" name="review" required class="re11"></textarea><br><br>

        <input type="submit" value="Submit Review" class="re12">
    </form>
    <a href="index.jsp"><button type="button" id="B3">HOME</button></a>

    <script>
        function validateForm() {
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var review = document.getElementById("review").value;

            if (name.trim() === "" || email.trim() === "" || review.trim() === "") {
                alert("Name, Email, and Review are required fields.");
                return false;
            }

            if (!validateEmail(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            return true;
        }

        function validateEmail(email) {
           
            var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return email.match(emailRegex);
        }
    </script>
</body>
</html>
