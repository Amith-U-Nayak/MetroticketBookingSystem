# Reset MySQL Root Password to Empty

## Method 1: Using MySQL Command Line (Recommended)

**Step 1:** Stop MySQL in XAMPP Control Panel
- Open XAMPP Control Panel
- Click **Stop** next to MySQL

**Step 2:** Start MySQL in safe mode
1. Open Command Prompt as Administrator
2. Navigate to MySQL bin folder:
   ```
   cd C:\xampp\mysql\bin
   ```
3. Start MySQL with skip-grant-tables:
   ```
   mysqld --skip-grant-tables --console
   ```
4. Keep this window open

**Step 3:** Open a NEW Command Prompt window
1. Navigate to MySQL bin:
   ```
   cd C:\xampp\mysql\bin
   ```
2. Connect to MySQL:
   ```
   mysql -u root
   ```
3. Run these commands:
   ```sql
   USE mysql;
   UPDATE user SET authentication_string='' WHERE user='root';
   FLUSH PRIVILEGES;
   EXIT;
   ```
4. Close both Command Prompt windows

**Step 4:** Start MySQL normally from XAMPP Control Panel
- Click **Start** next to MySQL

**Step 5:** Refresh phpMyAdmin
- Go to http://localhost/phpmyadmin
- Should connect without password now!

---

## Method 2: Quick Fix - Edit phpMyAdmin Config

If Method 1 is too complex, we can try changing phpMyAdmin authentication method.

