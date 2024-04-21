<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Booking</title>
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
        width: 50%;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="text"],
    input[type="text"],
    input[type="text"],
    input[type="text"],
    input[type="submit"] {
        width: 100%;
        margin-bottom: 10px;
        padding: 10px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
    .centered {
        text-align: center;
        margin-top: 20px;
    }
    /* Message styles */
    .message {
        padding: 10px;
        margin-top: 10px;
        border-radius: 5px;
    }
    .success {
        background-color: #d4edda;
        color: #155724;
    }
    .error {
        background-color: #f8d7da;
        color: #721c24;
    }
</style>
</head>
<body>
<h1>Edit Booking</h1>
<form method="post">
    <label for="bookingid">Enter Your Booking id : </label> 
    <input type="text" name="bookingid"><br /><br/>
    <input type="submit" value="Submit"><br /><br/>
</form>
<div class="centered">
<%
String messageClass = ""; // Define variable for message class

// Check if an ID parameter is provided
String bookingidParam = request.getParameter("bookingid");
if (bookingidParam != null) {
    // If ID parameter is provided, retrieve student details from the database and populate the form
    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_reservation_system","root", "SHREYASRAO123");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM booknow WHERE bookingid= ?");
        ps.setInt(1, Integer.parseInt(bookingidParam));
        ResultSet rs = ps.executeQuery();
        // Check if student exists
        if (rs.next()) {
            // Populate form fields with existing data
            String bookingid = rs.getString("bookingid");
            String yourname = rs.getString("yourname");
            String destination = rs.getString("destination");
            String location = rs.getString("location");
%>
            <form method="post">
                <input type="hidden" name="bookingid" value="<%= bookingid %>">
                <div>
                    BOOK ID: <%=bookingid %><br>
                    <input type="text" name="yourname" value="<%= yourname %>" placeholder="Enter Your Name"><br>
                    <input type="text" name="destination" value="<%= destination %>" placeholder="Enter Your Destination"><br>
                    <input type="text" name="location" value="<%= location %>" placeholder="Enter Your location"><br>
                    <input type="submit" name="action" value="Update">
                    <input type="submit" name="action" value="Delete">
                </div>
            </form>
<%
        } else {
            // Set error message class
            messageClass = "error";
            out.println("<div class=\"message " + messageClass + "\">booking not found</div>");
        }
        // Close resources
        rs.close();
        ps.close();
        con.close();
    } catch(Exception e) {
        // Set error message class
        messageClass = "error";
        out.println("<div class=\"message " + messageClass + "\">Error: " + e.getMessage() + "</div>");
        e.printStackTrace();
    }
} else {
    // Set error message class
    messageClass = "error";
    out.println("<div class=\"message " + messageClass + "\">Booking ID not provided</div>");
}

if ("POST".equalsIgnoreCase(request.getMethod())) {
    // Form submitted via POST method
    String action = request.getParameter("action");
    if ("Update".equals(action)) {
        String yourname = request.getParameter("yourname");
        String destination = request.getParameter("destination");
        String location = request.getParameter("location");
        if (yourname != null && !yourname.isEmpty()) {
            // Update database only if username is not null or empty
            try {
                // Establish database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_reservation_system","root", "SHREYASRAO123");
                PreparedStatement ps = con.prepareStatement("UPDATE booknow SET yourname=?,destination=?,location=? WHERE bookingid=?");
                ps.setString(1, yourname);
                ps.setString(2, destination);
                ps.setString(3, location);
                ps.setInt(4, Integer.parseInt(bookingidParam));
                int rowsAffected = ps.executeUpdate();
                // Check if update was successful
                if (rowsAffected > 0) {
                    // Set success message class
                    messageClass = "success";
                    out.println("<div class=\"message " + messageClass + "\">Data updated successfully.</div>");
                } else {
                    // Set error message class
                    messageClass = "error";
                    out.println("<div class=\"message " + messageClass + "\">Failed to update data.</div>");
                }
                // Close resources
                ps.close();
                con.close();
            } catch(Exception e) {
                // Set error message class
                messageClass = "error";
                out.println("<div class=\"message " + messageClass + "\">Error: " + e.getMessage() + "</div>");
                e.printStackTrace();
            }
        } else {
            // Set error message class
            messageClass = "error";
            out.println("<div class=\"message " + messageClass + "\">Username cannot be empty.</div>");
        }
    } else if ("Delete".equals(action)) {
        // Delete record
        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_reservation_system","root", "SHREYASRAO123");
            PreparedStatement ps = con.prepareStatement("DELETE FROM booknow WHERE bookingid=?");
            ps.setInt(1, Integer.parseInt(bookingidParam));
            int rowsAffected = ps.executeUpdate();
            // Check if deletion was successful
            if (rowsAffected > 0) {
                // Set success message class
                messageClass = "success";
                out.println("<div class=\"message " + messageClass + "\">Record deleted successfully.</div>");
            } else {
                // Set error message class
                messageClass = "error";
                out.println("<div class=\"message " + messageClass + "\">Failed to delete record.</div>");
            }
            // Close resources
            ps.close();
            con.close();
        } catch(Exception e) {
            // Set error message class
            messageClass = "error";
            out.println("<div class=\"message " + messageClass + "\">Error: " + e.getMessage() + "</div>");
            e.printStackTrace();
        }
    }
}
%>
</div>
</body>
</html>
