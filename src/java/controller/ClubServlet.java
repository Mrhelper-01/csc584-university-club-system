package controller;

import dao.ClubDAO;
import model.Club;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.List;

@WebServlet("/ClubServlet")
public class ClubServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Check if user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        ClubDAO clubDao = new ClubDAO();
        
        try {
            if (action == null) {
                // List all clubs
                List<Club> clubs = clubDao.getAllClubs();
                request.setAttribute("clubs", clubs);
                request.getRequestDispatcher("clubs/list.jsp").forward(request, response);
                
            } else if (action.equals("details")) {
                // Show club details
                int clubId = Integer.parseInt(request.getParameter("id"));
                Club club = clubDao.getClubById(clubId);
                
                if (club != null) {
                    request.setAttribute("club", club);
                    request.getRequestDispatcher("clubs/details.jsp").forward(request, response);
                } else {
                    response.sendRedirect("clubs/list.jsp?error=1");
                }
                
            } else if (action.equals("edit")) {
                // Show edit form
                int clubId = Integer.parseInt(request.getParameter("id"));
                Club club = clubDao.getClubById(clubId);
                
                if (club != null) {
                    request.setAttribute("club", club);
                    request.getRequestDispatcher("clubs/edit.jsp").forward(request, response);
                } else {
                    response.sendRedirect("clubs/list.jsp?error=1");
                }
                
            } else if (action.equals("delete")) {
                // Delete club
                int clubId = Integer.parseInt(request.getParameter("id"));
                boolean success = clubDao.deleteClub(clubId);
                
                if (success) {
                    response.sendRedirect("clubs/list.jsp?success=1");
                } else {
                    response.sendRedirect("clubs/list.jsp?error=2");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("clubs/list.jsp?error=3");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Check if user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        ClubDAO clubDao = new ClubDAO();
        int userId = (Integer) session.getAttribute("userId");
        
        try {
            if (action.equals("create")) {
                // Create new club
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                String category = request.getParameter("category");
                
                Club club = new Club(name, description, category, userId);
                boolean success = clubDao.createClub(club);
                
                if (success) {
                    response.sendRedirect("clubs/list.jsp?success=2");
                } else {
                    response.sendRedirect("clubs/create.jsp?error=1");
                }
                
            } else if (action.equals("update")) {
                // Update existing club
                int clubId = Integer.parseInt(request.getParameter("clubId"));
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                String category = request.getParameter("category");
                
                Club club = new Club();
                club.setClubId(clubId);
                club.setName(name);
                club.setDescription(description);
                club.setCategory(category);
                
                boolean success = clubDao.updateClub(club);
                
                if (success) {
                    response.sendRedirect("clubs/list.jsp?success=3");
                } else {
                    response.sendRedirect("clubs/edit.jsp?id=" + clubId + "&error=1");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("clubs/list.jsp?error=4");
        }
    }
}