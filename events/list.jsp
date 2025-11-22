<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events List - University Club Management System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>All Events</h1>
        <p>Browse and manage club events</p>
    </header>
    
    <nav>
        <a href="../index.jsp">Home</a> &gt; 
        <a href="../dashboard/dashboard.jsp">Dashboard</a> &gt; Events List
    </nav>
    
    <main>
        <section>
            <div class="action-bar">
                <a href="create.jsp" class="button">Create New Event</a>
            </div>
            
            <h2>Events List Table Here</h2>
            <div class="table-placeholder">
                <table>
                    <thead>
                        <tr>
                            <th>Event Title</th>
                            <th>Club</th>
                            <th>Date & Time</th>
                            <th>Location</th>
                            <th>Attendees</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a href="details.jsp">Hackathon 2024</a></td>
                            <td>Computer Science Club</td>
                            <td>Mar 15, 2024 - 10:00 AM</td>
                            <td>Tech Building Room 101</td>
                            <td>35/50</td>
                            <td>
                                <a href="edit.jsp">Edit</a> | 
                                <a href="details.jsp">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td><a href="details.jsp">Photography Workshop</a></td>
                            <td>Photography Club</td>
                            <td>Mar 20, 2024 - 2:00 PM</td>
                            <td>Arts Center</td>
                            <td>18/25</td>
                            <td>
                                <a href="edit.jsp">Edit</a> | 
                                <a href="details.jsp">View</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
    
    <footer>
        <p><a href="../dashboard/dashboard.jsp">Back to Dashboard</a></p>
        <p>&copy; 2024 University Club Management System</p>
    </footer>
</body>
</html>