<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Details - University Club Management System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Hackathon 2024 Details</h1>
        <p>Detailed information about the Hackathon 2024 event</p>
    </header>
    
    <nav>
        <a href="../index.jsp">Home</a> &gt; 
        <a href="../dashboard/dashboard.jsp">Dashboard</a> &gt; 
        <a href="list.jsp">Events</a> &gt; Event Details
    </nav>
    
    <main>
        <section>
            <div class="action-bar">
                <a href="edit.jsp" class="button">Edit Event</a>
            </div>
            
            <h2>Event Information Display Here</h2>
            <div class="detail-section">
                <h3>Event Information</h3>
                <p><strong>Title:</strong> Hackathon 2024</p>
                <p><strong>Club:</strong> Computer Science Club</p>
                <p><strong>Description:</strong> [Event description text...]</p>
                <p><strong>Date & Time:</strong> March 15, 2024 - 10:00 AM to 6:00 PM</p>
                <p><strong>Location:</strong> Tech Building Room 101</p>
                <p><strong>Attendees:</strong> 35/50 registered</p>
            </div>
            
            <div class="detail-section">
                <h3>Registered Attendees</h3>
                <p>[List of attendees with status...]</p>
            </div>
        </section>
    </main>
    
    <footer>
        <p><a href="../dashboard/dashboard.jsp">Back to Dashboard</a></p>
        <p>&copy; 2024 University Club Management System</p>
    </footer>
</body>
</html>