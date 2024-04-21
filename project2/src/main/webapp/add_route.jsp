<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Destination</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column; /* Align items in a column */
            background-image: url('https://wallpapercave.com/wp/wp9185671.jpg'); /* Replace 'your-image-url.jpg' with the URL or path to your background image */
            background-size: cover; /* Cover the entire viewport */
            background-position: center; /* Center the background image */
        }
        form {
            width: 50%; /* Adjusted form width */
            margin: 20px auto; /* Centering the form */
            padding: 20px; /* Added padding for better spacing */
            border: 1px solid #ccc; /* Added border for visual separation */
            border-radius: 5px; /* Rounded corners for form */
            background-color: #fff; /* Form background color */
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
            padding: 10px 20px;
            border-radius: 5px;
        }
        input[type="submit"]:hover {
            background-color: #45a049; /* Darker green on hover */
           
        }
        p {
            text-align: center;
            margin-top: 10px;
        }
        
    </style>
</head>
<body>
<form method="post" action="">
    <label for="destinationName">Destination Name:</label>
    <input type="text" name="destinationName" required><br><br>
    <label for="location">Location:</label>
    <input type="text" name="location" required><br><br>
    <label for="description">Description:</label><br>
    <textarea name="description" rows="4" cols="50" required></textarea><br><br>
    <input type="submit" value="Register Destination">
</form>
<%
    String destinationName = request.getParameter("destinationName");
    String location = request.getParameter("location");
    String description = request.getParameter("description");
    String message = "";

    if (destinationName != null && location != null && description != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_reservation_system", "root", "SHREYASRAO123");
            PreparedStatement ps = con.prepareStatement("INSERT INTO destinations(destinationName, location, description) VALUES (?, ?, ?)");

            ps.setString(1, destinationName);
            ps.setString(2, location);
            ps.setString(3, description);

            int i = ps.executeUpdate();

            if (i > 0) {
                message = "Destination added successfully.";
            } else {
                message = "Failed to add destination.";
            }

            con.close();
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
            e.printStackTrace();
        }
    } else {
        message = "Please enter all the required data.";
    }

    out.println("<p>" + message + "</p>");
%>
</body>
</html>
