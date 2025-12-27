<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="model.Club"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clubs List - University Club Management System</title>
    <link rel="stylesheet" href="../assets/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <%
        HttpSession userSession = request.getSession(false);
        if (userSession == null || userSession.getAttribute("user") == null) {
            response.sendRedirect("../auth/login.jsp");
            return;
        }
        
        User user = (User) userSession.getAttribute("user");
        
        // Test data
        List<Club> clubs = new ArrayList<>();
        
        Club club1 = new Club();
        club1.setClubId(1);
        club1.setName("Computer Science Club");
        club1.setCategory("Academic");
        club1.setDescription("Programming and technology club");
        
        Club club2 = new Club();
        club2.setClubId(2);
        club2.setName("Photography Club");
        club2.setCategory("Arts");
        club2.setDescription("Photography and art club");
        
        Club club3 = new Club();
        club3.setClubId(3);
        club3.setName("Sports Club");
        club3.setCategory("Sports");
        club3.setDescription("Football, basketball and other sports");
        
        clubs.add(club1);
        clubs.add(club2);
        clubs.add(club3);
        
        String success = request.getParameter("success");
        String error = request.getParameter("error");
    %>
    
    <header>
        <h1><i class="fas fa-users"></i> All Clubs</h1>
        <p>Browse and manage university clubs | Welcome, <%= user.getFullName() %></p>
    </header>
    
    <nav>
        <a href="../index.jsp"><i class="fas fa-home"></i> Home</a> &gt; 
        <a href="../dashboard/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a> &gt; 
        Clubs List
    </nav>
    
    <main>
        <section>
            <%
                if (success != null) {
                    String message = "";
                    switch(success) {
                        case "1": message = "Club deleted successfully!"; break;
                        case "2": message = "Club created successfully!"; break;
                        case "3": message = "Club updated successfully!"; break;
                    }
            %>
                <div class="success-message">
                    <i class="fas fa-check-circle"></i> <%= message %>
                </div>
            <%
                }
                if (error != null) {
                    String message = "";
                    switch(error) {
                        case "1": message = "Club not found!"; break;
                        case "2": message = "Failed to delete club!"; break;
                    }
            %>
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i> <%= message %>
                </div>
            <% } %>
            
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px;">
                <h2><i class="fas fa-list"></i> Clubs List</h2>
                <a href="create.jsp" class="button">
                    <i class="fas fa-plus-circle"></i> Create New Club
                </a>
            </div>
            
            <div class="table-placeholder">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Club Name</th>
                            <th>Category</th>
                            <th>Description</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Club club : clubs) { %>
                        <tr>
                            <td><%= club.getClubId() %></td>
                            <td><strong><%= club.getName() %></strong></td>
                            <td>
                                <span class="status-badge" style="background: <%= club.getCategory().equals("Academic") ? "#e3f2fd" : club.getCategory().equals("Arts") ? "#f3e5f5" : "#e8f5e8" %>; 
                                      color: <%= club.getCategory().equals("Academic") ? "#1565c0" : club.getCategory().equals("Arts") ? "#7b1fa2" : "#2e7d32" %>;
                                      padding: 5px 12px; border-radius: 20px;">
                                    <%= club.getCategory() %>
                                </span>
                            </td>
                            <td><%= club.getDescription() %></td>
                            <td>
                                <div style="display: flex; gap: 10px;">
                                    <a href="details.jsp?id=<%= club.getClubId() %>" class="button" style="padding: 8px 15px; font-size: 0.9rem;">
                                        <i class="fas fa-eye"></i> View
                                    </a>
                                    <a href="edit.jsp?id=<%= club.getClubId() %>" class="button" style="padding: 8px 15px; font-size: 0.9rem; background: #f39c12;">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <a href="#" onclick="confirmDelete(<%= club.getClubId() %>)" class="button" style="padding: 8px 15px; font-size: 0.9rem; background: #e74c3c;">
                                        <i class="fas fa-trash"></i> Delete
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            
            <div class="info-message" style="margin-top: 30px;">
                <h3><i class="fas fa-info-circle"></i> Total Clubs: <%= clubs.size() %></h3>
                <p>These clubs are managed through our system. You can create, edit, or delete clubs as needed.</p>
            </div>
        </section>
    </main>
    
    <footer>
        <p><a href="../dashboard/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Back to Dashboard</a></p>
        <p>&copy; 2025 University Club Management System</p>
    </footer>
    
    <script src="../assets/scripts.js"></script>
    
    <script>
        function confirmDelete(clubId) {
            if (confirm('Are you sure you want to delete this club?\nThis action cannot be undone.')) {
                window.location.href = 'ClubServlet?action=delete&id=' + clubId;
            }
        }
        
        // Add animation to table rows
        document.querySelectorAll('tbody tr').forEach(row => {
            row.addEventListener('mouseenter', function() {
                this.style.transform = 'translateX(5px)';
            });
            row.addEventListener('mouseleave', function() {
                this.style.transform = 'translateX(0)';
            });
        });
    </script>
</body>
</html>