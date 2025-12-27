```markdown
# University Club Management System 🎓

## 📋 Project Overview
A University Club Management System built using Java (JSP/Servlet) and web technologies for CSC584 - Enterprise Programming course.

## 🎯 Core Features
- ✅ User Authentication & Session Management
- ✅ Registration System with Validation
- ✅ Complete Clubs Management (CRUD Operations)
- ✅ Dashboard with Analytics & KPIs
- ✅ Events Management System
- ✅ Members Management
- ✅ Professional UI Design

---

# University Club Management System - Deliverable 2
## Enterprise Programming Final Project

### 📋 Project Information
- **Project Title:** University Club Management System
- **Course:** CSC584 - Enterprise Programming
- **Deliverable:** 2 (Functional Java MVC Web Application)
- **Team Members:**
  - Zhanyar Dldar
  - Danyal Soran  
  - Yusf Mhamad
- **Submission Date:** 27 - 12 - 2025

---

## 🚀 System Overview
A comprehensive web application for managing university clubs, memberships, events, and announcements using Java MVC architecture.

### 🎯 Core Features Implemented

#### 1. **User Authentication & Session Management** ✅
- **Login System:** Secure user authentication with session management
- **Registration:** User registration with server-side validation
- **Logout:** Proper session invalidation on logout
- **Protected Pages:** All CRUD operations require authenticated sessions

#### 2. **Registration with Validation** ✅
- Required field validation
- Email format validation
- Password confirmation and length validation
- Unique email verification
- Database persistence on successful registration

#### 3. **Clubs Management (CRUD Operations)** ✅
- **Create:** Add new university clubs
- **Read:** View clubs list and details
- **Update:** Edit existing club information
- **Delete:** Remove clubs from system
- **Complete JSP Pages:** list.jsp, create.jsp, edit.jsp, details.jsp

#### 4. **Dashboard & Analytics** ✅
- **KPIs Display:** Total Clubs, Active Members, Upcoming Events
- **Data Visualization:** Clubs list with complete information
- **Quick Actions:** Direct links to key functionalities
- **Dynamic Data:** Statistics retrieved from database

#### 5. **Events Management** ✅
- Event creation with date/time selection
- Club association for events
- Location and capacity management
- Event listing and details

#### 6. **Members Management** ✅
- View all club members
- Member details display
- Role-based access control
- Professional table design with icons

---

## 🏗️ Technical Architecture

### **MVC Pattern Implementation**
```
┌─────────────────────────────────────────────┐
│                    VIEW                     │
│         (JSP Pages - Presentation)          │
│  • login.jsp, register.jsp                  │
│  • dashboard.jsp                            │
│  • clubs/list.jsp, create.jsp, edit.jsp     │
│  • events/list.jsp, create.jsp              │
│  • members/list.jsp                         │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│                 CONTROLLER                  │
│         (Servlets - Business Logic)         │
│  • LoginServlet.java                       │
│  • RegisterServlet.java                    │
│  • LogoutServlet.java                      │
│  • DashboardServlet.java                   │
│  • ClubServlet.java                        │
│  • EventServlet.java                       │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│                   MODEL                     │
│      (JavaBeans & DAO - Data Layer)         │
│  • User.java, Club.java                    │
│  • UserDAO.java, ClubDAO.java              │
│  • DBConnection.java                       │
│  • MySQL Database                          │
└─────────────────────────────────────────────┘
```

### **Database Schema**
```sql
Database: university_club_db
Tables:
1. users (user_id, full_name, email, password, role)
2. clubs (club_id, name, description, category, created_by, created_at)
3. club_members (membership_id, club_id, user_id, role_in_club, joined_at)
4. events (event_id, club_id, title, description, event_date, location, max_attendees)
```

---

## 🛠️ Technology Stack
- **Frontend:** HTML5, CSS3, JSP, JavaScript, Font Awesome 6, Google Fonts (Poppins)
- **Backend:** Java Servlets, JavaBeans
- **Database:** MySQL
- **Server:** Apache Tomcat 10.1
- **IDE:** Apache NetBeans
- **Development Tools:** XAMPP, Git, GitHub
- **Version Control:** GitHub

---

## 📁 Project Structure
```
UniversityClubSystem/
├── 📁 Source Packages/
│   ├── 📁 controller/           # Servlets (Controller)
│   │   ├── LoginServlet.java
│   │   ├── RegisterServlet.java
│   │   ├── LogoutServlet.java
│   │   ├── DashboardServlet.java
│   │   ├── ClubServlet.java
│   │   └── EventServlet.java
│   ├── 📁 model/               # JavaBeans (Model)
│   │   ├── User.java
│   │   ├── Club.java
│   │   └── DBConnection.java
│   └── 📁 dao/                 # Data Access Objects
│       ├── UserDAO.java
│       └── ClubDAO.java
├── 📁 Web Pages/               # JSP Files (View)
│   ├── 📄 index.jsp            # Home page with sitemap
│   ├── 📁 auth/                # Authentication
│   │   ├── 📄 login.jsp
│   │   └── 📄 register.jsp
│   ├── 📁 dashboard/           # Dashboard
│   │   └── 📄 dashboard.jsp
│   ├── 📁 clubs/               # Clubs CRUD
│   │   ├── 📄 list.jsp
│   │   ├── 📄 create.jsp
│   │   ├── 📄 edit.jsp
│   │   └── 📄 details.jsp
│   ├── 📁 events/              # Events Management
│   │   ├── 📄 list.jsp
│   │   ├── 📄 create.jsp
│   │   ├── 📄 details.jsp
│   │   └── 📄 edit.jsp
│   ├── 📁 members/             # Members
│   │   └── 📄 list.jsp
│   └── 📁 assets/              # Static Resources
│       ├── 📄 styles.css
│       └── 📄 scripts.js
├── 📁 WEB-INF/
│   └── 📄 web.xml              # Deployment descriptor
├── 📄 README.md                # This file
└── 📄 university_club_db.sql   # Database schema
```

---

## 🔧 Installation & Setup

### **Prerequisites**
1. Java Development Kit (JDK) 25
2. Apache NetBeans IDE
3. XAMPP (Apache + MySQL)
4. Git (optional)

### **Step-by-Step Setup**

#### **1. Database Setup**
```sql
-- Start XAMPP and run these commands in phpMyAdmin:
CREATE DATABASE university_club_db;

