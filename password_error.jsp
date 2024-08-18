<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        
        h1 {
            color: #333333;
            text-align: center;
            margin-top: 50px;
        }
        
        p {
            color: #666666;
            text-align: center;
        }
        
        a {
            color: #333333;
            text-decoration: none;
        }
        
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 100px;
        }
        
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #333333;
            color: #ffffff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        
        .btn:hover {
            background-color: #555555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Password Error</h1>
        <p>The passwords you entered do not match. Please try again.</p>
        <p><a href="register.html" class="btn">Go back to registration page</a></p>
    </div>
</body>
</html>

