<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>University Club Management System - Sitemap</title>
    
    <!-- Modern CSS -->
    <link rel="stylesheet" href="assets/styles.css">
    
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        .hero-section {
            text-align: center;
            padding: 60px 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 20px;
            margin-bottom: 40px;
            position: relative;
            overflow: hidden;
        }
        
        .hero-section h1 {
            font-size: 3.5rem;
            margin-bottom: 20px;
            animation: fadeInDown 1s ease;
        }
        
        .hero-section p {
            font-size: 1.3rem;
            max-width: 700px;
            margin: 0 auto 30px;
            animation: fadeInUp 1s ease 0.3s both;
        }
        
        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            margin: 40px 0;
        }
        
        .feature-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            border-top: 5px solid #3498db;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }
        
        .feature-icon {
            font-size: 3rem;
            margin-bottom: 20px;
            color: #3498db;
        }
        
        .sitemap-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        
        .sitemap-category {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        .sitemap-category h3 {
            color: #2c3e50;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid #3498db;
        }
        
        .sitemap-category ul {
            list-style: none;
            padding: 0;
        }
        
        .sitemap-category li {
            margin-bottom: 10px;
        }
        
        .sitemap-category a {
            color: #34495e;
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 5px;
            display: block;
            transition: all 0.3s ease;
        }
        
        .sitemap-category a:hover {
            background: #3498db;
            color: white;
            padding-left: 20px;
        }
        
        .stats-bar {
            display: flex;
            justify-content: space-around;
            background: white;
            padding: 25px;
            border-radius: 15px;
            margin: 40px 0;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }
        
        .stat-item {
            text-align: center;
        }
        
        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #3498db;
            display: block;
        }
        
        .stat-label {
            color: #7f8c8d;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>
    <div class="hero-section">
        <h1><i class="fas fa-university"></i> University Club Management System</h1>
        <p>Central platform for managing club memberships, activities, and announcements</p>
        <a href="auth/login.jsp" class="button" style="background: white; color: #667eea; font-size: 1.1rem; padding: 15px 40px;">
            <i class="fas fa-sign-in-alt"></i> Get Started
        </a>
    </div>
    
    <div class="stats-bar">
        <div class="stat-item">
            <span class="stat-number">15+</span>
            <span class="stat-label">Clubs</span>
        </div>
        <div class="stat-item">
            <span class="stat-number">250+</span>
            <span class="stat-label">Members</span>
        </div>
        <div class="stat-item">
            <span class="stat-number">30+</span>
            <span class="stat-label">Events</span>
        </div>
        <div class="stat-item">
            <span class="stat-number">24/7</span>
            <span class="stat-label">Access</span>
        </div>
    </div>
    
    <div class="feature-grid">
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-users"></i>
            </div>
            <h3>Club Management</h3>
            <p>Create, manage, and organize university clubs with full CRUD operations</p>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-calendar-alt"></i>
            </div>
            <h3>Event Planning</h3>
            <p>Schedule and manage events with date, location, and attendance tracking</p>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-chart-bar"></i>
            </div>
            <h3>Analytics Dashboard</h3>
            <p>Real-time insights with KPIs and visual data representations</p>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-shield-alt"></i>
            </div>
            <h3>Secure Access</h3>
            <p>Role-based authentication and session management for security</p>
        </div>
    </div>
    
    <main>
        <section>
            <h2 style="text-align: center; margin-bottom: 30px;">
                <i class="fas fa-sitemap"></i> Site Map & Navigation
            </h2>
            
            <div class="sitemap-grid">
                <div class="sitemap-category">
                    <h3><i class="fas fa-sign-in-alt"></i> Authentication</h3>
                    <ul>
                        <li><a href="auth/login.jsp"><i class="fas fa-sign-in-alt"></i> Login Page</a></li>
                        <li><a href="auth/register.jsp"><i class="fas fa-user-plus"></i> Registration Page</a></li>
                    </ul>
                </div>
                
                <div class="sitemap-category">
                    <h3><i class="fas fa-tachometer-alt"></i> Dashboard</h3>
                    <ul>
                        <li><a href="dashboard/dashboard.jsp"><i class="fas fa-chart-line"></i> Main Dashboard</a></li>
                    </ul>
                </div>
                
                <div class="sitemap-category">
                    <h3><i class="fas fa-users"></i> Clubs Management</h3>
                    <ul>
                        <li><a href="clubs/list.jsp"><i class="fas fa-list"></i> Clubs List</a></li>
                        <li><a href="clubs/create.jsp"><i class="fas fa-plus-circle"></i> Create Club</a></li>
                        <li><a href="clubs/details.jsp?id=1"><i class="fas fa-info-circle"></i> Club Details</a></li>
                        <li><a href="clubs/edit.jsp?id=1"><i class="fas fa-edit"></i> Edit Club</a></li>
                    </ul>
                </div>
                
                <div class="sitemap-category">
                    <h3><i class="fas fa-calendar"></i> Events Management</h3>
                    <ul>
                        <li><a href="events/list.jsp"><i class="fas fa-list"></i> Events List</a></li>
                        <li><a href="events/create.jsp"><i class="fas fa-plus-circle"></i> Create Event</a></li>
                    </ul>
                </div>
                
                <div class="sitemap-category">
                    <h3><i class="fas fa-user-friends"></i> Members</h3>
                    <ul>
                        <li><a href="members/list.jsp"><i class="fas fa-list"></i> Members List</a></li>
                    </ul>
                </div>
            </div>
            
            <div style="text-align: center; margin-top: 40px;">
                <a href="auth/login.jsp" class="button" style="font-size: 1.2rem; padding: 15px 50px;">
                    <i class="fas fa-rocket"></i> Launch Application
                </a>
            </div>
        </section>
    </main>
    
    <footer>
        <p>
            <a href="dashboard/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a> | 
            <a href="auth/login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a> | 
            <a href="auth/register.jsp"><i class="fas fa-user-plus"></i> Register</a>
        </p>
        <p style="margin-top: 15px;">
            &copy; 2025 University Club Management System | 
            Developed by Zhanyar Dldar, Danyal Soran, Yusf Mhamad
        </p>
        <p style="margin-top: 10px; font-size: 0.9rem; opacity: 0.8;">
            <i class="fas fa-code"></i> Built with Java MVC | 
            <i class="fas fa-database"></i> MySQL | 
            <i class="fas fa-server"></i> Apache Tomcat
        </p>
    </footer>
    
    <!-- Modern JavaScript -->
    <script src="assets/scripts.js"></script>
    
    <script>
        // Initialize animations
        document.addEventListener('DOMContentLoaded', function() {
            // Animate stats on scroll
            const stats = document.querySelectorAll('.stat-number');
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const stat = entry.target;
                        const target = parseInt(stat.textContent);
                        let current = 0;
                        const increment = target / 30;
                        const timer = setInterval(() => {
                            current += increment;
                            if (current >= target) {
                                current = target;
                                clearInterval(timer);
                            }
                            stat.textContent = Math.floor(current);
                        }, 50);
                        observer.unobserve(stat);
                    }
                });
            }, { threshold: 0.5 });
            
            stats.forEach(stat => observer.observe(stat));
            
            // Add click effects to feature cards
            document.querySelectorAll('.feature-card').forEach(card => {
                card.addEventListener('click', function() {
                    this.style.transform = 'scale(0.98)';
                    setTimeout(() => {
                        this.style.transform = 'translateY(-10px)';
                    }, 150);
                });
            });
            
            // Show welcome notification
            setTimeout(() => {
                if (window.UCMS && window.UCMS.showNotification) {
                    window.UCMS.showNotification('Welcome to University Club Management System!', 'success');
                }
            }, 1000);
        });
    </script>
</body>
</html>