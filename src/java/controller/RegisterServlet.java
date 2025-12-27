package controller;

import dao.UserDAO;
import model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = "user";
        
        if (fullName == null || fullName.trim().isEmpty()) {
            response.sendRedirect("auth/register.jsp?error=1");
            return;
        }
        
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("auth/register.jsp?error=2");
            return;
        }
        
        if (password.length() < 6) {
            response.sendRedirect("auth/register.jsp?error=3");
            return;
        }
        
        UserDAO userDao = new UserDAO();
        
        if (userDao.emailExists(email)) {
            response.sendRedirect("auth/register.jsp?error=4");
            return;
        }
        
        User newUser = new User(fullName, email, password, role);
        boolean success = userDao.registerUser(newUser);
        
        if (success) {
            response.sendRedirect("auth/login.jsp?success=1");
        } else {
            response.sendRedirect("auth/register.jsp?error=5");
        }
    }
}