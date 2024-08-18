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
    
    // Retrieve the form data from the request
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String message = request.getParameter("message");
    
    // Create the SQL query
    String query = "INSERT INTO contact_us (id, name, email, phone, message, submission_date) " +
                   "VALUES (contact_us_seq.NEXTVAL, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
    
    // Prepare the statement
    statement = connection.prepareStatement(query);
    statement.setString(1, name);
    statement.setString(2, email);
    statement.setString(3, phone);
    statement.setString(4, message);
    
    // Execute the statement
    int rowsAffected = statement.executeUpdate();
    
    // Check if the insertion was successful
    if (rowsAffected > 0) {
      out.println("<script>alert('Thank you! We will get in touch with you soon.'); window.location.href = 'contact-us.html';</script>");
    } else {
      out.println("<script>alert('Failed to insert data.');</script>");
    }
  } catch (Exception e) {
    out.println("<script>alert('An error occurred: " + e.getMessage() + "');</script>");
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
