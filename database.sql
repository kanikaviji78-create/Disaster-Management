CREATE DATABASE IF NOT EXISTS disaster_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE disaster_db;

CREATE TABLE IF NOT EXISTS users (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(150) NOT NULL UNIQUE,
 phone VARCHAR(30),
 password_hash VARCHAR(255) NOT NULL,
 role ENUM('user','admin') NOT NULL DEFAULT 'user',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS disaster_reports (
 id INT AUTO_INCREMENT PRIMARY KEY,
 user_id INT NOT NULL,
 disaster_type VARCHAR(80) NOT NULL,
 location VARCHAR(255) NOT NULL,
 severity ENUM('Low','Medium','High','Critical') NOT NULL DEFAULT 'Medium',
 description TEXT NOT NULL,
 image_path VARCHAR(255),
 status ENUM('Pending','Verified','In Progress','Resolved','Rejected') NOT NULL DEFAULT 'Pending',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS notifications (
 id INT AUTO_INCREMENT PRIMARY KEY,
 user_id INT NOT NULL,
 title VARCHAR(180) NOT NULL,
 message TEXT NOT NULL,
 is_read TINYINT(1) NOT NULL DEFAULT 0,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS alerts (
 id INT AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(180) NOT NULL,
 area VARCHAR(255) NOT NULL,
 severity ENUM('Low','Medium','High','Critical') NOT NULL DEFAULT 'High',
 message TEXT NOT NULL,
 active TINYINT(1) NOT NULL DEFAULT 1,
 created_by INT,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS rescue_teams (
 id INT AUTO_INCREMENT PRIMARY KEY,
 team_name VARCHAR(120) NOT NULL,
 contact_person VARCHAR(100) NOT NULL,
 phone VARCHAR(30) NOT NULL,
 specialty VARCHAR(120) NOT NULL,
 status ENUM('Available','Assigned','Offline') NOT NULL DEFAULT 'Available',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS assignments (
 id INT AUTO_INCREMENT PRIMARY KEY,
 report_id INT NOT NULL,
 team_id INT NOT NULL,
 instructions TEXT,
 status ENUM('Assigned','On the way','Completed') NOT NULL DEFAULT 'Assigned',
 assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (report_id) REFERENCES disaster_reports(id) ON DELETE CASCADE,
 FOREIGN KEY (team_id) REFERENCES rescue_teams(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS resources (
 id INT AUTO_INCREMENT PRIMARY KEY,
 resource_name VARCHAR(120) NOT NULL,
 category ENUM('Food','Water','Medicine','Shelter','Equipment','Other') NOT NULL DEFAULT 'Other',
 quantity INT NOT NULL DEFAULT 0,
 unit VARCHAR(40) NOT NULL DEFAULT 'units',
 storage_location VARCHAR(255) NOT NULL,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
