<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - University Club Management System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Club Management Dashboard</h1>
        <p>Overview of club activities, members, and events</p>
    </header>
    
    <nav>
        <a href="../index.jsp">Home</a> &gt; Dashboard
    </nav>
    
    <main>
        <section class="kpi-section">
            <h2>Key Performance Indicators</h2>
            <div class="kpi-grid">
                <div class="kpi-box">
                    <h3>Total Clubs</h3>
                    <p class="kpi-value">[15]</p>
                </div>
                <div class="kpi-box">
                    <h3>Active Members</h3>
                    <p class="kpi-value">[247]</p>
                </div>
                <div class="kpi-box">
                    <h3>Upcoming Events</h3>
                    <p class="kpi-value">[8]</p>
                </div>
            </div>
        </section>
        
        <section class="charts-section">
            <h2>Analytics</h2>
            <div class="chart-grid">
                <div class="chart-box">
                    <h3>Membership by Club (Pie Chart)</h3>
                    <div class="chart-placeholder">[Pie Chart Here]</div>
                </div>
                <div class="chart-box">
                    <h3>Monthly Signups (Bar Chart)</h3>
                    <div class="chart-placeholder">[Bar Chart Here]</div>
                </div>
            </div>
        </section>
        
        <section class="quick-links">
            <h2>Quick Actions</h2>
            <div class="action-grid">
                <a href="../clubs/create.jsp" class="action-link">Create New Club</a>
                <a href="../events/create.jsp" class="action-link">Schedule Event</a>
                <a href="../clubs/list.jsp" class="action-link">Manage Clubs</a>
                <a href="../events/list.jsp" class="action-link">View Events</a>
            </div>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2024 University Club Management System</p>
    </footer>
</body>
</html>