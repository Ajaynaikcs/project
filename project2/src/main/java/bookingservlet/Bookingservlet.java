package bookingservlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Bookingservlet
 */
public class Bookingservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bookingservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Retrieve form data
	        String location = request.getParameter("location");
	        String departure = request.getParameter("departure");
	        String passengers = request.getParameter("passengers");
	        String travelClass = request.getParameter("class");

	        // Perform any necessary backend operations (e.g., store in database)

	        // Redirect to booking result page with booking details as URL parameters
	        response.sendRedirect("booking-result.html" + "?location=" + location + "&departure=" + departure +"&passengers=" + passengers +"&class=" + travelClass);
	    }
	}


