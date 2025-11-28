<?php
    session_start();
    
    include 'backend/conn.php';

    $errorMessage = '';

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $email = $_POST['email'];
        $senha = $_POST['senha'];

        $sql = "SELECT * FROM usuarios WHERE email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $user = $result->fetch_assoc();
            if (password_verify($senha, $user['senha'])) {
                $_SESSION['user_id'] = $user['id'];
                
                header("Location: pages/dashboard.php");
                exit;
            } else {
                $errorMessage = "Senha incorreta. Tente novamente.";
            }
        } else {
            $errorMessage = "Usuário não encontrado. Verifique o email.";
        }

        $stmt->close();
    }
    
    $titlePage = "Login | Sistema de Login";
    include 'includes/header.php';
?>

<main>

<div class="login-container fade-in">

    <h1 style="color: white;">Acesso ao Sistema</h1>

    <?php if (!empty($errorMessage)): ?>
        <div class="alert-message error">
            <?php echo $errorMessage; ?>
        </div>
    <?php endif; ?>

    <form method="post">
        <input type="email" name="email" placeholder="Email de Acesso" required> 
        <input type="password" name="senha" placeholder="Sua Senha Secreta" required> 
        <button type="submit">Entrar</button>
    </form>

</div>

</main>
    
</body>
</html>