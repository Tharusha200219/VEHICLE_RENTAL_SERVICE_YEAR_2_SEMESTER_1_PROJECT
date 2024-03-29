<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles/home.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .sidebar {
            width: 250px;
            background: #333;
            color: #fff;
            position: fixed;
            height: 100%;
            overflow: auto;
        }
        .sidebar a {
            padding: 10px;
            text-decoration: none;
            color: #fff;
            display: block;
        }
        .sidebar a:hover {
            background-color: #555;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .header {
            background: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        .card {
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 20px;
            margin: 20px;
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
    <div class="sidebar">
        <h2></h2>
        <a href="#"></a>
        <a href="#"></a>
        <a href="PaymentViewServlet">PAYMENT INFO</a>
        <a href="UserListServlet">REVIEW</a>
    </div>
    <div class="content">
        <div class="header">
            <h1>Admin Dashboard</h1>
        </div>
        <div class="card">
            <h2>HOME</h2>
            <a href="index.jsp">
            HOME PAGE RENT4U
            </a>
        </div>
        <div class="card">
            <h2>REVIEW</h2>
            <a href="create.jsp">
            ADD REVIEW PAGE RENT4U
            </a>
        </div>
        <div class="card">
            <h2>PAYMENT INFO</h2>
            <a href="PaymentViewServlet">
            PAYMENT INFO PAGE RENT4U
            </a>
        </div>
        <div class="card">
            <h2>REVIEW INFO</h2>
            <a href="UserListServlet">
            REVIEW INFO PAGE RENT4U
            </a>
        </div>
    </div>
</body>
</html>
