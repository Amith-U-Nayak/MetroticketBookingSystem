@echo off
echo ========================================
echo MySQL Password Reset Script
echo ========================================
echo.
echo This will reset MySQL root password to EMPTY (no password)
echo.
echo STEP 1: Make sure MySQL is STOPPED in XAMPP Control Panel
echo Press any key AFTER you've stopped MySQL...
pause > nul

echo.
echo STEP 2: Starting MySQL in safe mode...
cd C:\xampp\mysql\bin

start "MySQL Safe Mode" cmd /k "title MySQL Safe Mode - DO NOT CLOSE & mysqld --skip-grant-tables --skip-networking --console"

echo Waiting 5 seconds for MySQL to start...
timeout /t 5 /nobreak > nul

echo.
echo STEP 3: Resetting password...
mysql -u root <<EOF
USE mysql;
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
UPDATE user SET plugin='mysql_native_password' WHERE user='root' AND host='localhost';
FLUSH PRIVILEGES;
EXIT;
EOF

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! Password has been reset!
    echo ========================================
    echo.
    echo Now:
    echo 1. Close the "MySQL Safe Mode" window
    echo 2. Start MySQL from XAMPP Control Panel
    echo 3. Refresh phpMyAdmin and login with root (no password)
) else (
    echo.
    echo ========================================
    echo ERROR: Could not reset password
    echo ========================================
    echo.
    echo Try the manual method instead.
    echo Check the MySQL Safe Mode window for errors.
)

echo.
pause

