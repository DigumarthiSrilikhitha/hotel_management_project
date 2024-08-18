<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
  // Retrieve form data
  String username = request.getParameter("fname");
  String password = request.getParameter("password");

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

    // Generate the SQL query to check the username and password in the table
    String query = "SELECT * FROM Register WHERE username = '" + username + "' AND password = '" + password + "'";

    // Execute the SQL query
    ResultSet resultSet = statement.executeQuery(query);

    // Check if a matching user is found
    if (resultSet.next()) {
      // User login is successful
      // Redirect to the user's page
      response.sendRedirect("user_page.jsp?username=" + username);
    } else {
      // User login failed
      out.println("Invalid username or password");
    }

    // Close the database connection
    connection.close();
  } catch (Exception e) {
    out.println("An error occurred: " + e.getMessage());
  }
%>
