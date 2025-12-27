<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="model.Club"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - University Club Management System</title>
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
    %>
    
    <header>
        <h1><i class="fas fa-tachometer-alt"></i> Club Management Dashboard</h1>
        <p>Welcome, <%= user.getFullName() %>! | 
           <a href="../LogoutServlet" style="color: white; text-decoration: underline;">
               <i class="fas fa-sign-out-alt"></i> Logout
           </a>
        </p>
    </header>
    
    <nav>
        <a href="../index.jsp"><i class="fas fa-home"></i> Home</a> &gt; Dashboard
    </nav>
    
    <main>
        <section class="kpi-section">
            <h2><i class="fas fa-chart-line"></i> Key Performance Indicators</h2>
            <div class="kpi-grid">
                <div class="kpi-box">
                    <h3><i class="fas fa-users"></i> Total Clubs</h3>
                    <p class="kpi-value">15</p>
                </div>
                <div class="kpi-box">
                    <h3><i class="fas fa-user-friends"></i> Active Members</h3>
                    <p class="kpi-value">247</p>
                </div>
                <div class="kpi-box">
                    <h3><i class="fas fa-calendar-check"></i> Upcoming Events</h3>
                    <p class="kpi-value">8</p>
                </div>
            </div>
        </section>
        
        <section>
            <h2><i class="fas fa-chart-pie"></i> Analytics</h2>
            <div class="chart-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin: 20px 0;">
                <div class="card">
                    <h3><i class="fas fa-chart-pie"></i> Membership by Club</h3>
                    <div style="height: 200px; background: #f8f9fa; display: flex; align-items: center; justify-content: center; border-radius: 8px;">
                        <i class="fas fa-chart-pie" style="font-size: 3rem; color: #3498db;"></i>
                    </div>
                </div>
                <div class="card">
                    <h3><i class="fas fa-chart-bar"></i> Monthly Signups</h3>
                    <div style="height: 200px; background: #f8f9fa; display: flex; align-items: center; justify-content: center; border-radius: 8px;">
                        <i class="fas fa-chart-bar" style="font-size: 3rem; color: #2ecc71;"></i>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="quick-links">
            <h2><i class="fas fa-bolt"></i> Quick Actions</h2>
            <div class="action-grid">
                <a href="../clubs/create.jsp" class="action-link">
                    <i class="fas fa-plus-circle fa-2x"></i>
                    <span>Create New Club</span>
                </a>
                <a href="../events/create.jsp" class="action-link">
                    <i class="fas fa-calendar-plus fa-2x"></i>
                    <span>Schedule Event</span>
                </a>
                <a href="../clubs/list.jsp" class="action-link">
                    <i class="fas fa-users fa-2x"></i>
                    <span>Manage Clubs</span>
                </a>
                <a href="../events/list.jsp" class="action-link">
                    <i class="fas fa-calendar-alt fa-2x"></i>
                    <span>View Events</span>
                </a>
            </div>
        </section>
        
        <section>
            <h2><i class="fas fa-history"></i> Recent Activity</h2>
            <div class="table-placeholder">
                <table>
                    <thead>
                        <tr>
                            <th><i class="fas fa-calendar"></i> Date</th>
                            <th><i class="fas fa-user"></i> User</th>
                            <th><i class="fas fa-tasks"></i> Activity</th>
                            <th><i class="fas fa-info-circle"></i> Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Today, 10:30 AM</td>
                            <td><%= user.getFullName() %></td>
                            <td>Logged in</td>
                            <td>Successfully accessed dashboard</td>
                        </tr>
                        <tr>
                            <td>Yesterday, 3:45 PM</td>
                            <td>John Doe</td>
                            <td>Created club</td>
                            <td>Photography Club created</td>
                        </tr>
                        <tr>
                            <td>Nov 20, 2:15 PM</td>
                            <td>Jane Smith</td>
                            <td>Updated event</td>
                            <td>Hackathon 2024 details updated</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
    
    <footer>
        <p><a href="../index.jsp"><i class="fas fa-home"></i> Back to Home</a></p>
        <p>&copy; 2025 University Club Management System | Logged in as: <%= user.getFullName() %> (<%= user.getRole() %>)</p>
    </footer>
    
    <script src="../assets/scripts.js"></script>
</body>
</html>