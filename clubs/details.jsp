<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club Details - University Club Management System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Computer Science Club Details</h1>
        <p>Detailed information about the Computer Science Club</p>
    </header>
    
    <nav>
        <a href="../index.jsp">Home</a> &gt; 
        <a href="../dashboard/dashboard.jsp">Dashboard</a> &gt; 
        <a href="list.jsp">Clubs</a> &gt; Club Details
    </nav>
    
    <main>
        <section>
            <div class="action-bar">
                <a href="edit.jsp" class="button">Edit Club</a>
                <a href="../events/create.jsp" class="button">Create Event</a>
            </div>
            
            <h2>Club Information Display Here</h2>
            <div class="detail-section">
                <h3>Basic Information</h3>
                <p><strong>Name:</strong> Computer Science Club</p>
                <p><strong>Category:</strong> Academic</p>
                <p><strong>Description:</strong> [Club description text...]</p>
                <p><strong>Faculty Advisor:</strong> Dr. Smith</p>
                <p><strong>Meeting Schedule:</strong> Every Tuesday, 3-4 PM</p>
            </div>
            
            <div class="detail-section">
                <h3>Membership</h3>
                <p><strong>Total Members:</strong> 45</p>
                <p><a href="../members/list.jsp">View All Members</a></p>
            </div>
            
            <div class="detail-section">
                <h3>Upcoming Events</h3>
                <p>[List of upcoming events...]</p>
                <p><a href="../events/list.jsp">View All Events</a></p>
            </div>
        </section>
    </main>
    
    <footer>
        <p><a href="../dashboard/dashboard.jsp">Back to Dashboard</a></p>
        <p>&copy; 2024 University Club Management System</p>
    </footer>
</body>
</html>