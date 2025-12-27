<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Members List - University Club Management System</title>
    
    <!-- تاقیکردنەوە: بەکارهێنانی ڕێگەی ڕاستەوخۆ -->
    <style>
        * {
            font-family: 'Poppins', sans-serif;
        }
        body {
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        th {
            background-color: #667eea;
            color: white;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        .active {
            color: green;
            font-weight: bold;
        }
    </style>
    
    <!-- لینکە ڕێگەکانی دەرەکی -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <h1><i class="fas fa-users"></i> Club Members</h1>
        <p>View and manage club memberships</p>
    </header>
    
    <nav>
        <a href="../index.jsp"><i class="fas fa-home"></i> Home</a> &gt; 
        <a href="../dashboard/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a> &gt; 
        <span>Members List</span>
    </nav>
    
    <main>
        <section>
            <h2><i class="fas fa-list"></i> Members List</h2>
            <div style="margin: 20px 0;">
                <table>
                    <thead>
                        <tr>
                            <th><i class="fas fa-user"></i> Member Name</th>
                            <th><i class="fas fa-envelope"></i> Email</th>
                            <th><i class="fas fa-flag"></i> Club</th>
                            <th><i class="fas fa-crown"></i> Role</th>
                            <th><i class="fas fa-calendar-alt"></i> Join Date</th>
                            <th><i class="fas fa-circle"></i> Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Mr Helper</td>
                            <td>MrHelper@university.edu</td>
                            <td>Computer Science Club</td>
                            <td><span style="color: #ff9900;">President</span></td>
                            <td>Jan 15, 2023</td>
                            <td><span class="active"><i class="fas fa-check-circle"></i> Active</span></td>
                        </tr>
                        <tr>
                            <td>Zhanyar Dldar</td>
                            <td>zhanyar@university.edu</td>
                            <td>Photography Club</td>
                            <td><span style="color: #667eea;">Member</span></td>
                            <td>Feb 20, 2023</td>
                            <td><span class="active"><i class="fas fa-check-circle"></i> Active</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
    
    <footer style="margin-top: 30px; padding: 20px; text-align: center; background: #333; color: white; border-radius: 10px;">
        <p><a href="../dashboard/dashboard.jsp" style="color: #fff;"><i class="fas fa-arrow-left"></i> Back to Dashboard</a></p>
        <p>&copy; 2025 University Club Management System</p>
    </footer>
    
    <script>
        console.log("Members page loaded successfully!");
        
        document.addEventListener('DOMContentLoaded', function() {
            const rows = document.querySelectorAll('table tbody tr');
            rows.forEach(row => {
                row.addEventListener('click', function() {
                    this.style.backgroundColor = '#f0f8ff';
                });
            });
        });
    </script>
</body>
</html>