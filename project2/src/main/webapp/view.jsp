<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view booking</title>
<style>
table {
border-collapse: collapse;
width: 50%;
margin: auto;
border-radius:30px;
}
th, td {
border: 1px solid black;
padding: 8px;
text-align: left;
}
th {
  background-color: #09ef59;
}

    body {
        font-family: Arial, sans-serif;
         background-image: url('https://mdbcdn.b-cdn.net/img/Photos/Others/images/76.webp'); 
  		background-size: cover;
    }
    h2 {
        text-align: center;
        color: black;
    }
    table {
        background-color: #ffffff;
        border-collapse: collapse;
        width: 80%; /* Adjusted width */
        margin: 20px auto; /* Added margin for better centering */
        border-radius:10px;
    }
    th, td {
        border: 1px solid #ddd; /* Changed border color */
        padding: 10px; /* Increased padding for better spacing */
        text-align: left;
    }
    th {
      background-color: skyblue;
    }
</style>
</head>
<body>
<h2>View booking</h2>
<table>
<tr>
<th>Bookingid</th>
<th>Username</th>
<th>Destination</th>
<th>Location</th>
</tr>
<%
try {
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_reservation_system","root", "SHREYASRAO123");
PreparedStatement ps = con.prepareStatement("SELECT * FROM booknow");
ResultSet rs = ps.executeQuery();
while(rs.next()) {
String bookingid= rs.getString("bookingid");
String yourname = rs.getString("yourname");
String destination=rs.getString("destination");
String location = rs.getString("location");
%>
<tr>
<td><%= bookingid %></td>
<td><%= yourname %></td>
<td><%= destination %></td>
<td><%= location %></td>
</tr>
<%
}
rs.close();
ps.close();
con.close();
} catch(Exception e) {
out.println("Error: " + e.getMessage());
}
%>
</table>
</body>
</html>