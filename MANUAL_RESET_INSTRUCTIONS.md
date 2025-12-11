# Manual MySQL Password Reset - Step by Step

## Method 1: Using MySQL Command Line (Most Reliable)

### Step 1: Stop MySQL
- Open **XAMPP Control Panel**
- Click **Stop** button next to MySQL
- Wait until it shows "Stopped"

### Step 2: Open Command Prompt as Administrator
- Press `Windows Key + X`
- Click **"Windows PowerShell (Admin)"** or **"Command Prompt (Admin)"**
- Click **Yes** if prompted

### Step 3: Navigate to MySQL bin folder
Type this command and press Enter:
```cmd
cd C:\xampp\mysql\bin
```

### Step 4: Start MySQL in Safe Mode
Type this command and press Enter:
```cmd
mysqld --skip-grant-tables --skip-networking --console
```

**IMPORTANT:** Keep this window open! Don't close it.

### Step 5: Open a NEW Command Prompt Window
- Press `Windows Key + X` again
- Open another **Command Prompt (Admin)**
- Navigate to MySQL:
```cmd
cd C:\xampp\mysql\bin
```

### Step 6: Connect to MySQL
Type this and press Enter:
```cmd
mysql -u root
```

### Step 7: Reset the Password
In the MySQL prompt (you'll see `mysql>`), type these commands one by one:

```sql
USE mysql;
```

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
```

```sql
UPDATE user SET plugin='mysql_native_password' WHERE user='root';
```

```sql
FLUSH PRIVILEGES;
```

```sql
EXIT;
```

### Step 8: Close Both Command Prompt Windows
- Close the MySQL safe mode window (the one with `mysqld`)
- Close the second command prompt window

### Step 9: Start MySQL from XAMPP
- Go back to **XAMPP Control Panel**
- Click **Start** button next to MySQL
- Wait until it shows "Running"

### Step 10: Test phpMyAdmin
- Go to: `http://localhost/phpmyadmin`
- Username: `root`
- Password: (leave completely blank)
- Click **Go**

---

## Method 2: If Method 1 Doesn't Work

If you still get "Access Denied", try this alternative command in Step 7:

Instead of `ALTER USER`, use:
```sql
UPDATE user SET authentication_string='' WHERE user='root' AND host='localhost';
UPDATE user SET plugin='mysql_native_password' WHERE user='root' AND host='localhost';
FLUSH PRIVILEGES;
EXIT;
```

---

## Troubleshooting

**Problem:** "mysqld is not recognized"
- Make sure you're in the correct directory: `C:\xampp\mysql\bin`
- Check if XAMPP is installed in `C:\xampp\`

**Problem:** "Access denied" in safe mode
- Make sure MySQL is completely stopped in XAMPP
- Wait a few seconds after stopping before starting safe mode

**Problem:** Still can't login after reset
- Try restarting your computer
- Make sure you closed both command prompt windows
- Check if MySQL started successfully in XAMPP

