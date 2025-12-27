<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events List - University Club Management System</title>
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
        List<String[]> events = new ArrayList<>();
        events.add(new String[]{"1", "Hackathon 2024", "Computer Science Club", "2024-03-15 10:00", "Tech Building Room 101", "35/50"});
        events.add(new String[]{"2", "Photography Workshop", "Photography Club", "2024-03-20 14:00", "Arts Center", "18/25"});
        events.add(new String[]{"3", "Career Fair", "Business Club", "2024-03-25 09:00", "Main Auditorium", "120/150"});
        events.add(new String[]{"4", "Basketball Tournament", "Sports Club", "2024-03-18 16:00", "University Gym", "8/16 teams"});
        
        String success = request.getParameter("success");
        String error = request.getParameter("error");
    %>
    
    <header>
        <h1><i class="fas fa-calendar-alt"></i> All Events</h1>
        <p>Browse and manage club events | Welcome, <%= user.getFullName() %></p>
    </header>
    
    <nav>
        <a href="../index.jsp"><i class="fas fa-home"></i> Home</a> &gt; 
        <a href="../dashboard/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a> &gt; 
        Events List
    </nav>
    
    <main>
        <section>
            <%
                if (success != null) {
            %>
                <div class="success-message">
                    <i class="fas fa-check-circle"></i> Event created successfully!
                </div>
            <%
                }
                if (error != null) {
            %>
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i> Error processing event. Please try again!
                </div>
            <% } %>
            
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px;">
                <h2><i class="fas fa-list"></i> Events List</h2>
                <a href="create.jsp" class="button">
                    <i class="fas fa-plus-circle"></i> Create New Event
                </a>
            </div>
            
            <div class="table-placeholder">
                <table>
                    <thead>
                        <tr>
                            <th>Event Title</th>
                            <th>Club</th>
                            <th>Date & Time</th>
                            <th>Location</th>
                            <th>Attendees</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (String[] event : events) { 
                            String statusClass = "";
                            String statusText = "";
                            String attendees = event[5];
                            int current = Integer.parseInt(attendees.split("/")[0]);
                            int max = Integer.parseInt(attendees.split("/")[1].replace(" teams", "").replace(" teams", ""));
                            double percentage = (double) current / max * 100;
                            
                            if (percentage >= 90) {
                                statusClass = "status-active";
                                statusText = "Full";
                            } else if (percentage >= 50) {
                                statusClass = "status-active";
                                statusText = "Open";
                            } else {
                                statusClass = "status-pending";
                                statusText = "Available";
                            }
                        %>
                        <tr>
                            <td><strong><%= event[1] %></strong></td>
                            <td><%= event[2] %></td>
                            <td>
                                <i class="fas fa-calendar"></i> <%= event[3].split(" ")[0] %><br>
                                <i class="fas fa-clock"></i> <%= event[3].split(" ")[1] %>
                            </td>
                            <td><i class="fas fa-map-marker-alt"></i> <%= event[4] %></td>
                            <td>
                                <div style="margin-bottom: 5px;"><%= event[5] %></div>
                                <div style="height: 8px; background: #ecf0f1; border-radius: 4px; overflow: hidden;">
                                    <div style="height: 100%; width: <%= percentage %>% ; background: <%= percentage >= 90 ? "#2ecc71" : percentage >= 50 ? "#3498db" : "#f39c12" %>; border-radius: 4px;"></div>
                                </div>
                            </td>
                            <td>
                                <span class="status-badge <%= statusClass %>">
                                    <%= statusText %>
                                </span>
                            </td>
                            <td>
                                <div style="display: flex; gap: 10px;">
                                    <a href="details.jsp?id=<%= event[0] %>" class="button" style="padding: 8px 15px; font-size: 0.9rem;">
                                        <i class="fas fa-eye"></i> View
                                    </a>
                                    <a href="edit.jsp?id=<%= event[0] %>" class="button" style="padding: 8px 15px; font-size: 0.9rem; background: #f39c12;">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <a href="#" onclick="confirmDelete('<%= event[0] %>', '<%= event[1] %>')" class="button" style="padding: 8px 15px; font-size: 0.9rem; background: #e74c3c;">
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
                <h3><i class="fas fa-filter"></i> Filter Events:</h3>
                <div style="display: flex; gap: 15px; margin-top: 10px;">
                    <button class="button" style="background: #3498db;" onclick="filterEvents('all')">
                        <i class="fas fa-globe"></i> All Events
                    </button>
                    <button class="button" style="background: #2ecc71;" onclick="filterEvents('upcoming')">
                        <i class="fas fa-calendar-check"></i> Upcoming
                    </button>
                    <button class="button" style="background: #f39c12;" onclick="filterEvents('past')">
                        <i class="fas fa-history"></i> Past Events
                    </button>
                    <button class="button" style="background: #9b59b6;" onclick="filterEvents('full')">
                        <i class="fas fa-user-slash"></i> Full Events
                    </button>
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
        function confirmDelete(eventId, eventName) {
            if (confirm('Delete event: ' + eventName + '?\nThis will remove the event from the system.')) {
                window.location.href = 'EventServlet?action=delete&id=' + eventId;
            }
        }
        
        function filterEvents(type) {
            const rows = document.querySelectorAll('tbody tr');
            rows.forEach(row => {
                const status = row.querySelector('.status-badge').textContent;
                const dateText = row.querySelector('td:nth-child(3)').textContent;
                const attendees = row.querySelector('td:nth-child(5) div').textContent;
                
                let show = false;
                
                switch(type) {
                    case 'all':
                        show = true;
                        break;
                    case 'upcoming':
                        show = status !== 'Past';
                        break;
                    case 'past':
                        show = status === 'Past';
                        break;
                    case 'full':
                        show = attendees.includes('Full');
                        break;
                }
                
                row.style.display = show ? '' : 'none';
            });
            
            // Show notification
            if (window.UCMS && window.UCMS.showNotification) {
                window.UCMS.showNotification('Filtered by: ' + type, 'info');
            }
        }
        
        // Initialize filter
        document.addEventListener('DOMContentLoaded', function() {
            // Add calendar icon to dates
            document.querySelectorAll('td:nth-child(3)').forEach(cell => {
                const text = cell.innerHTML;
                cell.innerHTML = '<i class="fas fa-calendar" style="margin-right: 5px;"></i>' + text;
            });
        });
    </script>
</body>
</html>