USE university_club_db;

-- Users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) DEFAULT 'user'
);

-- Clubs table  
CREATE TABLE clubs (
    club_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

-- Club members table
CREATE TABLE club_members (
    membership_id INT PRIMARY KEY AUTO_INCREMENT,
    club_id INT,
    user_id INT,
    role_in_club VARCHAR(50) DEFAULT 'Member',
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Events table
CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    club_id INT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    event_date DATETIME NOT NULL,
    location VARCHAR(200),
    max_attendees INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id)
);

-- Insert sample data
INSERT INTO users (full_name, email, password, role) VALUES
('Admin User', 'admin@uni.edu', '123456', 'admin'),
('John Doe', 'john@uni.edu', '123456', 'user'),
('Jane Smith', 'jane@uni.edu', '123456', 'user');

INSERT INTO clubs (name, description, category, created_by) VALUES
('Computer Science Club', 'Programming and technology club', 'Academic', 1),
('Photography Club', 'Photography and art club', 'Arts', 2),
('Debate Club', 'Public speaking and debate club', 'Academic', 1);

INSERT INTO club_members (club_id, user_id, role_in_club) VALUES
(1, 2, 'President'),
(1, 3, 'Member'),
(2, 2, 'Treasurer');
```

#### **2. Project Import in NetBeans**
1. Open Apache NetBeans
2. **File → Open Project**
3. Select the `UniversityClubSystem` folder
4. Configure Tomcat server if prompted

#### **3. Configure Database Connection**
Edit `DBConnection.java` if needed:
```java
private static final String URL = "jdbc:mysql://localhost:3306/university_club_db";
private static final String USER = "root";
private static final String PASSWORD = ""; // Empty for XAMPP default
```

#### **4. Run the Application**
1. **Right-click** on project in NetBeans
2. Select **Clean and Build**
3. Select **Run**
4. Application opens at: `http://localhost:8080/UniversityClubSystem/`

---

## 🚀 How to Run

### Requirements:
- Apache Tomcat (9.0+)
- Java JDK (11+)
- Web browser

### Steps:
1. **Download the project:**
```bash
git clone https://github.com/Mrhelper-01/csc584-university-club-system.git
```

