<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Page</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
  <div class="container">
    <h1>Welcome to the User Page!</h1>
    
    <%-- Display user information --%>
    <div class="user-details">
      <h2>User Details:</h2>
      <ul>
        <li><strong>Username:</strong> <%= request.getParameter("username") %></li>
      </ul>
    </div>
    
    <%-- Add your additional content here --%>
    
    <%-- Example of logout link --%>
    <p><a href="logout.jsp">Logout</a></p>
  </div>
</body>
</html>
