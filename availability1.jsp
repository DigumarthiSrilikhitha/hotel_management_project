<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Confirmation</title>
    <!-- Add any necessary CSS or JavaScript files here -->
    <script>
        // JavaScript redirect to the payment page
        window.location.href = "pay.html";
    </script>
</head>
<body>
    <h2>Reservation Confirmation</h2>
    <p>Thank you for your reservation. Please review the details below:</p>

    <ul>
        <li><strong>Name:</strong> <%= request.getParameter("name") %></li>
        <li><strong>Email:</strong> <%= request.getParameter("email") %></li>
        <li><strong>Phone Number:</strong> <%= request.getParameter("phone") %></li>
        <li><strong>Special Requests:</strong> <%= request.getParameter("special-requests") %></li>
        <li><strong>Check-in Date:</strong> <%= checkinDate %></li>
        <li><strong>Check-out Date:</strong> <%= checkoutDate %></li>
        <!-- Include any other reservation details here -->
    </ul>

    <p>Your reservation is confirmed. We look forward to welcoming you!</p>
</body>
</html>
