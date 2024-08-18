<%@ page import="java.sql.*" %>

<%
  // Retrieve form data
  String name = request.getParameter("name");
  String email = request.getParameter("email");
  String phone = request.getParameter("phone");
  String checkinDate = request.getParameter("checkin-date");
  String checkoutDate = request.getParameter("checkout-date");
  String numGuestsParam = request.getParameter("num-guests");
  int numGuests = 0; // Default value in case the parameter is null or not a valid integer

  if (numGuestsParam != null && !numGuestsParam.isEmpty()) {
    numGuests = Integer.parseInt(numGuestsParam);
  }

  // Database connection details
  String driver = "oracle.jdbc.driver.OracleDriver";
  String url = "jdbc:oracle:thin:@localhost:1521:XE";
  String dbUsername = "system";
  String dbPassword = "carrot";

  Connection connection = null;
  PreparedStatement preparedStatement = null;

  try {
    // Load the Oracle JDBC driver
    Class.forName(driver);

    // Establish a connection to the database
    connection = DriverManager.getConnection(url, dbUsername, dbPassword);

    // Insert data into the database
    String query = "INSERT INTO bookings (id, name, email, phone, checkin_date, checkout_date, num_guests) VALUES (bookings_seq.NEXTVAL, ?, ?, ?, TO_DATE(?, 'DD-MM-YY'), TO_DATE(?, 'DD-MM-YY'), ?)";

    preparedStatement = connection.prepareStatement(query);
    preparedStatement.setString(1, name);
    preparedStatement.setString(2, email);
    preparedStatement.setString(3, phone);
    preparedStatement.setString(4, checkinDate);
    preparedStatement.setString(5, checkoutDate);
    preparedStatement.setInt(6, numGuests);

    // Execute the prepared statement
    preparedStatement.executeUpdate();

    // Close the prepared statement
    preparedStatement.close();

    // Close the database connection
    connection.close();

    // Data successfully inserted
    String message = "Booking saved successfully. Continue with the payment process to confirm your reservation.";
    out.println("<script>alert('" + message + "'); window.location.href='payment.html';</script>");
    
  } catch (ClassNotFoundException e) {
    e.printStackTrace();
  } catch (SQLException e) {
    e.printStackTrace();
    out.println("Error occurred while saving the booking.");
  } finally {
    // Close the prepared statement and database connection
    if (preparedStatement != null) {
      try {
        preparedStatement.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    if (connection != null) {
      try {
        connection.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
%>
