<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Rental System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles/home.css">
</head>
<body>
    <!-- Navigation Bar rent4u-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        
        <img alt="logo" class="veh"src="images/rent.png">
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

    <!-- Hero Section rent4u-->
    <header class="bt">
        <div class="container1"><br>
            <h1 class="display-4">Rent a Vehicle</h1>
            <p class="lead">The Best Place To Book A Vehicle For Your Next Journey</p>
           
        </div>
    </header>

    <!-- Vehicle Listings rent4u-->
    <section class="vehicle-listings py-5">
        <div class="container">
            <h2 class="text-center mb-4">Featured Vehicles</h2>
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card">
                        <img src="images/car.png" class="card-img-top" alt="Vehicle 1">
                        <div class="card-body">
                            <h5 class="card-title">Car</h5>
                            <p class="card-text">RS:8000/day</p>
                            <a href="payment_insert.jsp" class="btn btn-primary">Book Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card">
                        <img src="images/bus.png" class="card-img-top" alt="Vehicle 2">
                        <div class="card-body">
                            <h5 class="card-title">Bus</h5>
                            <p class="card-text">RS:20,000/day</p>
                            <a href="payment_insert.jsp" class="btn btn-primary">Book Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card">
                        <img src="images/bike.png" class="card-img-top" alt="Vehicle 3">
                        <div class="card-body">
                            <h5 class="card-title">Bike</h5>
                            <p class="card-text">RS:3000/day</p>
                            <a href="payment_insert.jsp" class="btn btn-primary">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer rent4u -->
    <footer class="bg-dark text-white text-center py-3">
        <div class="container">
        	<p>With more than 20 years of experience, Rent4U has honed its expertise in the vehicle rental industry. Our longevity is a testament to our commitment to customer satisfaction and our ability to adapt to changing market dynamics. Over the years, we have gained valuable insights into the needs and preferences of our customers, allowing us to continually improve our services.

Why Rent4U:

Reliability: Our 20+ years of experience speaks to our reliability and commitment to customer satisfaction. You can trust us to provide safe and dependable vehicles for your journeys.

Variety: With a wide selection of vehicles, we cater to a diverse range of customers and purposes, ensuring that you find the right vehicle for your needs.

Quality: We take pride in maintaining our vehicles to the highest standards, ensuring they are clean, well-maintained, and equipped with modern features.

Convenience: Our online platform makes it easy to browse, book, and manage your rentals from the comfort of your home or office, saving you time and hassle.

Customer Service: Our dedicated customer support team is available to assist you at every step of your rental journey, ensuring a smooth and pleasant experience.</p>
           <a href="Policy1.jsp">Our Policies</a>
            <p>Copyright 2023 Rent4U.com</p>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
