<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.HashMap, java.io.IOException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Controller</title>
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
        }
        p {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <%
        // Simulated database with user credentials
        Map<String, String> users = new HashMap<>();
        users.put("user", "password");
        users.put("admin", "adminpassword");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        if (users.containsKey(username) && users.get(username).equals(password)) {
            // Valid user, redirect to appropriate profile page
            if (username.equals("admin")) {
                session.setAttribute("adminLoggedIn", true);
                response.sendRedirect("adminprofile.jsp");
            } else {
                session.setAttribute("userLoggedIn", true);
                response.sendRedirect("userprofile.jsp");
            }
        } else {
            // Invalid credentials, redirect back to login page
            response.sendRedirect("login.jsp");
        }
    %>
</body>
</html>
