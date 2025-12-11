# Metro Ticket Booking System

A web-based metro ticket booking system built with HTML, CSS, JavaScript, PHP, and MySQL using XAMPP.
Based on https://github.com/HarshaMangipudi06/MetroTicketBookingSystem

## Features

- **User Authentication**: Sign up and login for both users and admins
- **Ticket Booking**: Book tickets from one station to another
- **Interactive Metro Map**: View the complete metro network with stations and routes
- **Fare Calculator**: Calculate ticket fare based on distance
- **Booking Management**: View booking history (users) and all bookings (admin)
- **Modern UI**: Clean and responsive design

## Prerequisites

- XAMPP (or any PHP/MySQL server)
- Web browser

## Setup Instructions

### 1. Install XAMPP

Download and install XAMPP from [https://www.apachefriends.org/](https://www.apachefriends.org/)

### 2. Start XAMPP Services

1. Open XAMPP Control Panel
2. Start **Apache** server
3. Start **MySQL** server

### 3. Database Setup

1. Open phpMyAdmin by visiting `http://localhost/phpmyadmin`
2. Import the database schema:
   - Go to phpMyAdmin
   - Click on "Import" tab
   - Choose the file `database/schema.sql`
   - Click "Go" to import

   OR manually execute the SQL file:
   - Copy the contents of `database/schema.sql`
   - Paste in SQL tab of phpMyAdmin
   - Execute

### 4. Project Setup

1. Copy the entire project folder to `C:\xampp\htdocs\` (or your XAMPP htdocs directory)
2. Rename the folder to `metro-booking` (or keep the original name)

### 5. Access the Application

Open your web browser and navigate to:
```
http://localhost/metro-booking/
```

Or if you kept the original folder name:
```
http://localhost/Metro Ticket Booking System/
```

## Default Login Credentials

### Admin Account
- Username: `admin`
- Password: `admin123`

### User Account
- Create a new account using the Sign Up page

## Project Structure

```
metro-booking/
├── api/                 # PHP API endpoints
│   ├── login.php
│   ├── signup.php
│   ├── book_ticket.php
│   ├── get_stations.php
│   ├── get_routes.php
│   ├── calculate_fare.php
│   ├── get_bookings.php
│   └── logout.php
├── config/              # Configuration files
│   └── database.php
├── css/                 # Stylesheets
│   └── style.css
├── js/                  # JavaScript files
│   ├── main.js
│   ├── auth.js
│   ├── booking.js
│   ├── dashboard.js
│   ├── admin.js
│   └── map.js
├── database/            # Database schema
│   └── schema.sql
├── index.html           # Home page
├── login.html           # Login page
├── signup.html          # Sign up page
├── booking.html         # Ticket booking page
├── dashboard.html       # User dashboard
├── admin.html           # Admin panel
├── map.html             # Metro map
└── README.md            # This file
```

## Features Details

### User Features
- Register new account
- Login to account
- Book metro tickets
- View booking history
- View metro map
- Calculate fare before booking

### Admin Features
- Login to admin panel
- View all bookings
- See user details for each booking

## Database Schema

The database includes the following tables:
- `users`: User accounts
- `admin`: Admin accounts
- `stations`: Metro stations
- `routes`: Connections between stations
- `bookings`: Ticket bookings

## Fare Calculation

Fare is calculated as:
- Base fare: ₹10
- Per kilometer: ₹2
- Total = Base fare + (Distance × Per km rate) × Number of tickets

## Notes

- The default admin password is hashed in the database. For demo purposes, use `admin123`
- Make sure MySQL is running before accessing the application
- All PHP files use sessions for authentication
- The project uses modern CSS with responsive design

## Troubleshooting

1. **Database connection error**: 
   - Check if MySQL is running in XAMPP
   - Verify database credentials in `config/database.php`

2. **Page not loading**:
   - Ensure Apache is running
   - Check the URL path matches your folder name

3. **Login not working**:
   - Verify the database was imported correctly
   - Check PHP session is enabled

## Technologies Used

- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Backend**: PHP 7.4+
- **Database**: MySQL
- **Server**: Apache (XAMPP)

## License

This project is created for educational purposes.

