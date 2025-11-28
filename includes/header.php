<?php

    if ($_SERVER['SERVER_NAME'] == 'localhost') {
        $basePath = '/login-aula/';
    } else {
        $basePath = '/';
    }
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="<?php echo $basePath; ?>assets/css/style.css">
    <link rel="icon" type="image/png" href="<?php echo $basePath; ?>assets/img/FAVICON.png">

    <script src="<?php echo $basePath; ?>assets/js/script.js" defer></script> 

    <title>
    <?php
        echo isset($titlePage) ? $titlePage : "Sistema de Vendas";
    ?>
    </title>
</head>
<body>

<header>
    <a href="<?php echo $basePath; ?>pages/dashboard.php" style="text-decoration: none; color: inherit;">
        <h1>Sistema de Vendas</h1>
    </a>
    
    <nav style="display: flex; gap: 15px; align-items: center;">
        
        <a href="<?php echo $basePath; ?>pages/loja.php" style="color: white; text-decoration: none; font-weight: bold;">🏪 Loja</a>
        
        <a href="#" onclick="abrirCarrinho(); return false;" style="color: #f1c40f; text-decoration: none; font-weight: bold; border: 1px solid #f1c40f; padding: 5px 10px; border-radius: 5px;">
            🛒 Carrinho (<span id="contador-carrinho">0</span>)
        </a>

        <?php if (session_status() === PHP_SESSION_ACTIVE && isset($_SESSION['user_id'])): ?>
            <span style="color: #ddd;">|</span>
            
            <a href="<?php echo $basePath; ?>pages/dashboard.php" style="color: white; text-decoration: none;">Dashboard</a>
            
            <a href="<?php echo $basePath; ?>backend/logout.php" style="color: white; text-decoration: none; border: 1px solid white; padding: 5px 10px; border-radius: 5px;">Sair</a>
        <?php else: ?>
            <span style="color: #ddd;">|</span>
            
            <a href="<?php echo $basePath; ?>index.php" style="color: white; text-decoration: none; border: 1px solid white; padding: 5px 10px; border-radius: 5px;">Login Adm</a>
        <?php endif; ?>
    </nav>
</header>