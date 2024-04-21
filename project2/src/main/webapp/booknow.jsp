<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
</head>
<style>

body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
}

h1 {
  text-align: center;
  color: #333;
}

.container {
  margin-bottom: 15px;
}

label {
  font-weight: bold;
}

input[type="text"] {
  width: 100%;
  padding: 10px;
  margin: 5px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
  transition: border-color 0.3s ease-in-out;
}

input[type="text"]:focus {
  border-color: #66afe9;
}

input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}

input[type="submit"]:hover {
  background-color: #45a049;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
}

.form-wrapper {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 0 20px rgba(0,0,0,0.1);
  transition: box-shadow 0.3s ease-in-out;
}

.form-wrapper:hover {
  box-shadow: 0 0 30px rgba(0,0,0,0.2);
}
</style>

<body>

<h1>BOOK NOW</h1>

<form>

<div class="container">
<label for="bookingid"><b>Enter Your Booking id :</b></label><br/>
<input type="text" required name="bookingid">
</div>
<div>
<label for="yourname"><b>Enter Your Name :</b> </label><br/>
<input type="text" name="yourname">
</div>
<div>
<label for="destination"><b>Enter destination :</b> </label><br/>
<input type="text" name="destination">
</div>
<div>
<label for="location"><b>Enter Your location :</b> </label><br/>
<input type="text" name="location">
</div>
<br/>
<input type="submit" value="Submit">

<form/>

<%
String bookingid=request.getParameter("bookingid");
String yourname=request.getParameter("yourname");
String destination=request.getParameter("destination");
String location=request.getParameter("location");
String message="hiuii";
	if(bookingid != null && yourname!=null && destination!=null &&location!=null)
	{
		try	
	{
			Class.forName("com.mysql.cj.jdbc.Driver");
			//Connection
			Connection
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_reservation_system","root", "SHREYASRAO123");
			PreparedStatement ps=con.prepareStatement("INSERT INTO booknow(bookingid,yourname,destination,location)VALUES(?,?,?,?)");
	
			ps.setInt(1,Integer.parseInt(bookingid));
			ps.setString(2,yourname);
			ps.setString(3,destination);
			ps.setString(4,location);
			int i=ps.executeUpdate();
		if(i>0)
		{
			message="Registered";
		}
		else
		{
			message="Not Registered";
		}
}
		catch(Exception e)//super class this is present in java.lang package
		//because it is a default package
		{
			message="Error";
			e.printStackTrace();
		}
}
		else
		{
			message="Please Enter The Data";
			System.out.println(message);
		}
%>
</body>
</html>