<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Rooms</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Available Rooms</h1>
    <table id="roomsTable">
        <tr>
            <th>Room</th>
            <th>Description</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        <tr>
            <td>Room 1</td>
            <td>Queen-size bed, ensuite bathroom, mini-fridge</td>
            <td>$100/night</td>
            <td><button onclick="deleteRow(1)">Delete</button></td>
        </tr>
        <tr>
            <td>Room 2</td>
            <td>Two double beds, ensuite bathroom, balcony</td>
            <td>$120/night</td>
            <td><button onclick="deleteRow(2)">Delete</button></td>
        </tr>
        <tr>
            <td>Room 3</td>
            <td>King-size bed, ensuite bathroom, kitchenette</td>
            <td>$150/night</td>
            <td><button onclick="deleteRow(3)">Delete</button></td>
        </tr>
        <tr>
            <td>Room 4</td>
            <td>Two twin beds, shared bathroom, ocean view</td>
            <td>$80/night</td>
            <td><button onclick="deleteRow(4)">Delete</button></td>
        </tr>
    </table>

    <h2>Add a New Room</h2>
    <form id="addRoomForm">
        <label for="roomName">Room Name:</label>
        <input type="text" id="roomName" name="roomName" required><br><br>

        <label for="roomDescription">Room Description:</label>
        <input type="text" id="roomDescription" name="roomDescription" required><br><br>

        <label for="roomPrice">Room Price:</label>
        <input type="text" id="roomPrice" name="roomPrice" required><br><br>

        <input type="submit" value="Add Room">
    </form>

    <script>
        document.getElementById("addRoomForm").addEventListener("submit", function(event) {
            event.preventDefault();

            // Get the values entered in the form fields
            var roomName = document.getElementById("roomName").value;
            var roomDescription = document.getElementById("roomDescription").value;
            var roomPrice = document.getElementById("roomPrice").value;

            // Create a new table row with the entered room details
            var table = document.getElementById("roomsTable");
            var newRow = table.insertRow(table.rows.length);
            var nameCell = newRow.insertCell(0);
            var descriptionCell = newRow.insertCell(1);
            var priceCell = newRow.insertCell(2);
            var actionCell = newRow.insertCell(3);

            nameCell.innerHTML = roomName;
            descriptionCell.innerHTML = roomDescription;
            priceCell.innerHTML = roomPrice;
            actionCell.innerHTML = '<button onclick="deleteRow(' + table.rows.length + ')">Delete</button>';

            // Clear the form fields after adding the room
            document.getElementById("roomName").value = "";
            document.getElementById("roomDescription").value = "";
            document.getElementById("roomPrice").value = "";

            alert("Room added successfully!");
        });
        
        function deleteRow(rowId) {
            var table = document.getElementById("roomsTable");
            table.deleteRow(rowId);
            alert("Room deleted successfully!");
        }
        
        function addToCart(roomId) {
            // Handle the logic to add the selected room to the cart
            // You can use AJAX or JavaScript to handle this action
            alert("Room " + roomId + " added to cart");
        }
    </script>
</body>
</html>
