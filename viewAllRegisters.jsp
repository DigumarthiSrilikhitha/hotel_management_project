<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>View All Registers</title>
	<!-- Include your CSS stylesheets and other head elements here -->
	<style>
		table {
			width: 100%;
			border-collapse: collapse;
		}

		table th, table td {
			padding: 12px 15px;
			text-align: left;
			border-bottom: 1px solid #ddd;
		}

		table th {
			background-color: #f2f2f2;
		}

		table tr:hover {
			background-color: #f5f5f5;
		}
	</style>
</head>
<body>
	<div class="header">All New Registrations</div>
	<!-- Your HTML code for the page layout -->
	<div id="mySidenav" class="sidenav">
		<!-- Navigation menu items -->
	</div>
	<div id="main">
		<!-- Page content -->
		<div class="head">
			<!-- Header section -->
		</div>
		<!-- Rest of the page content -->
		<div class="content-box">
			<!-- Displaying registers in a table -->
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Username</th>
						<th>Phone</th>
						<th>Email</th>
						<!-- Add more columns if needed -->
					</tr>
				</thead>
				<tbody>
					<%
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

							// Execute a query to retrieve register data
							Statement statement = connection.createStatement();
							String query = "SELECT * FROM Register";
							ResultSet resultSet = statement.executeQuery(query);

							// Loop through the result set and display the registers
							while (resultSet.next()) {
								int id = resultSet.getInt("id");
								String username = resultSet.getString("username");
								String phone = resultSet.getString("phone");
								String email = resultSet.getString("email");
								
								// Display the register details in a table row
								%>
								<tr>
									<td><%=id%></td>
									<td><%=username%></td>
									<td><%=phone%></td>
									<td><%=email%></td>
									<!-- Add more columns if needed -->
								</tr>
								<%
							}

							// Close the database connections
							resultSet.close();
							statement.close();
							connection.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
