<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Details - University Club Management System</title>
    <link rel="stylesheet" href="../assets/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        .event-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 10px;
            margin-bottom: 30px;
            text-align: center;
        }
        .event-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 20px;
            margin: 25px 0;
        }
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            color: #3498db;
        }
        .agenda-item {
            padding: 15px;
            border-left: 4px solid #3498db;
            margin-bottom: 15px;
            background: #f8f9fa;
            border-radius: 0 8px 8px 0;
        }
    </style>
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
        String eventId = "1";
        String eventTitle = "Hackathon 2024";
        String clubName = "Computer Science Club";
        String date = "March 15, 2024";
        String time = "10:00 AM - 6:00 PM";
        String location = "Tech Building Room 101";
        String description = "24-hour coding competition where students collaborate to build innovative solutions to real-world problems. Prizes will be awarded to the top 3 teams.";
        String maxAttendees = "50";
        String registered = "35";
        String status = "Open";
    %>
    
    <header>
        <h1><i class="fas fa-calendar-alt"></i> Event Details</h1>
        <p>Detailed information about <%= eventTitle %> | Welcome, <%= user.getFullName() %></p>
    </header>
    
    <nav>
        <a href="../index.jsp"><i class="fas fa-home"></i> Home</a> &gt; 
        <a href="../dashboard/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a> &gt; 
        <a href="list.jsp"><i class="fas fa-calendar-alt"></i> Events</a> &gt; Event Details
    </nav>
    
    <main>
        <div class="event-header">
            <h2 style="color: white; margin-bottom: 10px;"><%= eventTitle %></h2>
            <p style="opacity: 0.9; font-size: 1.1rem;">
                <i class="fas fa-users"></i> Organized by: <%= clubName %>
            </p>
        </div>
        
        <section>
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px;">
                <h2><i class="fas fa-info-circle"></i> Event Information</h2>
                <div style="display: flex; gap: 10px;">
                    <a href="edit.jsp?id=<%= eventId %>" class="button">
                        <i class="fas fa-edit"></i> Edit Event
                    </a>
                    <a href="list.jsp" class="button" style="background: #95a5a6;">
                        <i class="fas fa-arrow-left"></i> Back to List
                    </a>
                    <button class="button" style="background: #2ecc71;" onclick="registerForEvent()">
                        <i class="fas fa-user-plus"></i> Register Now
                    </button>
                </div>
            </div>
            
            <div class="event-stats">
                <div class="stat-card">
                    <div class="stat-number"><%= registered %>/<%= maxAttendees %></div>
                    <div>Registered</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">70%</div>
                    <div>Capacity Filled</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">15</div>
                    <div>Days Remaining</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number" style="color: #2ecc71;"><%= status %></div>
                    <div>Status</div>
                </div>
            </div>
            
            <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 30px; margin-top: 30px;">
                <!-- Left Column -->
                <div>
                    <div class="card">
                        <h3><i class="fas fa-calendar-day"></i> Date & Time</h3>
                        <div style="display: flex; align-items: center; gap: 15px; margin-top: 15px;">
                            <div style="text-align: center;">
                                <div style="font-size: 2.5rem; font-weight: bold; color: #3498db;">15</div>
                                <div style="color: #7f8c8d;">March</div>
                            </div>
                            <div>
                                <div style="font-weight: 600;"><i class="fas fa-calendar"></i> <%= date %></div>
                                <div><i class="fas fa-clock"></i> <%= time %></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card" style="margin-top: 20px;">
                        <h3><i class="fas fa-map-marker-alt"></i> Location</h3>
                        <div style="margin-top: 15px;">
                            <div style="font-weight: 600; margin-bottom: 10px;"><%= location %></div>
                            <div style="height: 200px; background: #f8f9fa; border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                                <i class="fas fa-map" style="font-size: 3rem; color: #3498db;"></i>
                            </div>
                            <p style="margin-top: 10px; color: #7f8c8d;">
                                <i class="fas fa-directions"></i> Directions: Enter through main gate, turn left, second building on right
                            </p>
                        </div>
                    </div>
                    
                    <div class="card" style="margin-top: 20px;">
                        <h3><i class="fas fa-list-ol"></i> Event Agenda</h3>
                        <div style="margin-top: 15px;">
                            <div class="agenda-item">
                                <div style="font-weight: 600;">10:00 AM - Opening Ceremony</div>
                                <div>Welcome speech and competition rules</div>
                            </div>
                            <div class="agenda-item">
                                <div style="font-weight: 600;">10:30 AM - Team Formation</div>
                                <div>Participants form teams and start brainstorming</div>
                            </div>
                            <div class="agenda-item">
                                <div style="font-weight: 600;">12:00 PM - Lunch Break</div>
                                <div>Catered lunch provided</div>
                            </div>
                            <div class="agenda-item">
                                <div style="font-weight: 600;">5:00 PM - Project Submission</div>
                                <div>Final project submissions and presentations</div>
                            </div>
                            <div class="agenda-item">
                                <div style="font-weight: 600;">6:00 PM - Awards Ceremony</div>
                                <div>Winner announcement and prize distribution</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Right Column -->
                <div>
                    <div class="card">
                        <h3><i class="fas fa-clipboard-check"></i> Quick Actions</h3>
                        <div style="display: flex; flex-direction: column; gap: 10px; margin-top: 15px;">
                            <button class="button" style="text-align: left;" onclick="registerForEvent()">
                                <i class="fas fa-user-plus"></i> Register for Event
                            </button>
                            <button class="button" style="text-align: left; background: #9b59b6;" onclick="shareEvent()">
                                <i class="fas fa-share-alt"></i> Share Event
                            </button>
                            <button class="button" style="text-align: left; background: #f39c12;" onclick="addToCalendar()">
                                <i class="fas fa-calendar-plus"></i> Add to Calendar
                            </button>
                            <button class="button" style="text-align: left; background: #1abc9c;" onclick="downloadMaterials()">
                                <i class="fas fa-download"></i> Download Materials
                            </button>
                            <a href="edit.jsp?id=<%= eventId %>" class="button" style="text-align: left;">
                                <i class="fas fa-edit"></i> Edit Event Details
                            </a>
                            <a href="#" onclick="confirmDelete('<%= eventId %>', '<%= eventTitle %>')" class="button" style="text-align: left; background: #e74c3c;">
                                <i class="fas fa-trash"></i> Delete Event
                            </a>
                        </div>
                    </div>
                    
                    <div class="card" style="margin-top: 20px;">
                        <h3><i class="fas fa-users"></i> Organizer Contact</h3>
                        <div style="margin-top: 15px;">
                            <div style="display: flex; align-items: center; gap: 15px; margin-bottom: 15px;">
                                <div style="width: 50px; height: 50px; background: #3498db; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold;">
                                    SJ
                                </div>
                                <div>
                                    <div style="font-weight: 600;">Dr. Sarah Johnson</div>
                                    <div style="color: #7f8c8d;">Faculty Advisor</div>
                                </div>
                            </div>
                            <div style="color: #7f8c8d;">
                                <p><i class="fas fa-envelope"></i> sarah.johnson@university.edu</p>
                                <p><i class="fas fa-phone"></i> (123) 456-7890</p>
                                <p><i class="fas fa-building"></i> Tech Building, Office 205</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card" style="margin-top: 20px;">
                        <h3><i class="fas fa-exclamation-circle"></i> Important Notes</h3>
                        <ul style="margin-top: 10px; padding-left: 20px;">
                            <li>Bring your own laptop and charger</li>
                            <li>Wi-Fi will be provided</li>
                            <li>Food and drinks included</li>
                            <li>Teams of 2-4 members allowed</li>
                            <li>Registration closes 24 hours before event</li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="card" style="margin-top: 30px;">
                <h3><i class="fas fa-align-left"></i> Event Description</h3>
                <div style="margin-top: 15px; line-height: 1.8;">
                    <%= description %>
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
        function registerForEvent() {
            if (confirm('Register for <%= eventTitle %>?\n\nDate: <%= date %>\nTime: <%= time %>\nLocation: <%= location %>')) {
                if (window.UCMS && window.UCMS.showNotification) {
                    window.UCMS.showNotification('Successfully registered for <%= eventTitle %>!', 'success');
                } else {
                    alert('Successfully registered for <%= eventTitle %>!');
                }
            }
        }
        
        function shareEvent() {
            const eventUrl = window.location.href;
            const eventTitle = '<%= eventTitle %>';
            const text = `Check out this event: ${eventTitle}\n${eventUrl}`;
            
            if (navigator.share) {
                navigator.share({
                    title: eventTitle,
                    text: text,
                    url: eventUrl
                });
            } else {
                navigator.clipboard.writeText(text).then(() => {
                    if (window.UCMS && window.UCMS.showNotification) {
                        window.UCMS.showNotification('Event link copied to clipboard!', 'success');
                    } else {
                        alert('Event link copied to clipboard!');
                    }
                });
            }
        }
        
        function addToCalendar() {
            // Create .ics file for calendar
            const icsContent = [
                'BEGIN:VCALENDAR',
                'VERSION:2.0',
                'BEGIN:VEVENT',
                'SUMMARY:' + '<%= eventTitle %>',
                'DTSTART:20240315T100000',
                'DTEND:20240315T180000',
                'LOCATION:' + '<%= location %>',
                'DESCRIPTION:' + '<%= description %>',
                'END:VEVENT',
                'END:VCALENDAR'
            ].join('\n');
            
            const blob = new Blob([icsContent], { type: 'text/calendar' });
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = '<%= eventTitle %>.ics';
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            
            if (window.UCMS && window.UCMS.showNotification) {
                window.UCMS.showNotification('Calendar file downloaded!', 'success');
            }
        }
        
        function downloadMaterials() {
            if (window.UCMS && window.UCMS.showNotification) {
                window.UCMS.showNotification('Downloading event materials...', 'info');
            }
            // Simulate download
            setTimeout(() => {
                if (window.UCMS && window.UCMS.showNotification) {
                    window.UCMS.showNotification('Materials downloaded successfully!', 'success');
                }
            }, 1000);
        }
        
        function confirmDelete(eventId, eventName) {
            if (confirm('Delete event: ' + eventName + '?\nThis action cannot be undone.')) {
                window.location.href = 'EventServlet?action=delete&id=' + eventId;
            }
        }
        
        // Add countdown timer
        document.addEventListener('DOMContentLoaded', function() {
            const eventDate = new Date('2024-03-15T10:00:00');
            updateCountdown(eventDate);
            setInterval(() => updateCountdown(eventDate), 1000);
        });
        
        function updateCountdown(eventDate) {
            const now = new Date();
            const diff = eventDate - now;
            
            if (diff > 0) {
                const days = Math.floor(diff / (1000 * 60 * 60 * 24));
                const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
                const seconds = Math.floor((diff % (1000 * 60)) / 1000);
                
                // Update countdown display if element exists
                const countdownEl = document.querySelector('.stat-card:nth-child(3) .stat-number');
                if (countdownEl) {
                    countdownEl.textContent = days;
                    countdownEl.title = `${days}d ${hours}h ${minutes}m ${seconds}s`;
                }
            }
        }
    </script>
</body>
</html>