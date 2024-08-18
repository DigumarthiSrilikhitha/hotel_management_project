<%@ page import="java.sql.*" %>

<%
  String driver = "oracle.jdbc.driver.OracleDriver";
  String url = "jdbc:oracle:thin:@localhost:1521:XE";
  String dbUsername = "system";
  String dbPassword = "carrot";

  Connection connection = null;
  PreparedStatement statement = null;

  try {
    // Load the database driver
    Class.forName(driver);

    // Establish a connection to the database
    connection = DriverManager.getConnection(url, dbUsername, dbPassword);

    // Retrieve the ID parameter from the request
    int id = Integer.parseInt(request.getParameter("id"));

    // Create the SQL query for deletion
    String deleteQuery = "DELETE FROM contact_us WHERE id = ?";
    statement = connection.prepareStatement(deleteQuery);
    statement.setInt(1, id);

    // Execute the deletion statement
    int rowsAffected = statement.executeUpdate();

    // Check if the deletion was successful
    if (rowsAffected > 0) {
      out.println("Row deleted successfully");
    } else {
      out.println("Failed to delete row");
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    // Close the resources
    if (statement != null) {
      statement.close();
    }
    if (connection != null) {
      connection.close();
    }
  }
%>

