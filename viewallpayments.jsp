<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>View All Payments</title>
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
    </style>
</head>
<body>
    <h1>View All Payments</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Card Holder</th>
            <th>Amount</th>
        </tr>
        <% 
        try {
            // Database connection details
            String driver = "oracle.jdbc.driver.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String dbUsername = "system";
            String dbPassword = "carrot";

            // Load the database driver
            Class.forName(driver);

            // Establish a connection to the database
            Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM payment");

            while (rs.next()) {
                int id = rs.getInt("id");
                String cardHolder = rs.getString("card_holder");
                double amount = rs.getDouble("amount");

                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= cardHolder %></td>
                    <td><%= amount %></td>
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
    </table>
</body>
</html>
