<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
  // Retrieve form data
  String username = request.getParameter("fname");
  String phone = request.getParameter("phone");
  String email = request.getParameter("mail");
  String password = request.getParameter("pass");
  String confirmPassword = request.getParameter("password");

  // Database connection details
  String driver = "oracle.jdbc.driver.OracleDriver";
  String url = "jdbc:oracle:thin:@localhost:1521:XE";
  String dbUsername = "system";
  String dbPassword = "carrot";

  if (!password.equals(confirmPassword)) {
    // Redirect to an error page or display an error message
    response.sendRedirect("password_error.jsp");
  } else {
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
      // Load the database driver
      Class.forName(driver);

      // Establish a connection to the database
      connection = DriverManager.getConnection(url, dbUsername, dbPassword);

      // Create a SQL query to insert user data into the table
      String query = "INSERT INTO Register (id, username, phone, email, password) VALUES (register_seq.NEXTVAL, ?, ?, ?, ?)";


// Create a prepared statement
preparedStatement = connection.prepareStatement(query);
preparedStatement.setString(1, username);
preparedStatement.setString(2, phone);
preparedStatement.setString(3, email);
preparedStatement.setString(4, password);


      // Execute the prepared statement
      preparedStatement.executeUpdate();

      // Close the prepared statement
      preparedStatement.close();

      // Close the database connection
      connection.close();

      // Redirect to a success page
      response.sendRedirect("registration_success.jsp");
    } catch (Exception e) {
      out.println("An error occurred: " + e.getMessage());
    } finally {
      try {
        // Close the prepared statement and database connection in case of any exceptions
        if (preparedStatement != null) {
          preparedStatement.close();
        }
        if (connection != null) {
          connection.close();
        }
      } catch (SQLException ex) {
        out.println("An error occurred while closing the database connection: " + ex.getMessage());
      }
    }
  }
%>
