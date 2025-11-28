<?php
    session_start();

    if (!isset($_SESSION['user_id'])) {
        header("Location: ../index.php"); 
        exit;
    }

    include '../backend/conn.php';

    $sql_produtos = "SELECT * FROM produtos ORDER BY id DESC";
    $result_produtos = $conn->query($sql_produtos);

    $total_produtos = $result_produtos->num_rows;

    $titlePage = "Dashboard | Gerenciamento";
    include '../includes/header.php';
    
    $stats = [
        ['title' => 'Total Produtos', 'value' => $total_produtos, 'icon' => '📦'],
        ['title' => 'Status do Sistema', 'value' => 'Online', 'icon' => '🟢'],
        ['title' => 'Administrador', 'value' => 'Logado', 'icon' => '👤']
    ];
?>

<main>
    <h2 style="color: white;">Painel Administrativo ⚙️</h2>
    
    <div class="stats-grid">
        <?php foreach ($stats as $stat): ?>
        <div class="stat-card fade-in">
            <div class="stat-icon"><?php echo $stat['icon']; ?></div>
            <div class="stat-info">
                <p class="stat-title"><?php echo $stat['title']; ?></p>
                <h3 class="stat-value"><?php echo $stat['value']; ?></h3>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
    
    <div style="height: 30px;"></div>
    
    <div class="section-header">
        <h2 style="color: white;">Lista de Produtos</h2>
        <a href="adicionar-produto.php" class="btn btn-action">+ Novo Produto</a>
    </div>

    <table class="product-table"> 
        <thead> 
            <tr> 
                <th>ID</th>
                <th>Imagem</th>
                <th>Nome</th>
                <th>Preço</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($result_produtos->num_rows > 0): ?>
                <?php while($row = $result_produtos->fetch_assoc()): ?>
                <tr id="produto-<?php echo $row['id']; ?>">
                    <td><?php echo $row['id']; ?></td>
                    <td>
                        <?php if(!empty($row['imagem'])): ?>
                            <img src="<?php echo $row['imagem']; ?>" alt="img" style="width: 40px; height: 40px; object-fit: cover; border-radius: 4px;">
                        <?php else: ?>
                            <span>📷</span>
                        <?php endif; ?>
                    </td>
                    <td>
                        <strong><?php echo htmlspecialchars($row['nome']); ?></strong>
                    </td>
                    <td>R$ <?php echo number_format($row['preco'], 2, ',', '.'); ?></td>
                    <td>
                        <a href="editar-produto.php?id=<?php echo $row['id']; ?>" class="action-link">Editar</a>
                        <a href="javascript:void(0)" onclick="confirmarExclusao(<?php echo $row['id']; ?>)" class="action-link delete-link">Excluir</a>
                    </td>
                </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td colspan="5" style="text-align:center; padding: 20px; color: white;">Nenhum produto cadastrado.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

    <div id="modalExclusao" class="modal-overlay">
        <div class="modal-content">
            <h3 style="color: white;">Confirmar Exclusão</h3>
            <p style="color: #d1d5db;">Tem certeza que deseja remover este item?</p>
            <div class="modal-buttons">
                <button class="btn-cancel" onclick="fecharModal()">Cancelar</button>
                <button class="btn-confirm" onclick="executarExclusao()">Sim, Excluir</button>
            </div>
        </div>
    </div>

</main>
</body>
</html>