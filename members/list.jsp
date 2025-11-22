<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Members List - University Club Management System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Club Members</h1>
        <p>View and manage club memberships</p>
    </header>
    
    <nav>
        <a href="../index.jsp">Home</a> &gt; 
        <a href="../dashboard/dashboard.jsp">Dashboard</a> &gt; Members List
    </nav>
    
    <main>
        <section>
            <h2>Members List Table Here</h2>
            <div class="table-placeholder">
                <table>
                    <thead>
                        <tr>
                            <th>Member Name</th>
                            <th>Email</th>
                            <th>Club</th>
                            <th>Role</th>
                            <th>Join Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>John Doe</td>
                            <td>john.doe@university.edu</td>
                            <td>Computer Science Club</td>
                            <td>President</td>
                            <td>Jan 15, 2023</td>
                            <td>Active</td>
                        </tr>
                        <tr>
                            <td>Jane Smith</td>
                            <td>jane.smith@university.edu</td>
                            <td>Photography Club</td>
                            <td>Member</td>
                            <td>Feb 20, 2023</td>
                            <td>Active</td>
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