package controller;

import dao.ClubDAO;
import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Check if user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("../auth/login.jsp");
            return;
        }
        
        // Get statistics
        ClubDAO clubDao = new ClubDAO();
        UserDAO userDao = new UserDAO();
        
        // Count data for KPIs
        int totalClubs = clubDao.countClubs();
        int totalEvents = 8; // Placeholder - you can create EventDAO later
        int totalUsers = 3;  // Placeholder - add countUsers() to UserDAO
        
        // Set attributes for JSP
        request.setAttribute("totalClubs", totalClubs);
        request.setAttribute("totalEvents", totalEvents);
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("clubs", clubDao.getAllClubs());
        
        // Forward to dashboard JSP
        request.getRequestDispatcher("/dashboard/dashboard.jsp").forward(request, response);
    }
}