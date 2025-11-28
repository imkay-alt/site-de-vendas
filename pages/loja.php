<?php
    session_start();

    include '../backend/conn.php';

    $sql = "SELECT * FROM produtos ORDER BY id DESC";
    $result = $conn->query($sql);

    $titlePage = "Loja Virtual | Ofertas";
    
    include '../includes/header.php';
?>

<style>

    .loja-container { max-width: 1200px; margin: 0 auto; padding: 40px 20px; }
    .titulo-loja { text-align: center; margin-bottom: 40px; color: #ffffff; }
    .grid-produtos { display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 25px; }
    .card-produto { background: #1f2937; border: 1px solid #374151; border-radius: 10px; overflow: hidden; transition: transform 0.2s, box-shadow 0.2s; display: flex; flex-direction: column; }
    .card-produto:hover { transform: translateY(-5px); box-shadow: 0 10px 20px rgba(0,0,0,0.5); }
    .img-container { width: 100%; height: 200px; background-color: #374151; display: flex; align-items: center; justify-content: center; overflow: hidden; }
    .img-produto { width: 100%; height: 100%; object-fit: cover; }
    .info-produto { padding: 20px; flex-grow: 1; display: flex; flex-direction: column; justify-content: space-between; }
    .nome-produto { font-size: 1.1rem; margin-bottom: 10px; color: #ffffff; }
    .preco-produto { font-size: 1.4rem; font-weight: bold; color: #34d399; margin-bottom: 15px; }
    .btn-comprar { display: block; width: 100%; padding: 10px; background-color: #2563eb; color: white; border: none; border-radius: 5px; font-weight: bold; cursor: pointer; transition: background 0.2s; }
    .btn-comprar:hover { background-color: #1d4ed8; }

    #modalCarrinho .modal-content {
        width: 90%;
        max-width: 500px;
        text-align: left;
        background-color: #1f2937; 
        color: white; 
        border: 1px solid #374151;
    }
    
    .carrinho-total {
        margin-top: 20px;
        padding-top: 10px;
        border-top: 2px solid #374151;
        font-size: 1.2rem;
        font-weight: bold;
        text-align: right;
        color: #ffffff;
    }

</style>

<main class="loja-container">
    
    <h1 class="titulo-loja">Nossos Produtos 🛍️</h1>

    <div class="grid-produtos">
        <?php if ($result->num_rows > 0): ?>
            <?php while($row = $result->fetch_assoc()): ?>
                <div class="card-produto">
                    <div class="img-container">
                        <?php if(!empty($row['imagem'])): ?>
                            <img src="<?php echo $row['imagem']; ?>" alt="<?php echo htmlspecialchars($row['nome']); ?>" class="img-produto">
                        <?php else: ?>
                            <div style="font-size: 50px; color: #9ca3af;">📦</div>
                        <?php endif; ?>
                    </div>
                    
                    <div class="info-produto">
                        <div>
                            <h3 class="nome-produto"><?php echo htmlspecialchars($row['nome']); ?></h3>
                            <p style="color: #d1d5db; font-size: 0.9rem; margin-bottom: 10px;">
                                <?php echo substr(htmlspecialchars($row['descricao']), 0, 50); ?>...
                            </p>
                        </div>
                        <div>
                            <div class="preco-produto">R$ <?php echo number_format($row['preco'], 2, ',', '.'); ?></div>
                            
                            <button class="btn-comprar" 
                                onclick="adicionarAoCarrinho(<?php echo $row['id']; ?>, '<?php echo htmlspecialchars($row['nome']); ?>', <?php echo $row['preco']; ?>)">
                                Adicionar ao Carrinho
                            </button>
                        </div>
                    </div>
                </div>
            <?php endwhile; ?>
        <?php else: ?>
            <p style="text-align: center; width: 100%; color: white;">Nenhum produto disponível.</p>
        <?php endif; ?>
    </div>

    <div id="modalCarrinho" class="modal-overlay" style="display: none;">
        <div class="modal-content">
            <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom: 15px;">
                <h3 style="margin:0; color: white;">Seu Carrinho 🛒</h3>
                <button onclick="fecharCarrinho()" style="background:none; border:none; font-size:1.5rem; cursor:pointer; color: #ffffff;">&times;</button>
            </div>
            
            <div id="lista-carrinho" style="max-height: 300px; overflow-y: auto;">
                </div>

            <div class="carrinho-total">
                Total: R$ <span id="total-carrinho">0,00</span>
            </div>

            <button class="btn-action" onclick="finalizarCompra()" style="margin-top: 15px; width: 100%; background-color: #10b981;">
                Finalizar Compra
            </button>
        </div>
    </div>

</main>
</body>
</html>