2. **Open in IDE:**
   - Import project into NetBeans
   - Configure Tomcat server
   - Verify port 8080

3. **Launch:**
   - Navigate to `http://localhost:8080/UniversityClubSystem/`
   - Create new user via registration
   - Login with credentials

---

## 👤 Default Login Credentials
```
Administrator:
Email: admin@uni.edu
Password: 123456

Regular User:
Email: john@uni.edu  
Password: 123456

Test User:
Email: jane@uni.edu
Password: 123456
```

---

## 🖥 Main Pages

### 1. **Home Page (`index.jsp`)**
- System overview
- Links to login and registration
- General information about university clubs

### 2. **Login Page (`auth/login.jsp`)**
- User authentication system
- Link to registration page
- Password recovery option

### 3. **Registration Page (`auth/register.jsp`)**
- New user registration
- Personal information collection
- Link to login page

### 4. **Dashboard (`dashboard/dashboard.jsp`)**
- Main page for administrators
- Key Performance Indicators
- Quick action links
- Session persistence

### 5. **Members Page (`members/list.jsp`)**
- List of all club members
- Member details (name, email, club, role, join date, status)
- Professional table design with icons

### 6. **Clubs Management (`clubs/`)**
- `list.jsp` - List of all clubs
- `create.jsp` - Create new club
- `edit.jsp` - Edit existing club
- `details.jsp` - View club details

### 7. **Events Management (`events/`)**
- `list.jsp` - List of all events
- `create.jsp` - Create new event
- `edit.jsp` - Edit existing event
- `details.jsp` - View event details

---

## 🧪 Testing Guide

### **Test Scenarios**
1. **Registration Flow**
   - Navigate to: `http://localhost:8080/UniversityClubSystem/auth/register.jsp`
   - Create new account
   - Verify email validation
   - Test duplicate email prevention

2. **Login Flow**
   - Use credentials above
   - Verify session creation
   - Test protected page access
   - Verify logout functionality

3. **Clubs CRUD Operations**
   - Create new club
   - View club list
   - Edit existing club
   - Delete club (with confirmation)
   - View club details

4. **Events Management**
   - Create new event
   - Associate with club
   - Set date/time and location
   - View event list
   - Edit existing event

5. **Dashboard Features**
   - Verify KPI displays (Total Clubs, Active Members, Upcoming Events)
   - Test quick action links
   - Check session persistence
   - Verify responsive design

6. **Members Page**
   - View all members
   - Check member details
   - Verify table sorting
   - Test responsive layout

---

## 📊 Compliance with Requirements

### **Deliverable 2 Requirements Met**
| Requirement | Status | Notes |
|------------|--------|-------|
| Login/Logout with Session Management | ✅ Complete | JSP + Servlet + Session |
| Registration with Validation | ✅ Complete | Server-side validation |
| One Full CRUD Entity | ✅ Complete | Clubs management |
| Dashboard with KPIs | ✅ Complete | 3 KPIs + data display |
| MVC Architecture | ✅ Complete | Clear separation |
| Database Integration | ✅ Complete | MySQL with 4+ tables |
| GitHub Collaboration | ✅ Complete | Repository maintained |

### **Additional Features**
- Responsive CSS styling
- Form validation (client + server side)
- Error handling and user feedback
- Breadcrumb navigation
- Session timeout handling
- Professional UI design with Font Awesome icons
- Google Fonts integration
- JavaScript functionality
- Cross-browser compatibility

---

## 🎨 Technologies & Libraries

### Frontend:
- **HTML5** - Page structure
- **CSS3** - Styling and layout
- **JavaScript** - Page functionality
- **Font Awesome 6** - Icons
- **Google Fonts (Poppins)** - Main font

### Backend:
- **Java (JSP/Servlet)** - Application logic
- **Apache Tomcat** - Web server

### CSS File (`assets/styles.css`):
```css
/* Global styles */
* {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Header styling */
header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 30px;
    border-radius: 10px;
    margin-bottom: 20px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

/* Table styling */
table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    border-radius: 10px;
    overflow: hidden;
}

/* Navigation styling */
nav {
    background: #f8f9fa;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 25px;
    border-left: 4px solid #667eea;
}

/* Button styling */
.btn-primary {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: transform 0.2s;
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}
```

---

## 🎥 Demo Video Content
**Duration:** 5-8 minutes  
**Language:** English  
**Required Sections:**

