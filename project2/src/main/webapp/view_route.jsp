<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view Routes</title>
<style>
table {
border-collapse: collapse;
width: 50%;
margin: auto;
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
    }
    table {
        background-color: #ffffff;
        border-collapse: collapse;
        width: 80%; /* Adjusted width */
        margin: 20px auto; /* Added margin for better centering */
    }
    th, td {
        border: 1px solid #ddd; /* Changed border color */
        padding: 10px; /* Increased padding for better spacing */
        text-align: left;
    }
    th {
      background-color: #09ef59;
    }
</style>
</head>
<body>
<h2>View route</h2>
<table>
<tr>
<th>Destination Name</th>
<th>Location</th>
<th>description</th>

</tr>
<%
try {
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_reservation_system","root", "SHREYASRAO123");
PreparedStatement ps = con.prepareStatement("SELECT * FROM destinations");
ResultSet rs = ps.executeQuery();
while(rs.next()) {
String destinationName= rs.getString("destinationName");
String location = rs.getString("location");
String description=rs.getString("description");

%>
<tr>
<td><%= destinationName %></td>
<td><%= location %></td>
<td><%= description %></td>

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