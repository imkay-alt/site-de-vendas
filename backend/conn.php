<?php

ini_set('log_errors', 1);
error_reporting(E_ALL);

$server = "localhost";
$user = "root";
$password = "";
$db = "aula1";

$conn = mysqli_connect($server, $user, $password, $db);

if (!$conn) {
    http_response_code(500); 
    echo json_encode(['success' => false, 'error' => 'Connection failed: ' . mysqli_connect_error()]);
    exit;
}

mysqli_set_charset($conn, "utf8mb4");
?>