1. **Project Introduction** (30 seconds)
   - Team introduction
   - Project overview and purpose

2. **System Walkthrough** (4 minutes)
   - Registration process demonstration
   - Login and logout functionality
   - Dashboard features and KPIs
   - Complete Clubs CRUD operations
   - Events management demonstration
   - Members page showcase

3. **Technical Architecture** (1 minute)
   - MVC pattern explanation
   - Database structure overview
   - Code structure walkthrough

4. **Conclusion** (30 seconds)
   - Features summary
   - Team reflection and learnings

---

## 📦 Submission Files
1. **Complete Project Source Code** (ZIP file)
2. **Database SQL File** (`university_club_db.sql`)
3. **README.md** (This document)
4. **Demo Video** (MP4 or YouTube link)
5. **GitHub Repository Link**

---

## 🔗 GitHub Repository
```
https://github.com/Mrhelper-01/csc584-university-club-system.git
```

**Commit History:**
- Initial storyboard implementation
- Database schema creation
- MVC architecture implementation
- CRUD functionality for clubs
- Events management module
- Members management page
- Dashboard implementation
- Final testing and bug fixes

---

## ❓ Troubleshooting

### **Common Issues & Solutions**

#### **1. Database Connection Error**
```
Error: Database connection failed
```
**Solution:**
- Ensure XAMPP MySQL is running (Apache and MySQL services)
- Verify database name in `DBConnection.java`
- Check MySQL credentials
- Test connection using phpMyAdmin

#### **2. 404 Error on Servlets**
```
Error: The requested resource is not available
```
**Solution:**
- Clean and rebuild project in NetBeans
- Check @WebServlet annotations
- Verify Tomcat deployment
- Check WEB-INF/web.xml configuration

#### **3. JSP Page Not Loading**
```
Error: HTTP Status 500 - Internal Server Error
```
**Solution:**
- Check JSP syntax errors
- Verify import statements in JSP files
- Ensure all required Java classes are compiled
- Check console for detailed error messages

#### **4. Session Issues**
```
Error: Session not persisting between pages
```
**Solution:**
- Check session creation in LoginServlet
- Verify session attributes are properly set
- Ensure proper redirects (not forwards) after login
- Check session timeout configuration

#### **5. CSS/JS Not Loading**
```
Error: Styles or scripts not applied
```
**Solution:**
- Check file paths in link and script tags
- Verify assets folder structure
- Check browser console for 404 errors
- Clear browser cache (Ctrl+F5)

---

## 👥 Team Contributions

### **Zhanyar Dldar**
- Project architecture design
- Database schema implementation
- Core servlet development (Login, Register, Logout, Dashboard)
- GitHub repository management
- Code review and integration

### **Danyal Soran**
- JSP page development (all pages)
- CSS styling and UI design
- Form validation implementation (client and server side)
- Testing and debugging
- Responsive design implementation

### **Yusf Mhamad**
- Documentation preparation (README, user guide)
- Demo video creation and editing
- Additional feature implementation (members page, events)
- Quality assurance testing
- Presentation preparation

---

## 📚 References & Resources
1. Oracle Java EE Documentation
2. MySQL Official Documentation
3. Apache Tomcat User Guide
4. W3Schools JSP & Servlet Tutorials
5. MDN Web Docs (HTML, CSS, JavaScript)
6. Font Awesome Documentation
7. Google Fonts Documentation

---

## 📞 Support & Contact
For any issues or questions regarding this project, please contact the development team through:
- University Learning Management System (LMS)
- GitHub : `(https://github.com/Mrhelper-01/csc584-university-club-system.git)`
- Email: Team members' university email addresses

---

## 📝 Changelog

### Version 1.0 (December 2025)
✅ **Authentication System** - Complete  
✅ **Registration with Validation** - Complete  
✅ **Dashboard with KPIs** - Complete  
✅ **Clubs CRUD Operations** - Complete  
✅ **Events Management** - Complete  
✅ **Members Management** - Complete  
✅ **Database Integration** - Complete  
✅ **Professional UI/UX** - Complete  
✅ **Documentation** - Complete  

---

**Developed with ❤️ by Team CSC584 - University Club Management System**

*© 2024 University Club Management System Team. All rights reserved.*
*Last Updated: December 2025*
```
