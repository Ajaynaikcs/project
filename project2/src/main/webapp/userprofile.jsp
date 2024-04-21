<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('assets/images/R.jpeg');
            background-size: cover;
            background-position: center;
            height: 100vh;
        }
        h2 {
            text-align: center;
            margin-top: 20px;
            color: #ff0000; /* Red color */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Text shadow */
            background-color: rgba(0, 255, 0, 0.5); /* Green background color with opacity */
            padding: 10px 20px; /* Add padding to the h2 element */
            border-radius: 10px; /* Rounded corners */
        }
       
        .menu {
            list-style-type: none;
            padding: 0;
            margin: 0;
            text-align: center;
            margin-top: 20px;
            display: flex; /* Use flexbox */
            justify-content: center; /* Center horizontally */
        }
        .menu li {
            display: inline-block;
            margin-right: 20px;
        }
        .menu li:last-child {
            margin-right: 0;
        }
        .menu button {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            padding: 10px 20px;
            border: 2px solid transparent;
            border-radius: 5px;
            background-color: #007bff; /* Blue color */
            cursor: pointer;
        }
        .menu button:hover {
            color: #4CAF50;
            background-color: #f0f0f0;
            border-color: #ddd;
        }

        /* Logout button */
        .logout-btn {
            padding: 10px 20px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .logout-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <h2>WELCOME TO USER PANEL</h2>
    <ul class="menu">
        <li><button onclick="window.location.href='main.html'" class="menu-button">Home</button></li>
        <li><button onclick="window.location.href='home2.html'" class="menu-button">Click Here</button></li>
        <li><button onclick="window.location.href='setting.html'" class="menu-button">Settings</button></li>
        <li><button class="logout-btn" onclick="logout()">Logout</button></li>
    </ul>

    <div id="dashboard-content">
        <!-- Content goes here -->
    </div>

   <script>
    function logout() {
        // Redirect to the login page
        window.location.href = "login.html";
    }
</script>

<%
// JSP code embedded here
if (session.getAttribute("userLoggedIn") != null && (boolean)session.getAttribute("userLoggedIn")) {
%>
   
<%
} else {
%>
    
<%
}
%>
</body>
</html>
