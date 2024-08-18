<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>All Bookings</title>
	<style>
		table {
			border-collapse: collapse;
			width: 100%;
		}

		th, td {
			padding: 8px;
			text-align: left;
			border-bottom: 1px solid #ddd;
		}

		tr:hover {
			background-color: #f5f5f5;
		}

		.header {
			background-color: #f2f2f2;
			padding: 20px;
			text-align: center;
			font-size: 20px;
		}
	</style>
</head>
<body>
	<div class="header">All Bookings</div>
	<table>
		<tr>
			<th>Booking ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Check-in Date</th>
			<th>Check-out Date</th>
			<th>Number of Guests</th>
		</tr>
		<%
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

				// Create the SQL query
				String sql = "SELECT * FROM bookings";
				statement = connection.prepareStatement(sql);

				// Execute the query
				resultSet = statement.executeQuery();

				// Iterate over the result set and display the data
				while (resultSet.next()) {
					int id = resultSet.getInt("id");
					String name = resultSet.getString("name");
					String email = resultSet.getString("email");
					String phone = resultSet.getString("phone");
					Date checkinDate = resultSet.getDate("checkin_date");
					Date checkoutDate = resultSet.getDate("checkout_date");
					int numGuests = resultSet.getInt("num_guests");
		%>
		<tr>
			<td><%= id %></td>
			<td><%= name %></td>
			<td><%= email %></td>
			<td><%= phone %></td>
			<td><%= checkinDate %></td>
			<td><%= checkoutDate %></td>
			<td><%= numGuests %></td>
		</tr>
		<%
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// Close the database resources
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
	</table>
</body>
</html>
