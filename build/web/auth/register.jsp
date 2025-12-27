<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - University Club Management System</title>
    <link rel="stylesheet" href="../assets/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <h1><i class="fas fa-user-plus"></i> Create New Account</h1>
        <p>Register for University Club Management System access</p>
    </header>
    
    <nav>
        <a href="../index.jsp"><i class="fas fa-home"></i> Home</a> &gt; Register
    </nav>
    
    <main>
        <section>
            <%
                String error = request.getParameter("error");
                if (error != null) {
                    String message = "";
                    switch(error) {
                        case "1": message = "Full name is required!"; break;
                        case "2": message = "Passwords do not match!"; break;
                        case "3": message = "Password must be at least 6 characters!"; break;
                        case "4": message = "Email already exists!"; break;
                        case "5": message = "Registration failed!"; break;
                    }
            %>
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i> <%= message %>
                </div>
            <%
                }
            %>
            
            <h2><i class="fas fa-user-edit"></i> Registration Form</h2>
            
            <div class="form-placeholder">
                <form action="../RegisterServlet" method="POST">
                    <div class="form-group">
                        <label for="fullName"><i class="fas fa-user"></i> Full Name:</label>
                        <input type="text" id="fullName" name="fullName" required placeholder="Enter your full name">
                    </div>
                    
                    <div class="form-group">
                        <label for="email"><i class="fas fa-envelope"></i> Email:</label>
                        <input type="email" id="email" name="email" required placeholder="Enter your email">
                    </div>
                    
                    <div class="form-group">
                        <label for="password"><i class="fas fa-lock"></i> Password:</label>
                        <input type="password" id="password" name="password" required minlength="6" placeholder="At least 6 characters">
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword"><i class="fas fa-lock"></i> Confirm Password:</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm your password">
                    </div>
                    
                    <div class="form-group">
                        <label for="role"><i class="fas fa-user-tag"></i> Role:</label>
                        <select id="role" name="role" required>
                            <option value="">-- Select Role --</option>
                            <option value="user">User</option>
                            <option value="admin">Admin</option>
                        </select>
                    </div>
                    
                    <div style="display: flex; gap: 15px; margin-top: 25px;">
                        <button type="submit" class="button">
                            <i class="fas fa-user-plus"></i> Register
                        </button>
                        <a href="login.jsp" class="button" style="background: #95a5a6;">
                            <i class="fas fa-sign-in-alt"></i> Back to Login
                        </a>
                    </div>
                </form>
            </div>
            
            <div class="info-message" style="margin-top: 30px;">
                <h3><i class="fas fa-shield-alt"></i> Security Features:</h3>
                <ul>
                    <li><i class="fas fa-check-circle"></i> Secure password storage</li>
                    <li><i class="fas fa-check-circle"></i> Email validation</li>
                    <li><i class="fas fa-check-circle"></i> Session management</li>
                    <li><i class="fas fa-check-circle"></i> Role-based access control</li>
                </ul>
            </div>
        </section>
    </main>
    
    <footer>
        <p><a href="../dashboard/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Back to Dashboard</a></p>
        <p>&copy; 2025 University Club Management System</p>
    </footer>
    
    <script src="../assets/scripts.js"></script>
    
    <script>
        // Password confirmation validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
                document.getElementById('confirmPassword').focus();
            }
        });
    </script>
</body>
</html>