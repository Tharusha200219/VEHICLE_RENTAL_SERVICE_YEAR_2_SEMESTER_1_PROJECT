<%@page import="java.util.List"%>
<%@page import="com.letslearn.DBcon.DbCon"%>
<%@page import="com.letslearn.Dao.*"%>
<%@page import="java.util.*"%>
<%@page import="com.letslearn.Modal.*"%>
<%@ page import="com.letslearn.Interface.*"%>
<!DOCTYPE html>
<html lang="en">

<%
PackagesDao packagesDao = new PackagesDao(DbCon.getConnection());
List<Packages> packagess = packagesDao.getAllPackagess();

RoleImplementation roleImpl = new RoleImplementation();
roleImpl.displayRole();

Admin authin = (Admin) request.getSession().getAttribute("auth");
if (authin != null) {
	//System.out.println("gmmac");
} else {
	response.sendRedirect("auth-login.jsp");
}
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">

<link rel="stylesheet" href="assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">

<link rel="stylesheet"
	href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="shortcut icon" href="assets/images/favicon.svg"
	type="image/x-icon">
</head>

<body>
	<div id="app">
		<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">
				<div class="sidebar-header px-0 pb-0">
					<div class="d-flex justify-content-between">
						<div>
							<img src="assets/images/logo/logo.png" class="h-100 w-100"
								alt="Logo" srcset="">
						</div>
						<div class="toggler">
							<a href="#" class="sidebar-hide d-xl-none d-block"><i
								class="bi bi-x bi-middle"></i></a>
						</div>
					</div>
				</div>
				<div class="sidebar-menu">
					<ul class="menu px-3">
						<li class="sidebar-title">Admin Dashboard</li>

						<li class="sidebar-item active "><a
							href="packagesManagement.jsp" class='sidebar-link'> <i
								class="bi bi-grid-fill"></i> <span>Packages Management</span>
						</a></li>
						<li class="sidebar-item  "><a href="LogoutServlet"
							class='sidebar-link'> <i class="bi bi-life-preserver"></i> <span>Logout</span>
						</a></li>
					</ul>
				</div>
				<button class="sidebar-toggler btn x">
					<i data-feather="x"></i>
				</button>
			</div>
		</div>
		<div id="main">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
			</header>

			<div class="page-heading">
				<h3>Packages Management</h3>
			</div>
			<section class="section">
				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<h4>Packages List</h4>
						<div>
							<button class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#staticBackdrop">Add Packages</button>
						</div>
					</div>
					<div class="card-body">
						<table class="table table-hover" id="table1">
							<thead>
								<tr>
									<th>Name</th>
									<th>Email</th>
									<th>Phone</th>
									<th>Package</th>
									<th>Price</th>
									<th>Type</th>
									<th>Discount</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (Packages packages : packagess) {
								%>
								<tr>
									<td><%=packages.getName()%></td>
									<td><%=packages.getEmail()%></td>
									<td><%=packages.getTel()%></td>
									<td><%=packages.getPackageName()%></td>
									<td>Rs <%=packages.getPrice()%>.00</td>
									<td><%=packages.getPackType()%></td>
									<td>Rs <%=packages.getDiscount()%>.00</td>
									<td><a
										href="PackagesServlet?action=delete&id=<%=packages.getId()%>"><span
											class="badge bg-danger py-2" style="cursor: pointer;">Delete</span>
									</a> <a href="#" class="edit-link" data-bs-toggle="modal"
										data-bs-target="#updateStaticBackdrop"
										data-packages-name="<%=packages.getName()%>"
										data-packages-id="<%=packages.getId()%>"
										data-packages-email="<%=packages.getEmail()%>"
										data-packages-packageName="<%=packages.getPackageName()%>"
										data-packages-price="<%=packages.getPrice()%>"
										data-packages-discount="<%=packages.getDiscount()%>"
										data-packages-packType="<%=packages.getPackType()%>"
										data-packages-tel="<%=packages.getTel()%>"> <span
											class="badge bg-warning py-2" style="cursor: pointer;">Edit</span>
									</a>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</section>
			<!-- update Modal -->
			<div class="modal fade" id="updateStaticBackdrop"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="updateStaticBackdrops">Edit
								Packages</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form class="row g-3 needs-validation" action="PackagesServlet"
								method="POST">
								<input type="hidden" value="update" name="action" />
								<div class="row">
									<div class="col-md-12 position-relative">
										<label for="validationTooltip01" class="form-label">Name</label>
										<input type="text" id="packagesName" class="form-control"
											name="fname" required>

									</div>

									<div class="col-md-6 position-relative d-none">
										<label for="validationTooltipUsername" class="form-label">Email</label>
										<div class="input-group has-validation">
											<input type="email" id="packagesEmail02" name="email"
												title="Enter Email">
										</div>
									</div>
									<div class="col-md-6 position-relative d-none">
										<label for="validationTooltipUsername" class="form-label">Id</label>
										<div class="input-group has-validation">
											<input type="text" id="packagesId" name="id"
												title="Enter id">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 position-relative">
										<label for="validationTooltip03" class="form-label">PackageName</label>
										<input type="text" id="packagesPackageName"
											class="form-control" name="packageName"
											title="Enter PackageName" required>

									</div>
									<div class="col-md-6 position-relative">
										<label for="validationTooltip05" class="form-label">Price</label>
										<input pattern="^\{2,12}$" id="packagesPrice" maxlength="12"
											name="price" type="text" class="form-control" title="Enter Price For 2-12 Whole Numbers"
											required>
									</div>
									<div class="col-md-6 position-relative">
										<label for="validationTooltip05" class="form-label">Discount</label>
										<input pattern="^\d{2,12}" id="packagesDiscount" maxlength="12"
											name="discount" type="text" class="form-control" title="Enter discount For 2-12 Whole Numbers"
											required>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 position-relative">
										<label for="validationTooltip04" class="form-label">PackType</label>
										<select class="form-select" name="packType" required>
											<option value="standard">Standard</option>
											<option value="normal">Normal</option>
											<option value="premium">Premium</option>
										</select>
										<div class="invalid-tooltip">Please select a valid
											PackType.</div>
									</div>
									<div class="col-md-6 position-relative">
										<label for="validationTooltip06" class="form-label">Telephone</label>
										<input type="text" class="form-control" id="packagesTel"
											title="Enter Phone number" name="tel" required
											pattern="^\d{10}$" maxlength="10">

									</div>
								</div>


								<div class="mt-3 d-flex justify-content-end">
									<button type="button" class="btn btn-secondary mx-3"
										data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>


			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">Add New
								Packages</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form class="row g-3 needs-validation" action="PackagesServlet"
								method="POST">
								<input type="hidden" value="addPackages" name="action" />

								<div class="col-md-6 position-relative">
									<label for="validationTooltip01" class="form-label">Name</label>
									<input type="text" class="form-control" placholder="Mark"
										name="fname" required>

								</div>

								<div class="col-md-6 position-relative">
									<label for="validationTooltipUsername" class="form-label">Email</label>
									<div class="input-group has-validation">
										<input type="email" class="form-control" name="email"
											title="Enter Email" required>

									</div>
								</div>
								<div class="col-md-6 position-relative">
									<label for="validationTooltip03" class="form-label">PackageName</label>
									<input type="text" name="packageName" class="form-control"
										title="Enter PackageName" required>

								</div>
								<div class="col-md-6 position-relative">
									<label for="validationTooltip05" class="form-label">Price</label>
									<input type="text" name="price" maxlength="12"
										class="form-control" title="Enter Price For 2-12 Whole Numbers" required
										pattern="^\{2,12}$">

								</div>
									<div class="col-md-6 position-relative">
									<label for="validationTooltip05" class="form-label">Discount</label>
									<input type="text" name="discount" maxlength="12"
										class="form-control" title="Enter Discount For 2-12 Whole Numbers" required
										pattern="^\d{2,12}$">

								</div>

								<div class="col-md-6 position-relative">
									<label for="validationTooltip04" class="form-label">PackType</label>
									<select class="form-select" name="packType" required>
										<option value="standard">Standard</option>
										<option value="normal">Normal</option>
										<option value="premium">Premium</option>
									</select>
									<div class="invalid-tooltip">Please select a valid
										PackType.</div>
								</div>


								<div class="col-md-6 position-relative">
									<label for="validationTooltip06" class="form-label">Telephone</label>
									<input type="text" class="form-control" name="tel"
										title="Enter Phone number" required pattern="^\d{10}$"
										maxlength="10">

								</div>

								<div class="d-flex justify-content-end">
									<button type="button" class="btn btn-secondary mx-3"
										data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<footer>
				<div class="footer clearfix mb-0 text-muted">
					<div class="float-start">
						<p>2023 &copy; OOP</p>
					</div>
					<div class="float-end">
						<p>
							Crafted with <span class="text-danger"><i
								class="bi bi-heart"></i></span> For <a href="#">OOP Module</a>
						</p>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendors/simple-datatables/simple-datatables.js"></script>

	<script>
		// Simple Datatable
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
	</script>

	<script src="assets/js/main.js"></script>
	<script>
    // JavaScript to update modal content when "Edit" link is clicked
    document.querySelectorAll('.edit-link').forEach(link => {
        link.addEventListener('click', function () {
            const modal = document.getElementById('updateStaticBackdrop');
            const packagesName = link.getAttribute('data-packages-name');
            const packagesEmail = link.getAttribute('data-packages-email');
            const packagesPackageName = link.getAttribute('data-packages-packageName');
            const packagesPrice = link.getAttribute('data-packages-price');
            const packagesDiscount = link.getAttribute('data-packages-discount');
            const packagesPackType = link.getAttribute('data-packages-packType');
            const packagesTel = link.getAttribute('data-packages-tel');
            const packagesId = link.getAttribute('data-packages-id');
            
            
            // Update modal content with packages details
            document.getElementById('packagesName').value = packagesName;
            document.getElementById('packagesTel').value = packagesTel;
            document.getElementById('packagesPrice').value = packagesPrice;
            document.getElementById('packagesDiscount').value = packagesDiscount;
            document.getElementById('packagesPackageName').value = packagesPackageName;
            document.getElementById('packagesEmail02').value = packagesEmail;
            document.getElementById('packagesId').value = packagesId;
            // Update other input fields with packages details
        });
    });
</script>
</body>

</html>