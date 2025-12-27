<%@page import="model.User"%>
<%@page import="model.Club"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Club - University Club Management System</title>
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
        Club club = new Club();
        club.setClubId(1);
        club.setName("Computer Science Club");
        club.setCategory("Academic");
        club.setDescription("Programming and technology club");
        
        String error = request.getParameter("error");
    %>
    
    <header>
        <h1><i class="fas fa-edit"></i> Edit <%= club.getName() %></h1>
        <p>Modify club information and settings | Welcome, <%= user.getFullName() %></p>
    </header>
    
    <nav>
        <a href="../index.jsp"><i class="fas fa-home"></i> Home</a> &gt; 
        <a href="../dashboard/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a> &gt; 
        <a href="list.jsp"><i class="fas fa-users"></i> Clubs</a> &gt; 
        <a href="details.jsp?id=<%= club.getClubId() %>"><i class="fas fa-info-circle"></i> Club Details</a> &gt; 
        Edit Club
    </nav>
    
    <main>
        <section>
            <% if (error != null) { %>
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i> Failed to update club. Please try again!
                </div>
            <% } %>
            
            <h2><i class="fas fa-edit"></i> Edit Club Information</h2>
            
            <div class="form-placeholder">
                <form action="ClubServlet" method="POST" onsubmit="return validateForm()">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="clubId" value="<%= club.getClubId() %>">
                    
                    <div class="form-group">
                        <label for="name"><i class="fas fa-font"></i> Club Name:</label>
                        <input type="text" id="name" name="name" value="<%= club.getName() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="category"><i class="fas fa-tag"></i> Category:</label>
                        <select id="category" name="category" required>
                            <option value="Academic" <%= club.getCategory().equals("Academic") ? "selected" : "" %>>Academic</option>
                            <option value="Arts" <%= club.getCategory().equals("Arts") ? "selected" : "" %>>Arts</option>
                            <option value="Sports" <%= club.getCategory().equals("Sports") ? "selected" : "" %>>Sports</option>
                            <option value="Cultural" <%= club.getCategory().equals("Cultural") ? "selected" : "" %>>Cultural</option>
                            <option value="Social" <%= club.getCategory().equals("Social") ? "selected" : "" %>>Social</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="description"><i class="fas fa-align-left"></i> Description:</label>
                        <textarea id="description" name="description" rows="5"><%= club.getDescription() %></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label><i class="fas fa-toggle-on"></i> Club Status:</label>
                        <div style="display: flex; gap: 20px; margin-top: 10px;">
                            <label style="display: flex; align-items: center; gap: 8px;">
                                <input type="radio" name="status" value="active" checked>
                                <i class="fas fa-circle" style="color: #2ecc71;"></i> Active
                            </label>
                            <label style="display: flex; align-items: center; gap: 8px;">
                                <input type="radio" name="status" value="inactive">
                                <i class="fas fa-circle" style="color: #e74c3c;"></i> Inactive
                            </label>
                            <label style="display: flex; align-items: center; gap: 8px;">
                                <input type="radio" name="status" value="pending">
                                <i class="fas fa-circle" style="color: #f39c12;"></i> Pending Approval
                            </label>
                        </div>
                    </div>
                    
                    <div style="display: flex; gap: 15px; margin-top: 30px;">
                        <button type="submit" class="button">
                            <i class="fas fa-save"></i> Update Club
                        </button>
                        <a href="details.jsp?id=<%= club.getClubId() %>" class="button" style="background: #95a5a6;">
                            <i class="fas fa-times"></i> Cancel
                        </a>
                        <button type="reset" class="button" style="background: #f39c12;">
                            <i class="fas fa-redo"></i> Reset Changes
                        </button>
                        <a href="#" onclick="confirmDelete(<%= club.getClubId() %>)" class="button" style="background: #e74c3c;">
                            <i class="fas fa-trash"></i> Delete Club
                        </a>
                    </div>
                </form>
            </div>
            
            <div class="info-message" style="margin-top: 30px;">
                <h3><i class="fas fa-exclamation-triangle"></i> Important Notes:</h3>
                <ul>
                    <li><i class="fas fa-check"></i> Changes will be applied immediately</li>
                    <li><i class="fas fa-check"></i> All club members will be notified of changes</li>
                    <li><i class="fas fa-check"></i> Club events will be updated accordingly</li>
                    <li><i class="fas fa-check"></i> Deleting a club cannot be undone</li>
                </ul>
            </div>
        </section>
    </main>
    
    <footer>
        <p><a href="../dashboard/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Back to Dashboard</a></p>
        <p>&copy; 2025 University Club Management System</p>
    </footer>
    
    <script src="../assets/scripts.js"></script>
    
    <script>
        function validateForm() {
            const name = document.getElementById('name').value.trim();
            if (name.length < 3) {
                alert('Club name must be at least 3 characters long.');
                return false;
            }
            return true;
        }
        
        function confirmDelete(clubId) {
            if (confirm('WARNING: Deleting this club will also delete:\n• All club events\n• All member registrations\n• Club announcements\n\nThis action cannot be undone!\n\nAre you absolutely sure?')) {
                window.location.href = 'ClubServlet?action=delete&id=' + clubId;
            }
        }
        
        // Show confirmation when leaving page with unsaved changes
        let formChanged = false;
        document.querySelector('form').addEventListener('input', function() {
            formChanged = true;
        });
        
        window.addEventListener('beforeunload', function(e) {
            if (formChanged) {
                e.preventDefault();
                e.returnValue = 'You have unsaved changes. Are you sure you want to leave?';
            }
        });
        
        document.querySelector('form').addEventListener('submit', function() {
            formChanged = false;
        });
    </script>
</body>
</html>