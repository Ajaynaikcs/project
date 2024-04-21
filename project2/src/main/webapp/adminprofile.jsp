<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://mdbcdn.b-cdn.net/img/Photos/Others/images/76.webp'); /* Background image */
            background-size: fit; /* Cover the entire viewport */
            background-position: center; /* Center the background image */
            background-repeat: no-repeat; /* Prevent background image from repeating */
            color: #fff; /* Default text color */
        }
   
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            text-align: center; /* Center content horizontally */
        }
        
       h1 {
            background-color: #4CAF50; /* Background color for h1 */
            color: white; /* Text color */
            padding: 10px; /* Add padding */
            border-radius: 5px; /* Add border radius */
            margin: 30px auto; /* Center the h1 */
            width: fit-content; /* Adjust width to fit content */
        }
       h2 {
            text-align: center;
            color: #333; /* Color for h2 */
            font-size: 24px; /* Font size for h2 */
            margin-bottom: 10px; /* Add margin bottom to separate from h3 */
        }
        h3 {
            text-align: center;
            color: #555; /* Color for h3 */
            font-size: 20px; /* Font size for h3 */
            margin-bottom: 20px; /* Add margin bottom for spacing */
            font-family: 'Roboto', sans-serif; 
        }
        .menu {
            list-style-type: none;
            padding: 0;
            margin: 0;
            text-align: center;
        }
        .menu li {
            display: inline-block;
            margin-right: -9px;
        }
        .menu li:last-child {
            margin-right: 0;
        }
        .menu li a {
            text-decoration: none;
            color: white; /* Button link color */
            font-weight: bold;
            padding: 10px 20px;
            border: 2px solid transparent;
            border-radius: 5px;
        }
        .menu li a:hover {
            color: #4CAF50; /* Change button link color on hover */
            background-color: #f0f0f0;
            border-color: #ddd;
            border-radius:30px;
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
        /* Stylish logout alert */
        .logout-alert {
            background-color: #f8d7da;
            border-color: #f5c6cb;
            color: #721c24;
            padding: 10px 20px;
            border-radius: 5px;
            margin-top: 20px;
            text-align: center;
        }
        /* Centered content */
        .centered {
            text-align: center;
        }
        /* Styling for the image */
        #dashboard-content img {
            max-width: 100%; /* Ensure the image doesn't exceed its container */
            height: auto; /* Maintain aspect ratio */
            display: block; /* Center the image horizontally */
            margin: 0 auto; /* Center the image horizontally */
            margin-bottom: 20px; /* Add some space below the image */
        }
        /* Position logout button */
        .logout-wrapper {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
        }
        /* Style for the button */
        .custom-button {
            padding: 10px 20px;
            background-color: #007bff; /* Blue color */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px; /* Add margin top */
        }
        .custom-button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
        
    </style>
</head>
<body>
 <h1>Admin Panel</h1>
<div class="container">
    
   
    <ul class="menu">
    
        <li><a href="viewinfo.jsp">Viewinformation</a></li>
        <li><a href="add_route.jsp">Addroutes</a></li>
         <li><a href="view_route.jsp">View route</a></li>
        <li><a href="edit_route.jsp">Editroute</a></li>
        <li><a href="view.jsp">view booking</a></li>

    </ul>
    <div id="dashboard-content">
        <!-- Content goes here -->
    </div>
</div>
<div class="logout-wrapper">
    <button class="logout-btn" onclick="logout()">Logout</button>
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

    <!-- Add more user information here as needed -->
    
</div>
<%
} else {
%>

<%
}
%>
</body>
</html>
