🏋️ Kabaddi Players Management System

A web-based CRUD application built using Java, JSP, Servlets, JDBC, and MySQL that allows users to register, log in, and manage kabaddi player profiles.

This project follows the MVC (Model–View–Controller) architecture and demonstrates full-stack Java web development concepts.

🚀 Features
👤 User Features

User Registration

User Login & Logout

View Profile

Update Profile

Delete Own Account

🏋️ Player Management Features

View All Registered Players

Edit Player Details

Delete Player with Confirmation Page

Session-Based Authentication

🛠️ Technologies Used
Category	Technology
Backend	Java Servlets
Frontend	JSP, HTML5, CSS3, Bootstrap 5
Database	MySQL
Database Connectivity	JDBC
Server	Apache Tomcat
IDE	Eclipse
🏗️ Architecture

The project follows MVC architecture:

Model       → Student.java
DAO Layer   → StudentDAOInterface.java, StudentDAOImpl.java
Controller  → Servlets
View Layer  → JSP Pages
Utility     → DBConnection.java

📂 Project Structure
com.hostel
│
├── controller
│   ├── LoginController.java
│   ├── RegisterController.java
│   ├── UpdateController.java
│   ├── DeleteController.java
│   ├── UpdatePlayerServlet.java
│   ├── DeletePlayerServlet.java
│   └── ViewPlayersController.java
│
├── dao
│   ├── StudentDAOInterface.java
│   └── StudentDAOImpl.java
│
├── model
│   └── Student.java
│
├── utility
│   └── DBConnection.java
│
└── JSP Pages
    ├── index.jsp
    ├── login.jsp
    ├── register.jsp
    ├── home.jsp
    ├── profile.jsp
    ├── update.jsp
    ├── delete.jsp
    ├── viewPlayers.jsp
    ├── editPlayer.jsp
    └── deletePlayer.jsp

🗄️ Database Setup
Step 1: Create Database
CREATE DATABASE hosteldb;

Step 2: Create Table
USE hosteldb;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    username VARCHAR(100) UNIQUE,
    email VARCHAR(100),
    password VARCHAR(100)
);

⚙️ Configuration

Update database credentials in:

DBConnection.java

DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/hosteldb",
    "root",
    "root"
);


Replace with your MySQL username and password.

▶️ How to Run the Project

Import the project into Eclipse

Add MySQL Connector JAR to the project build path

Configure Apache Tomcat Server

Start Tomcat

Open browser and visit:

http://localhost:8080/YourProjectName/

🔐 Security Implementation

Session-based authentication

PreparedStatement (Prevents SQL Injection)

Form validation (Client-side)

Delete confirmation page

🔄 Application Flow
User Flow
Register → Login → Home → Profile → Update/Delete → Logout

Player Management Flow
Login → View Players → Edit/Delete → View Players

📌 Key Functionalities

Full CRUD Operations

Proper MVC separation

JDBC integration

Session handling

Clean Bootstrap UI

🔮 Future Improvements

Password hashing using BCrypt

Role-based authentication (Admin/User)

Search functionality

Pagination

Convert JSP scriptlets to JSTL

Upgrade to Spring Boot

👨‍💻 Author

Korrapolu Sasidhar Reddy
Java Full Stack Developer (Learning Phase)

📄 License

This project is created for educational purposes.
