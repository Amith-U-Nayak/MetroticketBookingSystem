-- Reset MySQL root password to empty (no password)
-- This script removes the password for root user

USE mysql;
UPDATE user SET password='' WHERE user='root';
FLUSH PRIVILEGES;

