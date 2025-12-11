# Quick Setup Guide - Metro Ticket Booking System

## Step-by-Step Instructions

### Step 1: Install XAMPP
1. Download XAMPP from: https://www.apachefriends.org/
2. Install it (usually to `C:\xampp\`)

### Step 2: Start XAMPP Services
1. Open **XAMPP Control Panel**
2. Click **Start** button next to **Apache**
3. Click **Start** button next to **MySQL**
4. Both should show green "Running" status

### Step 3: Move Project to XAMPP
1. Copy this entire folder: `Metro Ticket Booking System`
2. Paste it into: `C:\xampp\htdocs\`
3. Optional: Rename it to `metro-booking` (shorter name)

### Step 4: Create Database
1. Open your browser
2. Go to: `http://localhost/phpmyadmin`
3. Click on **"Import"** tab (top menu)
4. Click **"Choose File"** button
5. Navigate to: `C:\xampp\htdocs\Metro Ticket Booking System\database\schema.sql`
6. Select the file and click **"Go"** button
7. Wait for "Import has been successfully finished" message

**Alternative Method (SQL Tab):**
1. Click on **"SQL"** tab in phpMyAdmin
2. Open `database/schema.sql` file in a text editor
3. Copy all the SQL code
4. Paste it in the SQL tab
5. Click **"Go"**

### Step 5: Access Your Application
1. Open your web browser
2. Go to: `http://localhost/Metro Ticket Booking System/`
   
   OR if you renamed it:
   `http://localhost/metro-booking/`

### Step 6: Test the Application

**Admin Login:**
- Go to Login page
- Select "Admin" from dropdown
- Username: `admin`
- Password: `admin123`

**User Account:**
- Click "Sign Up" to create a new account
- Fill in all details
- Then login and start booking tickets!

## Quick Troubleshooting

**❌ Apache/MySQL won't start:**
- Check if port 80 (Apache) or 3306 (MySQL) is already in use
- Close other applications using these ports (like Skype, other web servers)

**❌ Database connection error:**
- Make sure MySQL is running (green in XAMPP)
- Check `config/database.php` - default settings should work

**❌ Page shows "404 Not Found":**
- Make sure Apache is running
- Check the folder name in URL matches your folder name in htdocs
- Try: `http://localhost/` to see all folders

**❌ Login not working:**
- Make sure database was imported correctly
- Check phpMyAdmin shows `metro_booking` database
- Verify tables exist: users, admin, stations, routes, bookings

## Default Admin Credentials
- **Username:** admin
- **Password:** admin123

## Project URL
Once setup, access at:
```
http://localhost/Metro Ticket Booking System/
```

