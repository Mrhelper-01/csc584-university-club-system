package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/EventServlet")
public class EventServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Check if user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("../auth/login.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        
        if ("create".equals(action)) {
            // Get form data
            String title = request.getParameter("title");
            String clubId = request.getParameter("clubId");
            String description = request.getParameter("description");
            String eventDate = request.getParameter("eventDate");
            String location = request.getParameter("location");
            String maxAttendees = request.getParameter("maxAttendees");
            
            // Print to console for testing
            System.out.println("Event Created:");
            System.out.println("Title: " + title);
            System.out.println("Club ID: " + clubId);
            System.out.println("Description: " + description);
            System.out.println("Date: " + eventDate);
            System.out.println("Location: " + location);
            System.out.println("Max Attendees: " + maxAttendees);
            
            // Redirect with success message
            response.sendRedirect("list.jsp?success=1");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Check if user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("../auth/login.jsp");
            return;
        }
        
        // Simple response for testing
        response.setContentType("text/html");
        response.getWriter().println("<h1>EventServlet is Working!</h1>");
        response.getWriter().println("<p>GET request received</p>");
    }
}