<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Logout</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <script src="script.js"></script>
  <style>
  	/* styles.css */
.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

h1 {
  color: #333;
  font-size: 24px;
}

p {
  margin-bottom: 10px;
}

a {
  color: #007bff;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}
     p a {
    background-color: black; /* Set your desired background color */
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    color: #333; /* Set your desired text color */
  }
  </style>
</head>
<body>
  <div class="container">
    <h1>Logout</h1>
    
    <%-- Invalidate the session to logout the user --%>
    <% session.invalidate(); %>
    
    <p>You have been successfully logged out.</p>
    
    <%-- Add your additional content here --%>
    
    <%-- Example of login link --%>
    <p><a href="login.html">Login</a></p>
  </div>
</body>
</html>
