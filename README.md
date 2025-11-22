
# University Club Management System

Central platform for managing university club memberships, activities, and announcements.

---

## Project Overview

University Club Management System is a JSP-based web application that helps manage clubs, events, members, and announcements in a university environment.  
It provides authentication, a dashboard with KPIs, and modules for clubs, events, and member views.

---

## Team & Course Information

- **Team Members:**
  - Zhanyar Dldar  
  - Danyal Soran  
  - Yusf Mhamad  

- **Course:** Enterprise Programming (CSC584) 
- **Deliverable 1:** Storyboard + Database ERD  
- **Due Date:** Week 8  
- **University:** qaiwan international universty  
- **Date:** November 2025  

---

## Features

- **User Authentication**
  - Login and registration pages.
  - Basic structure ready for integrating Java Servlets and MySQL.

- **Dashboard**
  - `dashboard.jsp` with KPI and chart placeholders.
  - Designed to later show statistics such as total clubs, members, and upcoming events.

- **Clubs Management (Full CRUD)**
  - List all clubs.
  - Create new clubs.
  - View club details.
  - Edit existing clubs.
  - Structure ready for connecting to database via Servlets/DAO.

- **Events Management**
  - Create and list events.
  - Details and edit pages prepared for future logic.
  - Linked to clubs conceptually through ERD.

- **Members Management**
  - View list of club members.
  - Designed to use `club_members` table from database.

- **Responsive Design**
  - Layout and CSS prepared to work on desktop, tablet, and mobile.
  - Central stylesheet in `assets/styles.css`.

---

## Project Structure

```
UniversityClubSystem/
├── index.jsp                      # Home page with sitemap
├── auth/
│   ├── login.jsp                  # Login page
│   └── register.jsp               # Registration page
├── dashboard/
│   └── dashboard.jsp              # Dashboard with KPIs and charts
├── clubs/
│   ├── list.jsp                   # Clubs list
│   ├── create.jsp                 # Create new club
│   ├── details.jsp                # Club details
│   └── edit.jsp                   # Edit club
├── events/
│   ├── list.jsp                   # Events list
│   ├── create.jsp                 # Create new event
│   ├── details.jsp                # Event details
│   └── edit.jsp                   # Edit event
├── members/
│   └── list.jsp                   # Members list
├── assets/
│   └── styles.css                 # CSS stylesheet
└── ERD-University-Club-Management.png   # Database diagram
```

---

## Technologies Used

- **Frontend:** HTML5, CSS3, JSP  
- **Backend:** Java Servlets (placeholders – to be implemented)  
- **Database:** MySQL (ERD designed, can be generated from `ERD-University-Club-Management.png`)  
- **Server:** Apache Tomcat  
- **IDE:** Apache NetBeans  

---

## How to Run

1. Open **Apache NetBeans**.  
2. Import or open the `UniversityClubSystem` project folder.  
3. Configure **Apache Tomcat** as the application server in NetBeans.  
4. Deploy the project to Tomcat (Clean and Build → Run).  
5. Open a browser and go to:  

   `http://localhost:8080/UniversityClubSystem/`

> Note: In this deliverable, backend logic and database connectivity can be added later; current focus is storyboard, navigation, and ERD.

---

## Navigation Guide

1. **Home / Sitemap**
   - Start at `index.jsp`.  
   - Provides links to authentication, dashboard, clubs, events, and members pages.

2. **Authentication**
   - `auth/login.jsp` – Login page.  
   - `auth/register.jsp` – User registration page.  
   - After successful login, user is directed to the dashboard.

3. **Dashboard**
   - `dashboard/dashboard.jsp` – Shows KPI placeholders and chart areas.  
   - Acts as central hub to navigate to:
     - Clubs
     - Events
     - Members

4. **Clubs Module**
   - `clubs/list.jsp` – View existing clubs.  
   - `clubs/create.jsp` – Create a new club.  
   - `clubs/details.jsp` – View specific club details.  
   - `clubs/edit.jsp` – Edit club details.

5. **Events Module**
   - `events/list.jsp` – List all events.  
   - `events/create.jsp` – Create new event.  
   - `events/details.jsp` – View event details.  
   - `events/edit.jsp` – Edit event information.

6. **Members Module**
   - `members/list.jsp` – View members associated with clubs.

---

## Database Design

The database is modeled in `ERD-University-Club-Management.png` and includes 6 main tables:

- `users`
  - Stores application users (credentials, roles, etc.).

- `clubs`
  - Contains data for each club (name, description, creation date, etc.).

- `club_members`
  - Many-to-many relationship between users and clubs.
  - Attributes may include role in club, join date, status.

- `events`
  - Events organized by clubs (title, date, time, location, club_id, etc.).

- `event_attendance`
  - Tracks which members attend which events.

- `announcements`
  - Announcements related to clubs or events (title, message, created_at, club_id/event_id).

**Relationships & Constraints (examples):**

- `users.id` is primary key; referenced by `club_members.user_id` and `event_attendance.user_id`.  
- `clubs.id` is primary key; referenced by `club_members.club_id`, `events.club_id`, and possibly `announcements.club_id`.  
- `events.id` is primary key; referenced by `event_attendance.event_id` and possibly `announcements.event_id`.  

For full cardinalities and attributes, see `ERD-University-Club-Management.png`.

---

## Assignment Requirements Checklist

- ✅ All main pages and subpages created (index, auth, dashboard, clubs, events, members).  
- ✅ Navigation links between pages implemented.  
- ✅ Clear page titles and purposes for each JSP.  
- ✅ Dashboard page with KPI and chart placeholders.  
- ✅ One full CRUD entity implemented: **Clubs**.  
- ✅ Second module **Events** with list and create pages (details/edit pages prepared).  
- ✅ Database ERD with ≥ 4 tables (designed with 6 tables).  
- ✅ Proper primary keys and foreign keys defined in ERD.

---

## Submission Contents

- `storyboard.zip`  
  - Complete project source code (`UniversityClubSystem/` structure above).  

- `ERD-University-Club-Management.png`  
  - Full database ERD for the system.

---

## Future Enhancements

- Implement full Java Servlet + DAO layer for:
  - Clubs CRUD connected to MySQL.  
  - Events and Members modules with real data.  

- Add role-based access:
  - Admin (manage clubs, events, announcements).  
  - Normal user/member (view & register/join).  

- Integrate real-time dashboard KPIs:
  - Total clubs, active members, upcoming events, recent announcements.  

- Enhance validation and security:
  - Form validation (client + server side).  
  - Password hashing, sessions, and access control.

---

**Developed by:** Zhanyar Dldar • Danyal Soran • Yusf Mhamad  
**Course:** CSC584 – Web Programming  
**University:** qaiwan international universty  
**Date:** November 2025
```

