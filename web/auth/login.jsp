<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - University Club Management System</title>
    <link rel="stylesheet" href="../assets/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <h1><i class="fas fa-sign-in-alt"></i> Login to University Club Management System</h1>
        <p>Access your club management dashboard</p>
    </header>
    
    <nav>
        <a href="../index.jsp"><i class="fas fa-home"></i> Home</a> &gt; Login
    </nav>
    
    <main>
        <section>
            <%
                String error = request.getParameter("error");
                String success = request.getParameter("success");
                
                if (error != null) {
            %>
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i> Invalid email or password!
                </div>
            <%
                }
                if (success != null) {
            %>
                <div class="success-message">
                    <i class="fas fa-check-circle"></i> Registration successful! Please login.
                </div>
            <%
                }
            %>
            
            <h2><i class="fas fa-user-circle"></i> Login Form</h2>
            
            <div class="form-placeholder">
                <form action="../LoginServlet" method="POST">
                    <div class="form-group">
                        <label for="email"><i class="fas fa-envelope"></i> Email:</label>
                        <input type="email" id="email" name="email" required placeholder="Enter your email">
                    </div>
                    
                    <div class="form-group">
                        <label for="password"><i class="fas fa-lock"></i> Password:</label>
                        <input type="password" id="password" name="password" required placeholder="Enter your password">
                    </div>
                    
                    <div class="form-group">
                        <label style="display: flex; align-items: center; gap: 10px;">
                            <input type="checkbox" name="remember">
                            <i class="fas fa-remember"></i> Remember Me
                        </label>
                    </div>
                    
                    <div style="display: flex; gap: 15px; margin-top: 25px;">
                        <button type="submit" class="button">
                            <i class="fas fa-sign-in-alt"></i> Login
                        </button>
                        <a href="register.jsp" class="button" style="background: #95a5a6;">
                            <i class="fas fa-user-plus"></i> Create Account
                        </a>
                    </div>
                    
                    <p style="margin-top: 20px; text-align: center;">
                        <a href="register.jsp"><i class="fas fa-question-circle"></i> Need help logging in?</a>
                    </p>
                </form>
            </div>
            
            <div class="info-message" style="margin-top: 30px;">
                <h3><i class="fas fa-info-circle"></i> Demo Credentials:</h3>
                <p><strong>Admin:</strong> admin@uni.edu / 123456</p>
                <p><strong>User:</strong> user@uni.edu / 123456</p>
            </div>
        </section>
    </main>
    
    <footer>
        <p><a href="../dashboard/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Back to Dashboard</a></p>
        <p>&copy; 2025 University Club Management System</p>
    </footer>
    
    <script src="../assets/scripts.js"></script>
</body>
</html>