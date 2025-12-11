<?php
// Database configuration
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', 'root'); // Will auto-fallback to empty password if this fails
define('DB_NAME', 'metro_booking');
define('DB_PORT', getenv('DB_PORT') ? (int) getenv('DB_PORT') : 3307);

// Create connection with intelligent fallback and JSON error output for APIs
function getDBConnection() {
    // First attempt with configured password
    $conn = @new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_PORT);
    if ($conn && !$conn->connect_error) {
        return $conn;
    }

    // Fallback attempt: common XAMPP default (empty root password)
    $fallbackPass = '';
    if ($fallbackPass !== DB_PASS) {
        $connFallback = @new mysqli(DB_HOST, DB_USER, $fallbackPass, DB_NAME, DB_PORT);
        if ($connFallback && !$connFallback->connect_error) {
            return $connFallback;
        }
    }

    // If both attempts failed, return a clear JSON error for API consumers
    $errorMessage = 'Database connection failed. Verify MySQL is running, credentials, and that the schema is imported.';
    $detailed = isset($conn) && $conn->connect_error ? $conn->connect_error : 'Unknown error';

    if (!headers_sent()) {
        header('Content-Type: application/json');
    }
    echo json_encode([
        'success' => false,
        'error' => 'DB_CONNECTION_ERROR',
        'message' => $errorMessage,
        'detail' => $detailed
    ]);
    exit;
}

// Start session if not already started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>

