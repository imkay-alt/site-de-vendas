let carrinho = JSON.parse(localStorage.getItem('carrinho')) || [];
atualizarContador();

function adicionarAoCarrinho(id, nome, preco) {
    carrinho.push({ id, nome, preco: Number(preco) });
    localStorage.setItem('carrinho', JSON.stringify(carrinho));
    atualizarContador();

    const toast = document.createElement('div');
    toast.className = 'toast-notification';
    toast.textContent = `${nome} adicionado!`;
    document.body.appendChild(toast);
    setTimeout(() => toast.remove(), 3000);
}

function atualizarContador() {
    const contador = document.getElementById('contador-carrinho');
    if (contador) contador.textContent = carrinho.length;
}

function abrirCarrinho() {
    const modal = document.getElementById('modalCarrinho');
    const lista = document.getElementById('lista-carrinho');
    const totalSpan = document.getElementById('total-carrinho');

    lista.innerHTML = '';
    let total = 0;

    if (carrinho.length === 0) {
        lista.innerHTML = '<p style="text-align:center; color:#F1F5F9; padding:20px; margin:0;">Seu carrinho está vazio.</p>';
    } else {
        carrinho.forEach((item, index) => {
            total += item.preco;

            const div = document.createElement('div');
            div.style.cssText = `
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 12px 0;
                border-bottom: 1px solid rgba(255,255,255,0.1);
            `;

            div.innerHTML = `
                <span style="color:#F1F5F9; font-size:1rem;">${escapeHtml(item.nome)}</span>
                <div style="display:flex; align-items:center; gap:12px;">
                    <strong style="color:#F1F5F9;">R$ ${item.preco.toFixed(2).replace('.', ',')}</strong>
                    <button onclick="removerDoCarrinho(${index})" 
                            style="background:none; border:none; color:#EF4444; cursor:pointer; font-weight:bold; font-size:0.9rem;">
                        Excluir
                    </button>
                </div>
            `;
            lista.appendChild(div);
        });
    }

    totalSpan.textContent = total.toFixed(2).replace('.', ',');
    modal.style.display = 'flex';
}

function removerDoCarrinho(index) {
    carrinho.splice(index, 1);
    localStorage.setItem('carrinho', JSON.stringify(carrinho));
    atualizarContador();
    abrirCarrinho();
}

function fecharCarrinho() {
    document.getElementById('modalCarrinho').style.display = 'none';
}

function finalizarCompra() {
    if (carrinho.length === 0) {
        alert('Seu carrinho está vazio!');
        return;
    }

    const total = document.getElementById('total-carrinho').textContent;
    if (confirm(`Deseja confirmar o pedido no valor de R$ ${total}?`)) {
        alert('Pedido realizado com sucesso! Em breve você receberá os detalhes.');
        carrinho = [];
        localStorage.setItem('carrinho', JSON.stringify(carrinho));
        atualizarContador();
        fecharCarrinho();
    }
}

let idParaExcluir = null;

function confirmarExclusao(id) {
    idParaExcluir = id;
    document.getElementById('modalExclusao').style.display = 'flex';
}

function fecharModal() {
    document.getElementById('modalExclusao').style.display = 'none';
    idParaExcluir = null;
}

function executarExclusao() {
    if (idParaExcluir !== null) {
        window.location.href = `../backend/excluir-produto.php?id=${idParaExcluir}`;
    }
}

function validarFormulario(event) {
    const nome = document.querySelector('input[name="nome"]')?.value.trim();
    const preco = document.querySelector('input[name="preco"]')?.value;

    if (!nome) {
        alert('O nome do produto é obrigatório!');
        event.preventDefault();
        return false;
    }

    const valorPreco = parseFloat(preco);
    if (isNaN(valorPreco) || valorPreco < 0) {
        alert('Por favor, insira um preço válido!');
        event.preventDefault();
        return false;
    }

    return true;
}

function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}