@echo off
echo ========================================
echo Resetting MySQL Root Password
echo ========================================
echo.
echo IMPORTANT: Stop MySQL in XAMPP Control Panel FIRST!
echo Then press any key to continue...
pause > nul

echo.
echo Starting MySQL in safe mode...
cd C:\xampp\mysql\bin
start "MySQL Safe Mode" cmd /k "mysqld --skip-grant-tables --console"

echo.
echo Waiting 3 seconds for MySQL to start...
timeout /t 3 /nobreak > nul

echo.
echo Connecting to MySQL and resetting password...
mysql -u root -e "USE mysql; UPDATE user SET authentication_string='' WHERE user='root' AND host='localhost'; FLUSH PRIVILEGES;"

echo.
echo ========================================
echo Password reset complete!
echo ========================================
echo.
echo Now:
echo 1. Close the MySQL Safe Mode window
echo 2. Start MySQL normally from XAMPP Control Panel
echo 3. Refresh phpMyAdmin
echo.
pause

