<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
  // Retrieve form data
  String username = request.getParameter("fname");
  String phone = request.getParameter("phone no");
  String email = request.getParameter("mail");
  String password = request.getParameter("pass");

  // Database connection details
  String driver = "oracle.jdbc.driver.OracleDriver";
  String url = "jdbc:oracle:thin:@localhost:1521:XE";
  String dbUsername = "system";
  String dbPassword = "carrot";

  try {
    // Load the database driver
    Class.forName(driver);

    // Establish a connection to the database
    Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword);

    // Create a SQL statement
    Statement statement = connection.createStatement();

    // Generate the SQL query to insert user data into the table
    String query = "INSERT INTO users (username, phone, email, password) VALUES ('" + username + "', '" + phone + "', '" + email + "', '" + password + "')";

    // Execute the SQL query
    statement.executeUpdate(query);

    // Close the database connection
    connection.close();

    // Redirect to a success page
    response.sendRedirect("registration_success.jsp");
  } catch (Exception e) {
    out.println("An error occurred: " + e.getMessage());
  }
%>
