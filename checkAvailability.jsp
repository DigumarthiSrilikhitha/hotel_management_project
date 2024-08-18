<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Check Availability</title>
    <!-- Add your CSS styles here -->
    <style>
        /* Add your custom styles here */
    </style>
</head>
<body>
    <h1>Available Rooms</h1>

    <%
        // Retrieve the check-in, check-out dates, and number of guests from the form
        String checkinDate = request.getParameter("checkin-date");
        String checkoutDate = request.getParameter("checkout-date");
        int numGuests = Integer.parseInt(request.getParameter("num-guests"));

        // Create a connection to the database
        String jdbcURL = "jdbc:oracle:thin:@localhost:1521:XE";
        String jdbcUsername = "system";
        String jdbcPassword = "carrot";

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

        // Perform availability check based on the dates and number of guests
        // Note: You need to modify this SQL query based on your database schema
        String query = "SELECT * FROM rooms WHERE availability = 1 AND checkin_date <= ? AND checkout_date >= ? AND capacity >= ?";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setDate(1, java.sql.Date.valueOf(checkinDate));
            statement.setDate(2, java.sql.Date.valueOf(checkoutDate));
            statement.setInt(3, numGuests);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int roomId = resultSet.getInt("id");
                // Retrieve other room details as needed

                // Display the available room details
                out.println("<div>");
                out.println("<h2>Room ID: " + roomId + "</h2>");
                // Display other room details
                out.println("</div>");
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>

</body>
</html>
