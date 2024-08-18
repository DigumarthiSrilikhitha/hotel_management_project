<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<html>
<head>
<title>Contact Us</title>
<style>
  body {
    font-family: Arial, sans-serif;
    margin: 20px;
  }

  table {
    width: 100%;
    border-collapse: collapse;
  }

  th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }

  th {
    background-color: #f2f2f2;
  }

  tr:hover {
    background-color: #f5f5f5;
  }

  .delete-btn {
    background-color: #f44336;
    border: none;
    color: white;
    padding: 6px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    cursor: pointer;
    border-radius: 4px;
  }
</style>
</head>
<body>
<table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Message</th>
    <th>Submission Date</th>
    <th>Action</th>
  </tr>
  <% 
  try {
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbUsername = "system";
    String dbPassword = "carrot";

    // Load the database driver
    Class.forName(driver);

    // Establish a connection to the database
    Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM contact_us");

    while (rs.next()) {
      int id = rs.getInt("id");
      String name = rs.getString("name");
      String email = rs.getString("email");
      String phone = rs.getString("phone");
      String message = rs.getString("message");
      Timestamp submissionDate = rs.getTimestamp("submission_date");

      %>
      <tr>
        <td><%= id %></td>
        <td><%= name %></td>
        <td><%= email %></td>
        <td><%= phone %></td>
        <td><%= message %></td>
        <td><%= submissionDate %></td>
        <td><a href="#" onclick="deleteRow(<%= id %>);" class="delete-btn">Delete</a></td>
      </tr>
      <%
    }

    rs.close();
    stmt.close();
    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
  %>

<script>
  function deleteRow(id) {
    if (confirm("Are you sure you want to delete this row?")) {
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          location.reload();
        }
      };
      xhttp.open("GET", "delete.jsp?id=" + id, true);
      xhttp.send();
    }
  }
</script>

</table>
</body>
</html>
