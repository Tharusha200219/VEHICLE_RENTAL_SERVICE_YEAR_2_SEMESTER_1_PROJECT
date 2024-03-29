<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Review</title>
	<link rel="stylesheet" type="text/css" href="styles/delete_vehicle.css" />
	<style>		
	body {
		    background-image: url('images/delete_bc.jpg');
		    background-size: cover;
		    background-repeat: no-repeat;
		    background-attachment: fixed;
		    color: #fff;
		}
	</style>
</head>
<body>
    
    <div class="blur-background">
        <div class="confirmation-container">
            <h1>Delete Review</h1>
            <form action="DeleteUserServlet" method="post">
                <input type="hidden" name="id" value="${user.id}">
                <p>Are you sure you want to delete this review?</p>
                <input type="submit" value="Delete">
            </form>
        </div>
    </div>
</body>
</html>
