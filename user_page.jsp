<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Page</title>
  <link rel="stylesheet" type="text/css" href="styles1.css">
  <style>
    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
      width: 100%;
    }
    
    .container {
      position: relative;
      text-align: center;
      color: #ffffff;
      height: 100%;
      width: 100%;
      background-image: url("https://livingonthecheap.com/lotc-cms/wp-content/uploads/2016/07/hotel-room-vacation-travel-e1469647208388.jpg");
      background-repeat: no-repeat;
      background-size: cover;
      font-family: Arial, sans-serif;
    }
    
    .message-right ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      overflow: hidden;
      background-color: rgba(0, 0, 0, 0.5);
    }
    
    .message-right li {
      float: left;
    }
    
    .message-right li a {
      display: block;
      color: #ffffff;
      text-align: center;
      padding: 20px;
      text-decoration: none;
      font-size: 18px;
    }
    
    .message-right li a:hover {
      background-color: #4CAF50;
    }
    
    h1 {
      background-color: white;
      margin-top: 20px;
      color: #0B81E3;
      font-size: 36px;
    }
    
    .user-details {
      margin-top: 50px;
    }
      p a {
    background-color: black; /* Set your desired background color */
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    color: #333; /* Set your desired text color */
  }

    .user-details h2 {
      color: #ffffff;
      font-size: 24px;
    }
    
    .user-details ul {
      list-style-type: none;
      padding: 0;
      margin-top: 20px;
    }
    
    .user-details li {
      color: #ffffff;
      font-size: 18px;
      margin-bottom: 10px;
    }
    
    p {
      margin-top: 30px;
    }
    
    p a {
      color: #ffffff;
      font-size: 18px;
      text-decoration: none;
    }
    
    p a:hover {
      text-decoration: underline;
    }
    .user-details {
    margin-top: 50px;
    background-color:black; /* Set your desired background color and opacity */
    padding: 20px;
    border-radius: 10px;
  }
  </style>
</head>
<body>
  <div class="container">
    <div class="message-right">
      <ul>
        <li><a href="HOME.html"><i>Home</i></a></li>
        <li><a href="Rooms.html"><i>ROOMS</i></a></li>
        <li><a href="dining.html"><i>Dining</i></a></li>
        <!--<li><a href="events.html"><i>Events</i></a></li>-->
        <li><a href="about-us.html"><i>About Us</i></a></li>
      </ul>
    </div>
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
