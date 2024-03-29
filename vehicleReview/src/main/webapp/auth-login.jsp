
<%
if (session.getAttribute("auth") != null) {
	response.sendRedirect("sellerManagement.jsp");
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Study Sri Lanka</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet"
	href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" href="assets/css/pages/auth.css">
</head>

<body>
	
	<div id="auth">

		<div class="row h-100">
			<div class="col-lg-5 col-12">
				<div id="auth-left" class="p-5 pt-0">
					<div class="auth-logo mb-5 mt-5">
						<img src="assets/images/logo/logo.png" class="w-100 h-100"
							alt="Logo">
					</div>

					<form action="LoginServlet" method="POST">
						<div class="form-group position-relative has-icon-left mb-4">
							<input type="email" name="email"
								class="form-control form-control-xl" title="Enter Email"
								required placeholder="Username or Email">
							<div class="form-control-icon">
								<i class="bi bi-person"></i>
							</div>
						</div>
						<div class="form-group position-relative has-icon-left mb-4">
							<input name="password" type="password" required
								title="Enter Password" class="form-control form-control-xl"
								placeholder="Password">
							<div class="form-control-icon">
								<i class="bi bi-shield-lock"></i>
							</div>
						</div>
						<div class="form-check form-check-lg d-flex align-items-end">
							<input class="form-check-input me-2" type="checkbox" value=""
								id="flexCheckDefault"> <label
								class="form-check-label text-gray-600" for="flexCheckDefault">
								Keep me logged in </label>
						</div>
						<button type="submit"
							class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Log
							in</button>
					</form>
				</div>
			</div>
			<div class="col-lg-7 d-none d-lg-block">
				<div id="auth-right"
					style="background-image: url('./assets/images/bannerMain.jpg'); background-repeat: no-repeat; background-size: cover;">

				</div>
			</div>
		</div>

	</div>
	<%
	if (request.getAttribute("status") == "error") {
	%>
	<script>
		alert("Error sudda");
	</script>
	<%
	}
	%>
</body>
	
</html>