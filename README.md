# Disaster Management System — BATCH-16

A responsive web application using **Node.js, Express, MySQL, HTML, CSS and JavaScript**. It follows the modules in the project presentation.

## Included modules
- Registration and login with role-based admin access
- Dashboard with incident, alert, team and resource summaries
- Disaster reports, optional image upload and report status tracking
- Emergency alerts
- Rescue team records and assignments
- Relief resource inventory
- Database-backed in-app notifications with read/unread status
- CSV report export for administrators

**Notifications remain inside the application.** This project does not send Gmail, SMS, WhatsApp or external rescue-team messages.

## Requirements
- Node.js (LTS recommended)
- XAMPP MySQL (Apache is not required for this Node.js application)
- A browser

## Setup on Windows
1. Extract this ZIP into a folder, for example `C:\disaster_management_system`.
2. Open XAMPP Control Panel and start **MySQL**.
3. Open `http://localhost/phpmyadmin`. If your XAMPP MySQL uses a different port, use that configured port.
4. Select **Import**, choose the included `database.sql`, and run the import. It creates `disaster_db` and the required tables.
5. In the project folder, copy `.env.example` to a new file named `.env`. For a default XAMPP installation, `DB_USER=root` and `DB_PASSWORD=` (empty) usually work. If your MySQL password or port differs, update `.env`.
6. Open PowerShell or the VS Code terminal in the project folder and run:

   ```bash
   npm install
   npm run seed-admin
   npm start
   ```

7. Open **http://localhost:3000** in your browser. Keep the terminal open while using the app.

## Demo administrator
- Email: `admin@disaster.local`
- Password: `Admin@123`

Use the admin account to create alerts, manage teams and resources, assign teams, change report status and export CSV reports. Register a separate normal account to test disaster reporting and notifications.

## How to test the output
1. Sign in as the admin and add a rescue team and a few relief resources.
2. Sign out and register a normal user.
3. Submit a flood/fire/other disaster report. It is stored in MySQL and creates an in-app notification for the reporter and admin.
4. Sign in as admin; review the report, change its status, or assign an available team.
5. Publish an emergency alert. Users see the alert in the Alerts module and receive a database-backed in-app notification.
6. Open Notifications and click **Mark read** or **Mark all as read**. Unread counts update on the dashboard/sidebar.
7. Export reports as CSV while signed in as admin.

## Notes
- This is a classroom project starter, not a production emergency-response service. Do not rely on it for real emergencies.
- The upload folder is `public/uploads/`; uploaded images are optional and limited to 4 MB.
- If the app reports a database error, confirm MySQL is running, `database.sql` was imported, and `.env` matches your local MySQL settings.
