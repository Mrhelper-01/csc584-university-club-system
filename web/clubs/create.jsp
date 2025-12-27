<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Club - University Club Management System</title>
    <link rel="stylesheet" href="../assets/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <%
        HttpSession userSession = request.getSession(false);
        if (userSession == null || userSession.getAttribute("user") == null) {
            response.sendRedirect("../auth/login.jsp");
            return;
        }
        
        User user = (User) userSession.getAttribute("user");
        String error = request.getParameter("error");
    %>
    
    <header>
        <h1><i class="fas fa-plus-circle"></i> Create New Club</h1>
        <p>Register a new student club in the system | Welcome, <%= user.getFullName() %></p>
    </header>
    
    <nav>
        <a href="../index.jsp"><i class="fas fa-home"></i> Home</a> &gt; 
        <a href="../dashboard/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a> &gt; 
        <a href="list.jsp"><i class="fas fa-users"></i> Clubs</a> &gt; Create Club
    </nav>
    
    <main>
        <section>
            <% if (error != null) { %>
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i> Failed to create club. Please try again!
                </div>
            <% } %>
            
            <h2><i class="fas fa-edit"></i> Create New Club</h2>
            
            <div class="form-placeholder">
                <form action="ClubServlet" method="POST" onsubmit="return validateForm()">
                    <input type="hidden" name="action" value="create">
                    
                    <div class="form-group">
                        <label for="name"><i class="fas fa-font"></i> Club Name:</label>
                        <input type="text" id="name" name="name" required 
                               placeholder="Enter club name (e.g., Computer Science Club)">
                    </div>
                    
                    <div class="form-group">
                        <label for="category"><i class="fas fa-tag"></i> Category:</label>
                        <select id="category" name="category" required>
                            <option value="">-- Select Category --</option>
                            <option value="Academic">Academic</option>
                            <option value="Arts">Arts</option>
                            <option value="Sports">Sports</option>
                            <option value="Cultural">Cultural</option>
                            <option value="Social">Social</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="description"><i class="fas fa-align-left"></i> Description:</label>
                        <textarea id="description" name="description" rows="5" 
                                  placeholder="Describe the club's purpose, activities, and goals..."></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label><i class="fas fa-cogs"></i> Additional Information:</label>
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                            <div>
                                <label for="meetingTime" style="font-size: 0.9rem;">Meeting Schedule:</label>
                                <input type="text" id="meetingTime" name="meetingTime" 
                                       placeholder="e.g., Every Tuesday 3-4 PM">
                            </div>
                            <div>
                                <label for="location" style="font-size: 0.9rem;">Meeting Location:</label>
                                <input type="text" id="location" name="location" 
                                       placeholder="e.g., Room 205, Tech Building">
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label><i class="fas fa-image"></i> Club Logo (Optional):</label>
                        <div style="border: 2px dashed #ddd; padding: 20px; text-align: center; border-radius: 8px;">
                            <i class="fas fa-cloud-upload-alt" style="font-size: 2rem; color: #3498db; margin-bottom: 10px;"></i>
                            <p>Drag & drop logo image here or click to browse</p>
                            <input type="file" id="logo" name="logo" accept="image/*" style="margin-top: 10px;">
                        </div>
                    </div>
                    
                    <div style="display: flex; gap: 15px; margin-top: 30px;">
                        <button type="submit" class="button">
                            <i class="fas fa-save"></i> Create Club
                        </button>
                        <a href="list.jsp" class="button" style="background: #95a5a6;">
                            <i class="fas fa-times"></i> Cancel
                        </a>
                        <button type="reset" class="button" style="background: #f39c12;">
                            <i class="fas fa-redo"></i> Reset Form
                        </button>
                    </div>
                </form>
            </div>
            
            <div class="info-message" style="margin-top: 30px;">
                <h3><i class="fas fa-lightbulb"></i> Tips for Club Creation:</h3>
                <ul>
                    <li><i class="fas fa-check"></i> Choose a descriptive and unique club name</li>
                    <li><i class="fas fa-check"></i> Select the most appropriate category</li>
                    <li><i class="fas fa-check"></i> Provide clear meeting schedule and location</li>
                    <li><i class="fas fa-check"></i> Upload a logo to make your club stand out</li>
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
        function validateForm() {
            const name = document.getElementById('name').value.trim();
            const category = document.getElementById('category').value;
            
            if (name.length < 3) {
                alert('Club name must be at least 3 characters long.');
                return false;
            }
            
            if (!category) {
                alert('Please select a category for the club.');
                return false;
            }
            
            return true;
        }
        
        // Preview image upload
        document.getElementById('logo').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const preview = document.createElement('img');
                    preview.src = e.target.result;
                    preview.style.maxWidth = '200px';
                    preview.style.maxHeight = '200px';
                    preview.style.marginTop = '10px';
                    preview.style.borderRadius = '8px';
                    
                    const uploadArea = document.querySelector('.form-group:last-child div');
                    uploadArea.innerHTML = '';
                    uploadArea.appendChild(preview);
                    uploadArea.innerHTML += '<p style="margin-top: 10px;">Logo selected: ' + file.name + '</p>';
                }
                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>