<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Recovery</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column; /* Set the main axis to vertical */
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        h1 {
            text-align: center;
            margin-top: 0; /* Remove default margin */
            margin-bottom: 50px; /* Adjust as needed */
        }
        .message {
            text-align: center;
            margin-bottom: 20px;
        }
        .message p {
            margin: 10px 0;
        }
        .message strong {
            color: #007bff;
        }
    </style>
</head>
<body>
    <h1>Password Recovery</h1>
    <%-- Retrieve the email address from the form --%>
    <% String email = request.getParameter("email"); %>
    <%-- In a real application, you would implement actual password recovery logic here --%>
    <%-- For demonstration purposes, let's just print the email address --%>
    <div class="message">
        <p>A password recovery link has been sent to:</p>
        <p><strong><%= email %></strong></p>
    </div>
    <div class="message">
        <p>In a real application, you would send an email with a password recovery link.</p>
    </div>
</body>
</html>
