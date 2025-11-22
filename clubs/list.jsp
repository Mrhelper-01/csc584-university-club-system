<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clubs List - University Club Management System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>All Clubs</h1>
        <p>Browse and manage university clubs</p>
    </header>
    
    <nav>
        <a href="../index.jsp">Home</a> &gt; 
        <a href="../dashboard/dashboard.jsp">Dashboard</a> &gt; Clubs List
    </nav>
    
    <main>
        <section>
            <div class="action-bar">
                <a href="create.jsp" class="button">Create New Club</a>
            </div>
            
            <h2>Clubs List Table Here</h2>
            <div class="table-placeholder">
                <table>
                    <thead>
                        <tr>
                            <th>Club Name</th>
                            <th>Category</th>
                            <th>Members</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a href="details.jsp">Computer Science Club</a></td>
                            <td>Academic</td>
                            <td>45</td>
                            <td>Active</td>
                            <td>
                                <a href="edit.jsp">Edit</a> | 
                                <a href="details.jsp">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td><a href="details.jsp">Photography Club</a></td>
                            <td>Arts</td>
                            <td>28</td>
                            <td>Active</td>
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