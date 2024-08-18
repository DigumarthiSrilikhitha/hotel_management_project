<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	// Simulated data for demonstration
	int registeredUsers = 10;
	int todayBookings = 5;
	int newPayments = 3;

	List<Booking> recentBookings = new ArrayList<>();
	recentBookings.add(new Booking(1, "John Doe", "2023-05-01", "2023-05-03", "Confirmed"));
	recentBookings.add(new Booking(2, "Jane Smith", "2023-05-05", "2023-05-08", "Pending"));
	recentBookings.add(new Booking(3, "Michael Johnson", "2023-05-12", "2023-05-14", "Confirmed"));

	List<String> tasks = new ArrayList<>();
	tasks.add("Task 1: Update room prices");
	tasks.add("Task 2: Review customer feedback");

	pageContext.setAttribute("registeredUsers", registeredUsers);
	pageContext.setAttribute("todayBookings", todayBookings);
	pageContext.setAttribute("newPayments", newPayments);
	pageContext.setAttribute("recentBookings", recentBookings);
	pageContext.setAttribute("tasks", tasks);
%>

<!DOCTYPE html>
<html>
<head>
	<title>Hotel Management Admin Dashboard</title>
	<link rel="stylesheet" href="styleadmin.css" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div id="mySidenav" class="sidenav">
		<p class="logo"><span>M</span>-SoftTech</p>
		<a href="#" class="icon-a"><i class="fa fa-dashboard icons"></i> &nbsp;&nbsp;Dashboard</a>
		<a href="#" class="icon-a"><i class="fa fa-bed icons"></i> &nbsp;&nbsp;Rooms</a>
		<a href="#" class="icon-a"><i class="fa fa-list icons"></i> &nbsp;&nbsp;Bookings</a>
		<a href="#" class="icon-a"><i class="fa fa-users icons"></i> &nbsp;&nbsp;Customers</a>
		<a href="#" class="icon-a"><i class="fa fa-tasks icons"></i> &nbsp;&nbsp;Tasks</a>
		<a href="#" class="icon-a"><i class="fa fa-bar-chart icons"></i> &nbsp;&nbsp;Reports</a>
			<a href="#" class="icon-a"><i class="fa fa-cogs icons"></i> &nbsp;&nbsp;Settings</a>
	</div>
	<div id="main">
		<div class="head">
			<div class="col-div-6">
				<span style="font-size:30px;cursor:pointer; color: white;" class="nav">&#9776; Dashboard</span>
			</div>
			<div class="col-div-6">
				<div class="profile">
					<img src="images/user.png" class="pro-img" />
					<p>Admin <span>Hotel Management</span></p>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
		<br/>
		<div class="col-div-4">
			<div class="box">
				<p><c:out value="${registeredUsers}"/><br/><span>Total Registered Users</span></p>
				<i class="fa fa-user box-icon"></i>
			</div>
		</div>
		<div class="col-div-4">
			<div class="box">
				<p><c:out value="${todayBookings}"/><br/><span>Bookings Today</span></p>
				<i class="fa fa-list box-icon"></i>
			</div>
		</div>
		<div class="col-div-4">
			<div class="box">
				<p><c:out value="${newPayments}"/><br/><span>New Payments</span></p>
				<i class="fa fa-tasks box-icon"></i>
			</div>
		</div>
		<div class="clearfix"></div>
		<br/><br/>
		<div class="col-div-8">
			<div class="box-8">
				<div class="content-box">
					<p>Recent Bookings <span>View All</span></p>
					<br/>
					<table>
						<tr>
							<th>Booking ID</th>
							<th>Customer Name</th>
							<th>Check-in Date</th>
							<th>Check-out Date</th>
							<th>Status</th>
						</tr>
						<c:forEach var="booking" items="${recentBookings}">
							<tr>
								<td><c:out value="${booking.id}"/></td>
								<td><c:out value="${booking.customerName}"/></td>
								<td><c:out value="${booking.checkInDate}"/></td>
								<td><c:out value="${booking.checkOutDate}"/></td>
								<td><span class="status-<c:out value="${booking.status}"/>"><c:out value="${booking.status}"/></span></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div class="col-div-4">
			<div class="box-4">
				<div class="content-box">
					<p>Tasks</p>
					<br/>
					<ul>
						<c:forEach var="task" items="${tasks}">
							<li><c:out value="${task}"/></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<br/><br/>
		<div class="col-div-12">
			<div class="box-12">
				<div class="content-box">
					<p>Reports</p>
					<br/>
					<div id="chartContainer" style="height: 370px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script>
		window.onload = function () {
			var chart = new CanvasJS.Chart("chartContainer", {
				animationEnabled: true,
				title: {
					text: "Monthly Revenue"
				},
				data: [{
					type: "column",
					dataPoints: [
						{ label: "Jan", y: 500 },
						{ label: "Feb", y: 700 },
						{ label: "Mar", y: 550 },
						{ label: "Apr", y: 800 },
						{ label: "May", y: 600 },
						{ label: "Jun", y: 900 },
						{ label: "Jul", y: 850 },
						{ label: "Aug", y: 650 },
						{ label: "Sep", y: 700 },
						{ label: "Oct", y: 600 },
						{ label: "Nov", y: 750 },
						{ label: "Dec", y: 850 }
					]
				}]
			});
			chart.render();
		}
	</script>
</body>
</html>
