<%@page import="model.User"%>
<%@page import="model.Club"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club Details - University Club Management System</title>
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
        club.setDescription("A club for computer science enthusiasts to learn, collaborate, and build projects together. We organize hackathons, coding workshops, and tech talks.");
    %>
    
    <header>
        <h1><i class="fas fa-info-circle"></i> <%= club.getName() %> Details</h1>
        <p>Detailed information about <%= club.getName() %> | Welcome, <%= user.getFullName() %></p>
    </header>
    
    <nav>
        <a href="../index.jsp"><i class="fas fa-home"></i> Home</a> &gt; 
        <a href="../dashboard/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a> &gt; 
        <a href="list.jsp"><i class="fas fa-users"></i> Clubs</a> &gt; Club Details
    </nav>
    
    <main>
        <section>
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px;">
                <h2><i class="fas fa-university"></i> Club Information</h2>
                <div style="display: flex; gap: 10px;">
                    <a href="edit.jsp?id=<%= club.getClubId() %>" class="button">
                        <i class="fas fa-edit"></i> Edit Club
                    </a>
                    <a href="../events/create.jsp" class="button" style="background: #9b59b6;">
                        <i class="fas fa-calendar-plus"></i> Create Event
                    </a>
                    <a href="list.jsp" class="button" style="background: #95a5a6;">
                        <i class="fas fa-arrow-left"></i> Back to List
                    </a>
                </div>
            </div>
            
            <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 30px;">
                <!-- Left Column: Club Details -->
                <div>
                    <div class="card">
                        <h3><i class="fas fa-info-circle"></i> Basic Information</h3>
                        <table style="width: 100%; border-collapse: collapse;">
                            <tr>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee; width: 30%; font-weight: 600;">Club ID:</td>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee;"><%= club.getClubId() %></td>
                            </tr>
                            <tr>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee; font-weight: 600;">Name:</td>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee;"><%= club.getName() %></td>
                            </tr>
                            <tr>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee; font-weight: 600;">Category:</td>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee;">
                                    <span class="status-badge" style="background: #e3f2fd; color: #1565c0; padding: 5px 12px; border-radius: 20px;">
                                        <%= club.getCategory() %>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee; font-weight: 600;">Description:</td>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee;"><%= club.getDescription() %></td>
                            </tr>
                            <tr>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee; font-weight: 600;">Established:</td>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee;">September 2023</td>
                            </tr>
                            <tr>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee; font-weight: 600;">Meeting Schedule:</td>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee;">Every Tuesday, 3:00 PM - 4:30 PM</td>
                            </tr>
                            <tr>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee; font-weight: 600;">Location:</td>
                                <td style="padding: 12px 0; border-bottom: 1px solid #eee;">Tech Building, Room 205</td>
                            </tr>
                            <tr>
                                <td style="padding: 12px 0; font-weight: 600;">Faculty Advisor:</td>
                                <td style="padding: 12px 0;">Dr. Sarah Johnson</td>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="card" style="margin-top: 20px;">
                        <h3><i class="fas fa-users"></i> Membership Statistics</h3>
                        <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; text-align: center;">
                            <div>
                                <div style="font-size: 2.5rem; font-weight: bold; color: #3498db;">45</div>
                                <div style="color: #7f8c8d;">Total Members</div>
                            </div>
                            <div>
                                <div style="font-size: 2.5rem; font-weight: bold; color: #2ecc71;">38</div>
                                <div style="color: #7f8c8d;">Active Members</div>
                            </div>
                            <div>
                                <div style="font-size: 2.5rem; font-weight: bold; color: #9b59b6;">7</div>
                                <div style="color: #7f8c8d;">Executive Team</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Right Column: Actions & Quick Links -->
                <div>
                    <div class="card">
                        <h3><i class="fas fa-cogs"></i> Quick Actions</h3>
                        <div style="display: flex; flex-direction: column; gap: 10px;">
                            <a href="edit.jsp?id=<%= club.getClubId() %>" class="button" style="text-align: left;">
                                <i class="fas fa-edit"></i> Edit Club Information
                            </a>
                            <a href="../events/create.jsp?clubId=<%= club.getClubId() %>" class="button" style="text-align: left; background: #9b59b6;">
                                <i class="fas fa-calendar-plus"></i> Schedule New Event
                            </a>
                            <a href="../members/list.jsp?clubId=<%= club.getClubId() %>" class="button" style="text-align: left; background: #2ecc71;">
                                <i class="fas fa-user-friends"></i> View Members
                            </a>
                            <a href="#" onclick="confirmDelete(<%= club.getClubId() %>)" class="button" style="text-align: left; background: #e74c3c;">
                                <i class="fas fa-trash"></i> Delete Club
                            </a>
                        </div>
                    </div>
                    
                    <div class="card" style="margin-top: 20px;">
                        <h3><i class="fas fa-calendar-check"></i> Upcoming Events</h3>
                        <div style="margin-top: 15px;">
                            <div style="padding: 10px; background: #f8f9fa; border-radius: 5px; margin-bottom: 10px;">
                                <div style="font-weight: 600; color: #2c3e50;">Hackathon 2024</div>
                                <div style="font-size: 0.9rem; color: #7f8c8d;">
                                    <i class="fas fa-calendar"></i> Mar 15, 2024
                                </div>
                            </div>
                            <div style="padding: 10px; background: #f8f9fa; border-radius: 5px; margin-bottom: 10px;">
                                <div style="font-weight: 600; color: #2c3e50;">AI Workshop</div>
                                <div style="font-size: 0.9rem; color: #7f8c8d;">
                                    <i class="fas fa-calendar"></i> Mar 22, 2024
                                </div>
                            </div>
                            <a href="../events/list.jsp" style="display: block; text-align: center; margin-top: 10px; color: #3498db;">
                                <i class="fas fa-eye"></i> View All Events
                            </a>
                        </div>
                    </div>
                </div>
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
            if (confirm('WARNING: This will permanently delete the club and all associated data.\n\nAre you absolutely sure?')) {
                window.location.href = 'ClubServlet?action=delete&id=' + clubId;
            }
        }
    </script>
</body>
</html>