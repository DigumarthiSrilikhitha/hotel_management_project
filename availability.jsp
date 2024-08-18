<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hotel Booking</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        h1 {
            text-align: center;
        }

        .room {
            display: inline-block;
            width: 25%;
            text-align: center;
            margin: 20px;
            border: 1px solid black;
            border-radius: 5px;
            padding: 20px;
            box-sizing: border-box;
        }

        img {
            width: 100%;
            max-height: 200px;
            object-fit: cover;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        h2 {
            margin-top: 0;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0062cc;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <h1>Book Your Stay</h1>

    <%
        // Create a connection to the database
        String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
         String dbUsername = "system";
         String dbPassword = "carrot";

        Connection connection = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Check if the connection is successful
        if (connection != null) {
            System.out.println("Connected to the database!");
        } else {
            System.out.println("Failed to connect to the database.");
        }

        // Retrieve the check-in and check-out dates
        String checkinDate = request.getParameter("checkin-date");
        String checkoutDate = request.getParameter("checkout-date");

        // Perform availability check or any other processing based on the dates
        boolean isAvailable = false;

        try {
            // Prepare the SQL statement
            String query = "SELECT COUNT(*) FROM rooms WHERE availability = 1 AND checkin_date <= ? AND checkout_date >= ?";

            PreparedStatement statement = connection.prepareStatement(query);

            // Bind the check-in and check-out dates to the parameters
            statement.setDate(1, java.sql.Date.valueOf(checkinDate));
            statement.setDate(2, java.sql.Date.valueOf(checkoutDate));

            // Execute the query
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int availableRooms = resultSet.getInt(1);
                if (availableRooms > 0) {
                    isAvailable = true;
                }
            }

            // Close the result set, statement, and connection
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>

    <div class="room">
        <img src="https://images.unsplash.com/photo-1631049307264-da0ec9d70304?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG90ZWwlMjBib29raW5nfGVufDB8fDB8fA%3D%3D&w=1000&q=80" alt="Room 1">
        <h2>Room 1</h2>
        <p>Price: $100 per night</p>
        <% if (isAvailable) { %>
            <p>Status: Available</p>
            <button><a href="reservation.html">Book Now</a></button>
        <% } else { %>
            <p>Status: Not Available</p>
        <% } %>
    </div>

    <div class="room">
        <img src="https://images.unsplash.com/photo-1631049307264-da0ec9d70304?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG90ZWwlMjBib29raW5nfGVufDB8fDB8fA%3D%3D&w=1000&q=80" alt="Room 2">
        <h2>Room 2</h2>
        <p>Price: $120 per night</p>
        <% if (isAvailable) { %>
            <p>Status: Available</p>
            <button><a href="reservation.html">Book Now</a></button>
        <% } else { %>
            <p>Status: Not Available</p>
        <% } %>
    </div>
    
    <div class="room">
        <img src="https://images.unsplash.com/photo-1631049307264-da0ec9d70304?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG90ZWwlMjBib29raW5nfGVufDB8fDB8fA%3D%3D&w=1000&q=80" alt="Room 3">
        <h2>Room 3</h2>
        <p>Price: $150 per night</p>
        <% if (isAvailable) { %>
            <p>Status: Available</p>
            <button><a href="reservation.html">Book Now</a></button>
        <% } else { %>
            <p>Status: Not Available</p>
        <% } %>
    </div>
    
    <!-- Add more rooms as needed -->

</body>
</html>
