<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
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
            background-image: url('https://mdbcdn.b-cdn.net/img/Photos/Others/images/76.webp'); 
  		background-size: cover;
        }
        h1 {
            text-align: center;
            margin-top: 0; /* Remove default margin */
            margin-bottom: 50px; /* Adjust as needed */
        }
        form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
             background-image: url('https://th.bing.com/th/id/OIP.2Kha5QeXs3HzTFX9jlriIQHaFR?w=287&h=201&c=7&r=0&o=5&dpr=1.4&pid=1.7'); 
  		background-size: cover;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 3px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        button[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 3px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #0056b3;
        }
        /* Style for the forgot password link */
        .forgot-password {
            margin-top: 10px;
            text-align: center;
        }
        .forgot-password a {
            color: black;
            text-decoration: none;
        }
        .forgot-password a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <h1>LOGIN</h1>
    <form action="logincontroller.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        
        <button type="submit">Login</button>
    </form>
    <!-- Forgot password link -->
    <div class="forgot-password">
        <a href="forgotpassword.html">Forgot Password?</a>
    </div>
</body>
</html>
