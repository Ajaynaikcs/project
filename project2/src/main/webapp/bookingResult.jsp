<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Result</title>
</head>
<body>
    <div class="container" style="max-width: 800px; margin: 0 auto; padding: 20px; text-align: center;">
        <style>
            h1 {
                color: #333;
                margin-bottom: 20px;
            }
            .booking-info {
                margin-top: 20px;
                border: 2px solid #333;
                padding: 10px;
                background-color: #fff;
                border-radius: 5px;
            }
            .booking-info p {
                color: #555; /* Dark gray text color */
                margin-bottom: 10px;
            }
            .booking-info p.no-details {
                color: #900; /* Dark red text color */
            }
        </style>
        <h1>Booking Result</h1>
        <div class="booking-info">
            <h2>Your Booking Details:</h2>
            <% 
                // Retrieve booking details from the session attribute
                String selectedSeats = (String) session.getAttribute("selectedSeats");
                if (selectedSeats != null) {
            %>
            <p>Selected seats: <%= selectedSeats %></p>
            <% } else { %>
            <p class="no-details">1 seat booked</p>
            <% } %>
            <!-- You can display more booking details here if needed -->
        </div>
    </div>
</body>
</html>
