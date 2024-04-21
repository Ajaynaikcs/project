<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit bus destination</title>
<style>
    body {
        font-family: Arial, sans-serif;
         background-image: url('https://mdbcdn.b-cdn.net/img/Photos/Others/images/76.webp'); 
  		background-size: cover;
    }
    h1 {
        text-align: center;
    }
    form {
        width: 50%; /* Adjusted form width */
        margin: 0 auto; /* Centering the form */
        padding: 20px; /* Added padding for better spacing */
        border: 1px solid #ccc; /* Added border for visual separation */
        border-radius: 5px; /* Rounded corners for form */
        background-image: url('https://th.bing.com/th/id/OIP.2Kha5QeXs3HzTFX9jlriIQHaFR?w=287&h=201&c=7&r=0&o=5&dpr=1.4&pid=1.7'); 
  		background-size: cover;
    }
    input[type="text"],
    textarea {
        width: 100%; /* Full width input fields */
        margin-bottom: 10px; /* Added margin between input fields */
        padding: 10px; /* Added padding for better spacing */
        box-sizing: border-box; /* Include padding and border in element's total width and height */
    }
    input[type="submit"] {
        background-color: #4CAF50; /* Green submit button */
        color: white;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049; /* Darker green on hover */
    }
    .message-container {
        text-align: center; /* Center-align the content */
        margin-top: 20px; /* Add space at the top */
    }
</style>
</head>
<body>
<h1>Edit route</h1>
<form method="post">
    <!-- Change method to POST -->
    <label for="destinationName">Enter destination:</label> 
    <input type="text" name="destinationName" required><br><br>
    <input type="submit" value="Submit"><br><br>
</form>
<%
    String destinationNameParam = request.getParameter("destinationName");
    if (destinationNameParam != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_reservation_system", "root", "SHREYASRAO123");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM destinations WHERE destinationName = ?");
            ps.setString(1, destinationNameParam);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                String destinationName = rs.getString("destinationName");
                String location = rs.getString("location");
                String description = rs.getString("description");
%>
<form method="post">
    <!-- Change method to POST -->
    <input type="hidden" name="destinationName" value="<%= destinationName %>">
    <div>
        Destination:
        <%= destinationName %><br>
        <label for="location">Location:</label><br>
        <input type="text" name="location" value="<%= location %>" placeholder="Enter location"><br>
        <label for="description">Description:</label><br>
        <textarea name="description" rows="4" cols="50" placeholder="Enter description"><%= description %></textarea><br>
        <input type="submit" name="action" value="Update">
        <input type="submit" name="action" value="Delete">
    </div>
</form>
<%
            } else {
                out.println("<div class='message-container'>Destination not found</div>");
            }
            rs.close();
            ps.close();
            con.close();
        } catch(Exception e) {
            out.println("<div class='message-container'>Error: " + e.getMessage() + "</div>");
            e.printStackTrace();
        }
    } else {
        out.println("<div class='message-container'>Destination not provided</div>");
    }
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Form submitted via POST method
        String action = request.getParameter("action");
        if ("Update".equals(action)) {
            String location = request.getParameter("location");
            String description = request.getParameter("description");
            if (location != null && !location.isEmpty()) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_reservation_system", "root", "SHREYASRAO123");
                    PreparedStatement ps = con.prepareStatement("UPDATE destinations SET location = ?, description = ? WHERE destinationName = ?");
                    ps.setString(1, location);
                    ps.setString(2, description);
                    ps.setString(3, destinationNameParam);
                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                        out.println("<div class='message-container'>Bus route updated successfully.</div>");
                    } else {
                        out.println("<div class='message-container'>Failed to update.</div>");
                    }
                    ps.close();
                    con.close();
                } catch(Exception e) {
                    out.println("<div class='message-container'>Error: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                }
            } else {
                out.println("<div class='message-container'>Location cannot be empty.</div>");
            }
        } else if ("Delete".equals(action)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_reservation_system", "root", "SHREYASRAO123");
                PreparedStatement ps = con.prepareStatement("DELETE FROM destinations WHERE destinationName = ?");
                ps.setString(1, destinationNameParam);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<div class='message-container'>Route deleted successfully.</div>");
                } else {
                    out.println("<div class='message-container'>Failed to delete.</div>");
                }
                ps.close();
                con.close();
            } catch(Exception e) {
                out.println("<div class='message-container'>Error: " + e.getMessage() + "</div>");
                e.printStackTrace();
            }
        }
    }
%>
</body>
</html>
