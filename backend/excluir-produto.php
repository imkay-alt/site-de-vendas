<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: ../index.php");
    exit;
}

include 'conn.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $sql = "DELETE FROM produtos WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        header("Location: ../pages/dashboard.php");
        exit;
    } else {
        echo "Erro ao excluir: " . $conn->error;
    }
} else {
    header("Location: ../pages/dashboard.php");
    exit;
}
?>