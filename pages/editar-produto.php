<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: ../index.php");
    exit;
}

include '../backend/conn.php';

if (!isset($_GET['id'])) {
    header("Location: dashboard.php");
    exit;
}

$id = $_GET['id'];
$msg = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = $_POST['nome'];
    $descricao = $_POST['descricao'];
    $preco = str_replace(',', '.', $_POST['preco']); 
    $imagem = $_POST['imagem'];

    $sql = "UPDATE produtos SET nome=?, descricao=?, preco=?, imagem=? WHERE id=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssdsi", $nome, $descricao, $preco, $imagem, $id);

    if ($stmt->execute()) {
        header("Location: dashboard.php");
        exit;
    } else {
        $msg = "Erro ao atualizar: " . $conn->error;
    }
}

$sql_busca = "SELECT * FROM produtos WHERE id = ?";
$stmt_busca = $conn->prepare($sql_busca);
$stmt_busca->bind_param("i", $id);
$stmt_busca->execute();
$result = $stmt_busca->get_result();
$produto = $result->fetch_assoc();

if (!$produto) {
    header("Location: dashboard.php");
    exit;
}

$titlePage = "Editar Produto";
include '../includes/header.php';
?>

<main>
    <div class="section-header">
        <h2 style="color: white;">Editar Produto #<?php echo $produto['id']; ?></h2>
        <a href="dashboard.php" class="btn btn-action" style="background-color: transparent; border: 1px solid white; color: white;">Cancelar</a>
    </div>

    <?php if ($msg): ?>
        <p style="color: #ef4444; margin-bottom: 15px; font-weight: bold;"><?php echo $msg; ?></p>
    <?php endif; ?>

    <form method="post" style="max-width: 500px; margin-top: 20px;">
        
        <div style="margin-bottom: 15px;">
            <label style="color: white;">Nome do Produto:</label>
            <input type="text" name="nome" value="<?php echo htmlspecialchars($produto['nome']); ?>" required>
        </div>

        <div style="margin-bottom: 15px;">
            <label style="color: white;">Descrição:</label>
            <textarea name="descricao" rows="4"><?php echo htmlspecialchars($produto['descricao']); ?></textarea>
        </div>

        <div style="margin-bottom: 15px;">
            <label style="color: white;">Preço (R$):</label>
            <input type="number" step="0.01" name="preco" value="<?php echo $produto['preco']; ?>" required>
        </div>

        <div style="margin-bottom: 15px;">
            <label style="color: white;">Link da Imagem (URL):</label>
            <input type="url" name="imagem" value="<?php echo htmlspecialchars($produto['imagem']); ?>" placeholder="https://...">
        </div>
        
        <?php if(!empty($produto['imagem'])): ?>
            <div style="margin-bottom: 20px; text-align: center;">
                <p style="font-size: 0.8rem; color: #d1d5db;">Imagem Atual:</p>
                <img src="<?php echo $produto['imagem']; ?>" style="max-height: 100px; border-radius: 8px;">
            </div>
        <?php endif; ?>

        <button type="submit" class="btn btn-action">Salvar Alterações</button>
    </form>
</main>
</body>
</html>