<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Review</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 300px;
            margin: 0 auto;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        select {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Update Review</h1>
    <form action="UpdateUserServlet" method="post">
        <input type="hidden" name="id" value="${user.id}">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${user.name}" required><br><br>
        
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="${user.email}" required><br><br>
        
        <label for="rating">Rating:</label>
        <select id="rating" name="rating">
            <option value="1" ${user.rating == 1 ? 'selected' : ''}>1</option>
            <option value="2" ${user.rating == 2 ? 'selected' : ''}>2</option>
            <option value="3" ${user.rating == 3 ? 'selected' : ''}>3</option>
            <option value="4" ${user.rating == 4 ? 'selected' : ''}>4</option>
            <option value="5" ${user.rating == 5 ? 'selected' : ''}>5</option>
        </select><br><br>
        
        <label for="review">Review:</label>
        <textarea id="review" name="review" required>${user.review}</textarea><br><br>
        
        <input type="submit" value="Update Review">
    </form>
</body>
</html>
