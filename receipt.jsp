<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Booking Receipt</title>
  <style>
    /* Add your CSS styles here */
    .hotel-logo {
      width: 200px;
    }
    .signature {
      width: 150px;
    }
    .receipt-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-top: 50px;
    }
    .receipt-container h2 {
      text-align: center;
    }
    .receipt-container p {
      text-align: center;
    }
    li a i {
  background-color: #6C7A89;
  border-radius: 50%;
  padding: 15px 10px;
  color: #E8F1F2;
  font-family: Arial, sans-serif;
  font-weight: bold;
  font-size: 16px;
}
  </style>
</head>
<body>
  <div class="receipt-container">
    <img src="https://tremento.com/wp-content/uploads/2021/08/26.png" alt="Hotel Logo" class="hotel-logo">
    <h1>Booking Receipt</h1>
    <%
      // Retrieve the name from the request parameter
      String name = request.getParameter("name");

      // Database connection details
      String driver = "oracle.jdbc.driver.OracleDriver";
      String url = "jdbc:oracle:thin:@localhost:1521:XE";
      String dbUsername = "system";
      String dbPassword = "carrot";

      Connection connection = null;
      PreparedStatement statement = null;
      ResultSet resultSet = null;

      try {
        // Load the database driver
        Class.forName(driver);

        // Establish a connection to the database
        connection = DriverManager.getConnection(url, dbUsername, dbPassword);

        // Retrieve booking details from the bookings table
        String bookingsSql = "SELECT * FROM bookings WHERE name = ?";
        statement = connection.prepareStatement(bookingsSql);
        statement.setString(1, name);
        resultSet = statement.executeQuery();

        // Retrieve booking details from the result set
        if (resultSet.next()) {
          // Retrieve booking details
          String bookingName = resultSet.getString("name");
          String email = resultSet.getString("email");
          String phone = resultSet.getString("phone");
          Date checkinDate = resultSet.getDate("checkin_date");
          Date checkoutDate = resultSet.getDate("checkout_date");
          int numGuests = resultSet.getInt("num_guests");

          // Display booking details
          out.println("<h2>Booking Details:</h2>");
          out.println("<p>Name: " + bookingName + "</p>");
          out.println("<p>Email: " + email + "</p>");
          out.println("<p>Phone: " + phone + "</p>");
          out.println("<p>Check-in Date: " + checkinDate + "</p>");
          out.println("<p>Checkout Date: " + checkoutDate + "</p>");
          out.println("<p>Number of Guests: " + numGuests + "</p>");
        }

        // Retrieve payment details from the payment table
        String paymentSql = "SELECT * FROM payment WHERE name = ?";
        statement = connection.prepareStatement(paymentSql);
        statement.setString(1, name);
        resultSet = statement.executeQuery();

        // Retrieve payment details from the result set
        if (resultSet.next()) {
          // Retrieve payment details
          String paymentName = resultSet.getString("name");
          String cardHolder = resultSet.getString("card_holder");
          BigDecimal amount = resultSet.getBigDecimal("amount");

          // Display payment details
          out.println("<h2>Payment Details:</h2>");
          out.println("<p>Name: " + paymentName + "</p>");
          out.println("<p>Card Holder: " + cardHolder + "</p>");
          out.println("<p>Amount: " + amount + "</p>");
        }

        // Display a thank you message
        out.println("<h2>Thank you for booking! Have a great day!</h2>");

      } catch (ClassNotFoundException e) {
        // Handle driver loading exception
        e.printStackTrace();
      } catch (SQLException e) {
        // Handle database connection or SQL statement execution exception
        e.printStackTrace();
      } finally {
        // Close resources in the reverse order of their creation
        if (resultSet != null) {
          try {
            resultSet.close();
          } catch (SQLException e) {
            e.printStackTrace();
          }
        }
        if (statement != null) {
          try {
            statement.close();
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
    <img src="sign.jpg" alt="Signature" class="signature">
  </div>

  <div class="container">
    <li><a href="HOME.html" style="text-decoration: none;"><i>Go To Home</i></a></li><br><br>

    <button class="btn-print" onclick="printReceipt()">Print Receipt</button>
  </div>

  <script>
    function printReceipt() {
      window.print();
    }
  </script>
</body>
</html>
