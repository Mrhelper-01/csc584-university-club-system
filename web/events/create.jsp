<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Event - University Club Management System</title>
    <link rel="stylesheet" href="../assets/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        .datetime-picker {
            display: flex;
            gap: 10px;
        }
        .datetime-picker input {
            flex: 1;
        }
        .capacity-meter {
            margin-top: 10px;
        }
        .capacity-slider {
            width: 100%;
            height: 8px;
            background: #ecf0f1;
            border-radius: 4px;
            margin-top: 10px;
        }
        .capacity-labels {
            display: flex;
            justify-content: space-between;
            margin-top: 5px;
            font-size: 0.9rem;
            color: #7f8c8d;
        }
    </style>
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
        String success = request.getParameter("success");
    %>
    
    <header>
        <h1><i class="fas fa-calendar-plus"></i> Create New Event</h1>
        <p>Schedule a new club event or activity | Welcome, <%= user.getFullName() %></p>
    </header>
    
    <nav>
        <a href="../index.jsp"><i class="fas fa-home"></i> Home</a> &gt; 
        <a href="../dashboard/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a> &gt; 
        <a href="list.jsp"><i class="fas fa-calendar-alt"></i> Events</a> &gt; Create Event
    </nav>
    
    <main>
        <section>
            <% if (error != null) { %>
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i> Failed to create event. Please try again!
                </div>
            <% } %>
            
            <% if (success != null) { %>
                <div class="success-message">
                    <i class="fas fa-check-circle"></i> Event created successfully!
                </div>
            <% } %>
            
            <h2><i class="fas fa-calendar-check"></i> Create Event Form</h2>
            
            <div class="form-placeholder">
                <form id="eventForm" onsubmit="handleFormSubmit(event)">
                    <div class="form-group">
                        <label for="title"><i class="fas fa-heading"></i> Event Title:</label>
                        <input type="text" id="title" name="title" required 
                               placeholder="Enter event title (e.g., Hackathon 2024)">
                    </div>
                    
                    <div class="form-group">
                        <label for="club"><i class="fas fa-users"></i> Select Club:</label>
                        <select id="club" name="club" required>
                            <option value="">-- Select a Club --</option>
                            <option value="1">Computer Science Club</option>
                            <option value="2">Photography Club</option>
                            <option value="3">Sports Club</option>
                            <option value="4">Business Club</option>
                            <option value="5">Music Club</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="description"><i class="fas fa-align-left"></i> Event Description:</label>
                        <textarea id="description" name="description" rows="4" 
                                  placeholder="Describe the event purpose, agenda, and activities..."></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label><i class="fas fa-calendar-day"></i> Date & Time:</label>
                        <div class="datetime-picker">
                            <input type="date" id="eventDate" name="eventDate" required>
                            <input type="time" id="eventTime" name="eventTime" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="location"><i class="fas fa-map-marker-alt"></i> Location:</label>
                        <input type="text" id="location" name="location" required 
                               placeholder="Enter event location (e.g., Tech Building Room 101)">
                    </div>
                    
                    <div class="form-group">
                        <label for="maxAttendees"><i class="fas fa-user-friends"></i> Maximum Attendees:</label>
                        <input type="range" id="maxAttendees" name="maxAttendees" min="1" max="500" value="50" 
                               oninput="updateCapacity(this.value)">
                        <div class="capacity-meter">
                            <div id="capacityValue" style="font-weight: bold; color: #3498db;">50</div>
                            <div class="capacity-slider"></div>
                            <div class="capacity-labels">
                                <span>Small (1-50)</span>
                                <span>Medium (51-200)</span>
                                <span>Large (201-500)</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label><i class="fas fa-image"></i> Event Image (Optional):</label>
                        <div style="border: 2px dashed #ddd; padding: 20px; text-align: center; border-radius: 8px; cursor: pointer;" 
                             onclick="document.getElementById('imageUpload').click()" id="imageDropArea">
                            <i class="fas fa-cloud-upload-alt" style="font-size: 2rem; color: #3498db; margin-bottom: 10px;"></i>
                            <p>Click to upload event image or drag & drop here</p>
                            <input type="file" id="imageUpload" name="image" accept="image/*" style="display: none;" 
                                   onchange="previewImage(this)">
                        </div>
                        <div id="imagePreview" style="margin-top: 10px; display: none;">
                            <img id="previewImage" style="max-width: 200px; max-height: 150px; border-radius: 8px;">
                        </div>
                    </div>
                    
                    <div style="display: flex; gap: 15px; margin-top: 30px;">
                        <button type="submit" class="button">
                            <i class="fas fa-save"></i> Create Event
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
                <h3><i class="fas fa-lightbulb"></i> Event Creation Tips:</h3>
                <ul>
                    <li><i class="fas fa-check"></i> Choose a clear and descriptive title</li>
                    <li><i class="fas fa-check"></i> Set realistic maximum attendees based on venue capacity</li>
                    <li><i class="fas fa-check"></i> Provide detailed description including agenda</li>
                    <li><i class="fas fa-check"></i> Upload an eye-catching image for better engagement</li>
                    <li><i class="fas fa-check"></i> Double-check date, time, and location before submitting</li>
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
        // Set minimum date to today
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('eventDate').min = today;
        document.getElementById('eventDate').value = today;
        
        // Set default time to next hour
        const now = new Date();
        const nextHour = new Date(now.getTime() + 60 * 60 * 1000);
        const hours = nextHour.getHours().toString().padStart(2, '0');
        const minutes = nextHour.getMinutes().toString().padStart(2, '0');
        document.getElementById('eventTime').value = `${hours}:${minutes}`;
        
        function updateCapacity(value) {
            document.getElementById('capacityValue').textContent = value;
            
            // Update slider background based on value
            const slider = document.querySelector('.capacity-slider');
            let color;
            if (value <= 50) color = '#2ecc71';
            else if (value <= 200) color = '#f39c12';
            else color = '#e74c3c';
            
            slider.style.background = `linear-gradient(90deg, ${color} ${value/5}%, #ecf0f1 ${value/5}%)`;
        }
        
        function previewImage(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('previewImage').src = e.target.result;
                    document.getElementById('imagePreview').style.display = 'block';
                    document.getElementById('imageDropArea').innerHTML = `
                        <i class="fas fa-check-circle" style="font-size: 2rem; color: #2ecc71; margin-bottom: 10px;"></i>
                        <p>Image selected: ${input.files[0].name}</p>
                    `;
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        
        function handleFormSubmit(event) {
            event.preventDefault();
            
            const formData = {
                title: document.getElementById('title').value.trim(),
                club: document.getElementById('club').value,
                description: document.getElementById('description').value.trim(),
                date: document.getElementById('eventDate').value,
                time: document.getElementById('eventTime').value,
                location: document.getElementById('location').value.trim(),
                maxAttendees: document.getElementById('maxAttendees').value
            };
            
            // Validation
            if (!formData.title) {
                alert('Please enter an event title.');
                return;
            }
            
            if (!formData.club) {
                alert('Please select a club.');
                return;
            }
            
            if (!formData.location) {
                alert('Please enter a location.');
                return;
            }
            
            // Show success message
            if (window.UCMS && window.UCMS.showNotification) {
                window.UCMS.showNotification('Event created successfully!', 'success');
            } else {
                alert('Event created successfully!\n\nTitle: ' + formData.title + 
                      '\nDate: ' + formData.date + ' at ' + formData.time +
                      '\nLocation: ' + formData.location +
                      '\nMax Attendees: ' + formData.maxAttendees);
            }
            
            // Redirect to events list after 2 seconds
            setTimeout(() => {
                window.location.href = 'list.jsp?success=1';
            }, 2000);
        }
        
        // Initialize capacity slider
        updateCapacity(50);
        
        // Drag and drop for image upload
        const dropArea = document.getElementById('imageDropArea');
        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            dropArea.addEventListener(eventName, preventDefaults, false);
        });
        
        function preventDefaults(e) {
            e.preventDefault();
            e.stopPropagation();
        }
        
        ['dragenter', 'dragover'].forEach(eventName => {
            dropArea.addEventListener(eventName, highlight, false);
        });
        
        ['dragleave', 'drop'].forEach(eventName => {
            dropArea.addEventListener(eventName, unhighlight, false);
        });
        
        function highlight() {
            dropArea.style.borderColor = '#3498db';
            dropArea.style.background = '#f0f8ff';
        }
        
        function unhighlight() {
            dropArea.style.borderColor = '#ddd';
            dropArea.style.background = '';
        }
        
        dropArea.addEventListener('drop', handleDrop, false);
        
        function handleDrop(e) {
            const dt = e.dataTransfer;
            const files = dt.files;
            document.getElementById('imageUpload').files = files;
            previewImage(document.getElementById('imageUpload'));
        }
    </script>
</body>
</html>