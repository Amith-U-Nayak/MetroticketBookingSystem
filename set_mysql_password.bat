@echo off
echo ========================================
echo Setting MySQL Root Password
echo ========================================
echo.
echo This will set MySQL root password to: root
echo.
echo STEP 1: Make sure MySQL is RUNNING in XAMPP Control Panel
echo Press any key AFTER MySQL is running...
pause > nul

echo.
echo STEP 2: Setting password...
cd C:\xampp\mysql\bin

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root'; FLUSH PRIVILEGES;"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! Password has been set to: root
    echo ========================================
    echo.
    echo Now you can login to phpMyAdmin with:
    echo Username: root
    echo Password: root
    echo.
) else (
    echo.
    echo ========================================
    echo ERROR: Could not set password
    echo ========================================
    echo.
    echo Try the manual method - see instructions below.
)

echo.
pause

