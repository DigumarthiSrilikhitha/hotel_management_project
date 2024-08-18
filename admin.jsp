<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
  // Retrieve form data
  String username = request.getParameter("username");
  String password = request.getParameter("password");

  // Database connection details
  String driver = "oracle.jdbc.driver.OracleDriver";
  String url = "jdbc:oracle:thin:@localhost:1521:XE";
  String dbUsername = "system";
  String dbPassword = "carrot";

  Connection connection = null;
  Statement statement = null;
  ResultSet resultSet = null;

  try {
    // Load the database driver
    Class.forName(driver);

    // Establish a connection to the database
    connection = DriverManager.getConnection(url, dbUsername, dbPassword);

    // Create a SQL statement
    statement = connection.createStatement();

    // Generate the SQL query to check the username and password in the table
    String query = "SELECT * FROM admin1 WHERE username = '" + username + "' AND password = '" + password + "'";

    // Execute the SQL query
    resultSet = statement.executeQuery(query);

    // Check if a matching user is found
    if (resultSet.next()) {
      // Authentication successful
      response.sendRedirect("dashboard.html"); // Redirect to the admin dashboard page
    } else {
      // Authentication failed
      out.println("Invalid username or password");
    }
  } catch (Exception e) {
    e.printStackTrace();
    out.println("Error: " + e.getMessage());
  } finally {
    // Clean up resources
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
