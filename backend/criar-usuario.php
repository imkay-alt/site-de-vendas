<?php

    include 'conn.php';

    $nome = "Admin";
    $email = "admin@admin";
    $senha = password_hash("12345", PASSWORD_DEFAULT);

    $sql = "INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)";
    
    if (!isset($conn) || $conn === null) {
        die("Database connection not found.");
    }

    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        die("Prepare failed: (" . $conn->errno . ") " . $conn->error);
    }

    if (!$stmt->bind_param("sss", $nome, $email, $senha)) {
        die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
    }

    if (!$stmt->execute()) {
        die("Execute failed: (" . $stmt->errno . ") " . $stmt->error);
    }

    echo "Usuário criado com sucesso.";

    $stmt->close();
    $conn->close();
?>