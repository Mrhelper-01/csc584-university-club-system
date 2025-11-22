<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>University Club Management System</title>
    <link rel="stylesheet" href="assets/styles.css">
</head>
<body>
    <header>
        <h1>University Club Management System</h1>
        <p>Central platform for managing club memberships, activities, and announcements</p>
    </header>
    
    <nav>
        <ul>
            <li><a href="auth/login.jsp">Login</a></li>
            <li><a href="auth/register.jsp">Register</a></li>
            <li><a href="dashboard/dashboard.jsp">Dashboard</a></li>
        </ul>
    </nav>
    
    <main>
        <section>
            <h2>Site Map</h2>
            <div class="sitemap">
                <h3>Authentication</h3>
                <ul>
                    <li><a href="auth/login.jsp">Login Page</a></li>
                    <li><a href="auth/register.jsp">Registration Page</a></li>
                </ul>
                
                <h3>Dashboard</h3>
                <ul>
                    <li><a href="dashboard/dashboard.jsp">Main Dashboard</a></li>
                </ul>
                
                <h3>Clubs Management (CRUD Module)</h3>
                <ul>
                    <li><a href="clubs/list.jsp">Clubs List</a></li>
                    <li><a href="clubs/create.jsp">Create Club</a></li>
                    <li><a href="clubs/details.jsp">Club Details</a></li>
                    <li><a href="clubs/edit.jsp">Edit Club</a></li>
                </ul>
                
                <h3>Events Management (Second Module)</h3>
                <ul>
                    <li><a href="events/list.jsp">Events List</a></li>
                    <li><a href="events/create.jsp">Create Event</a></li>
                    <li><a href="events/details.jsp">Event Details</a></li>
                    <li><a href="events/edit.jsp">Edit Event</a></li>
                </ul>
                
                <h3>Members</h3>
                <ul>
                    <li><a href="members/list.jsp">Members List</a></li>
                </ul>
            </div>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2024 University Club Management System</p>
    </footer>
</body>
</html>