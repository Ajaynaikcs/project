<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seat Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .seats {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
        .seat {
            width: 50px;
            height: 50px;
            background-color: #ddd;
            margin: 10px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .seat:hover {
            background-color: #c0c0c0;
        }
        .seat.selected {
            background-color: #007bff;
            color: white;
        }
        .seat.disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
        .booking-result {
            margin-top: 20px;
            border: 2px solid #333;
            padding: 10px;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Select Your Seat</h1>
        <div class="seats">
            <% for (int i = 1; i <= 30; i++) { %>
                <div class="seat" id="seat<%= i %>" onclick="toggleSeat(<%= i %>)"><%= i %></div>
            <% } %>
        </div>
        <button onclick="bookSeats()">Book Selected Seats</button>
        <div class="booking-result" id="bookingResult" style="display: none;">
            <!-- Booking result will be displayed here -->
        </div>
    </div>
    <script>
        var selectedSeats = [];

        function toggleSeat(seatNumber) {
            var seat = document.getElementById('seat' + seatNumber);
            if (selectedSeats.includes(seatNumber)) {
                selectedSeats.splice(selectedSeats.indexOf(seatNumber), 1);
                seat.classList.remove('selected');
            } else {
                selectedSeats.push(seatNumber);
                seat.classList.add('selected');
            }
        }

        function bookSeats() {
            if (selectedSeats.length === 0) {
                alert('Please select at least one seat.');
            } else {
                // Confirm booking
                var confirmation = confirm('Are you sure you want to book the selected seats?');
                if (confirmation) {
                    // Store selected seats in session and redirect to booking result page
                    var selectedSeatsString = JSON.stringify(selectedSeats);
                    sessionStorage.setItem('selectedSeats', selectedSeatsString);
                    window.location.href = 'bookingResult.jsp';
                } else {
                    // User canceled booking
                    alert('Booking canceled.');
                }
            }
        }
    </script>
</body>
</html>
