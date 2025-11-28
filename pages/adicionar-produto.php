<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: ../index.php");
    exit;
}

include '../backend/conn.php';

$msg = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = $_POST['nome'];
    $descricao = $_POST['descricao'];
    $preco = str_replace(',', '.', $_POST['preco']); 
    $imagem = $_POST['imagem'];

    $sql = "INSERT INTO produtos (nome, descricao, preco, imagem) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssds", $nome, $descricao, $preco, $imagem);

    if ($stmt->execute()) {
        header("Location: dashboard.php");
        exit;
    } else {
        $msg = "Erro ao cadastrar: " . $conn->error;
    }
}

$titlePage = "Novo Produto";
include '../includes/header.php';
?>

<main>
    <div class="section-header">
        <h2 style="color: white;">Cadastrar Novo Produto</h2>
        <a href="dashboard.php" class="btn btn-action" style="background-color: transparent; border: 1px solid white; color: white;">Voltar</a>
    </div>

    <?php if ($msg): ?>
        <p style="color: #ef4444; margin-bottom: 15px;"><?php echo $msg; ?></p>
    <?php endif; ?>

    <form method="post" style="max-width: 500px; margin-top: 20px;" onsubmit="return validarFormulario(event)">
        <div style="margin-bottom: 15px;">
            <label style="color: white;">Nome do Produto:</label>
            <input type="text" name="nome" style="width: 100%; padding: 10px; margin-top: 5px;">
        </div>

        <div style="margin-bottom: 15px;">
            <label style="color: white;">Descrição:</label>
            <textarea name="descricao" rows="4" style="width: 100%; padding: 10px; margin-top: 5px;"></textarea>
        </div>

        <div style="margin-bottom: 15px;">
            <label style="color: white;">Preço (R$):</label>
            <input type="number" step="0.01" name="preco" style="width: 100%; padding: 10px; margin-top: 5px;">
        </div>

        <div style="margin-bottom: 15px;">
            <label style="color: white;">Link da Imagem (URL):</label>
            <input type="url" name="imagem" placeholder="https://..." style="width: 100%; padding: 10px; margin-top: 5px;">
        </div>

        <button type="submit" class="btn btn-action" style="width: 100%;">Salvar Produto</button>
    </form>
</main>
</body>
</html>