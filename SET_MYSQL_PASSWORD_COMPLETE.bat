@echo off
echo ========================================
echo Setting MySQL Root Password to: root
echo ========================================
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
echo STEP 3: Setting password to 'root'...
mysql -u root <<EOF
USE mysql;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
FLUSH PRIVILEGES;
EXIT;
EOF

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! Password has been set!
    echo ========================================
    echo.
    echo MySQL root password is now: root
    echo.
    echo Now:
    echo 1. Close the "MySQL Safe Mode" window
    echo 2. Start MySQL from XAMPP Control Panel
    echo 3. Login to phpMyAdmin with:
    echo    Username: root
    echo    Password: root
) else (
    echo.
    echo ========================================
    echo ERROR: Could not set password
    echo ========================================
    echo.
    echo Try the manual method - see instructions.
    echo Check the MySQL Safe Mode window for errors.
)

echo.
pause

