<%@ page import="java.math.BigDecimal" %>

<%@ page import="java.sql.*" %>

<%
  // Retrieve form data
  String cardHolder = request.getParameter("card_holder");
  String amountStr = request.getParameter("amount");
  BigDecimal amount = new BigDecimal(amountStr);

  // Database connection details
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

    // Prepare the SQL statement
    String sql = "INSERT INTO payment (id, card_holder, amount) VALUES (payment_seq.NEXTVAL, ?, ?)";
    statement = connection.prepareStatement(sql);
    statement.setString(1, cardHolder);
    statement.setBigDecimal(2, amount);

    // Execute the statement
    statement.executeUpdate();

    // Close the statement and connection
    statement.close();
    connection.close();

    // Redirect to receipt.html
    response.sendRedirect("receipt.html");
  } catch (ClassNotFoundException e) {
  // Handle driver loading exception
  e.printStackTrace();
  %>
  <script>
    alert("Driver not found. Please check the database driver configuration.");
  </script>
  <%
} catch (SQLException e) {
  // Handle database connection or SQL statement execution exception
  e.printStackTrace();
  %>
  <script>
    alert("An error occurred while connecting to the database or executing the SQL statement. Please try again.");
  </script>
  <%
} finally {
  // Close resources in the reverse order of their creation
  if (statement != null) {
    try {
      statement.close();
    } catch (SQLException e) {
      e.printStackTrace();
      %>
      <script>
        alert("An error occurred while closing the statement. Please try again.");
      </script>
      <%
    }
  }
  if (connection != null) {
    try {
      connection.close();
    } catch (SQLException e) {
      e.printStackTrace();
      %>
      <script>
        alert("An error occurred while closing the database connection. Please try again.");
      </script>
      <%
    }
  }
}
%>