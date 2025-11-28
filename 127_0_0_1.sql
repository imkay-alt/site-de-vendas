-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/11/2025 às 21:08
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aula1`
--
CREATE DATABASE IF NOT EXISTS `aula1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aula1`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `preco`, `imagem`, `data_cadastro`) VALUES
(1, 'Camisa Branca', 'É branca', 60.00, 'https://m.magazineluiza.com.br/a-static/420x420/camiseta-branca-lisa-tamanho-g-verde-limao/confeccoesverdelimao/eda5ff8a9e4f11eda8304201ac185019/3210c96d17167e7ec6ff7179c961c125.jpeg', '2025-11-26 22:53:52');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'Admin', 'admin@admin', '$2y$10$Nlx7V51s6cO4x6vVDeChheeMbuhO1Rkx1sFoaZ2HCohQtPDZfpxVm');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Banco de dados: `competicao_db`
--
CREATE DATABASE IF NOT EXISTS `competicao_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `competicao_db`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `votos`
--

CREATE TABLE `votos` (
  `id` int(11) NOT NULL,
  `projeto_id` varchar(255) NOT NULL,
  `nota_estilo` tinyint(4) NOT NULL,
  `nota_organizacao` tinyint(4) NOT NULL,
  `nota_estrutura` tinyint(4) NOT NULL,
  `data_voto` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `votos`
--

INSERT INTO `votos` (`id`, `projeto_id`, `nota_estilo`, `nota_organizacao`, `nota_estrutura`, `data_voto`) VALUES
(1, 'abraão-dos-santos-ramos', 1, 1, 1, '2025-11-01 21:49:24'),
(2, 'felipe-fayal', 5, 5, 5, '2025-11-01 21:50:00'),
(3, 'felipe-fayal', 5, 5, 5, '2025-11-02 01:11:50'),
(4, 'laís-maria-rocha-e-siva', 5, 5, 5, '2025-11-02 01:13:38'),
(5, 'felipe-fayal', 5, 5, 5, '2025-11-02 01:14:01'),
(6, 'laís-maria-rocha-e-siva', 3, 5, 5, '2025-11-03 14:50:05'),
(7, 'ana-paula-ribeiro-sena', 1, 1, 1, '2025-11-03 14:52:50'),
(8, 'felipe-fayal', 5, 5, 5, '2025-11-19 18:53:44'),
(9, 'abella-gasel', 5, 5, 5, '2025-11-24 15:41:58'),
(10, 'abella-gasel', 5, 5, 5, '2025-11-24 15:41:59'),
(11, 'abella-gasel', 5, 5, 5, '2025-11-24 15:42:00'),
(12, 'abella-gasel', 5, 5, 5, '2025-11-24 15:42:00'),
(13, 'abella-gasel', 5, 5, 5, '2025-11-24 15:42:00'),
(14, 'abraao-dos-santos-ramos', 5, 5, 5, '2025-11-24 15:42:12'),
(15, 'alexandre-pantoja', 5, 5, 5, '2025-11-24 15:46:35');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `votos`
--
ALTER TABLE `votos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Banco de dados: `descarteaq_db`
--
CREATE DATABASE IF NOT EXISTS `descarteaq_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `descarteaq_db`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `data_inicio` datetime NOT NULL COMMENT 'Data/Hora de início (para o calendário)',
  `data_fim` datetime DEFAULT NULL COMMENT 'Data/Hora de término (opcional)',
  `local_texto` varchar(255) DEFAULT NULL COMMENT 'Ex: Online, Auditório XYZ',
  `imagem_banner_url` varchar(255) DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_local_associado` int(11) DEFAULT NULL COMMENT 'Link para a tabela locais (se o evento for lá)',
  `lat` double DEFAULT NULL COMMENT 'Lat do evento (se for local único)',
  `lng` double DEFAULT NULL COMMENT 'Lng do evento (se for local único)',
  `tipo_mapa` enum('leaflet','svg') NOT NULL DEFAULT 'leaflet' COMMENT 'Tipo de mapa para o evento',
  `mapa_svg_url` varchar(255) DEFAULT NULL COMMENT 'Caminho para o SVG do mapa do evento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lixeiras`
--

CREATE TABLE `lixeiras` (
  `id` int(11) NOT NULL,
  `tipo` enum('reciclavel','normal','silo') NOT NULL COMMENT 'Reciclável/Seletiva, Lixo Normal, ou Silo/Especial',
  `cor` varchar(50) DEFAULT NULL COMMENT 'Ex: Azul, Vermelho, Múltipla, Madeira',
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `id_local_associado` int(11) DEFAULT NULL COMMENT 'ID da tabela locais (opcional)',
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `lixeiras`
--

INSERT INTO `lixeiras` (`id`, `tipo`, `cor`, `lat`, `lng`, `id_local_associado`, `data_cadastro`) VALUES
(1, 'normal', 'verde', -1.4531, -48.494496, 3, '2025-11-12 03:25:34'),
(2, 'normal', 'verde', -1.452843, -48.494918, 3, '2025-11-12 03:25:34'),
(3, 'normal', 'verde', -1.453111, -48.494353, 3, '2025-11-12 03:25:34'),
(4, 'normal', 'verde', -1.453968, -48.493047, 3, '2025-11-12 03:25:34'),
(5, 'normal', 'verde', -1.452908, -48.494202, 3, '2025-11-12 03:25:34'),
(6, 'normal', 'verde', -1.453644, -48.493632, 3, '2025-11-12 03:25:34'),
(7, 'normal', 'verde', -1.452489, -48.495506, 3, '2025-11-12 03:25:34'),
(8, 'normal', 'verde', -1.454065, -48.492874, 3, '2025-11-12 03:25:34'),
(9, 'normal', 'verde', -1.452485, -48.495527, 3, '2025-11-12 03:25:34'),
(10, 'normal', 'verde', -1.452737, -48.495088, 3, '2025-11-12 03:25:34'),
(11, 'normal', 'verde', -1.452169, -48.496002, 3, '2025-11-12 03:25:34'),
(12, 'normal', 'verde', -1.452065, -48.495928, 3, '2025-11-12 03:25:34'),
(13, 'normal', 'verde', -1.452226, -48.495926, 3, '2025-11-12 03:25:34'),
(14, 'normal', 'laranja', -1.453012, -48.494305, 3, '2025-11-12 03:25:34'),
(15, 'normal', 'madeira', -1.452351, -48.495582, 3, '2025-11-12 03:25:34'),
(16, 'normal', 'madeira', -1.453214, -48.493818, 3, '2025-11-12 03:25:34'),
(17, 'normal', 'madeira', -1.453198, -48.49432, 3, '2025-11-12 03:25:34'),
(18, 'normal', 'madeira', -1.453334, -48.493325, 3, '2025-11-12 03:25:34'),
(19, 'normal', 'madeira', -1.452368, -48.49555, 3, '2025-11-12 03:25:34'),
(20, 'normal', 'madeira', -1.4524, -48.495521, 3, '2025-11-12 03:25:34'),
(21, 'normal', 'madeira', -1.452954, -48.494121, 3, '2025-11-12 03:25:34'),
(22, 'normal', 'madeira', -1.453312, -48.493766, 3, '2025-11-12 03:25:34'),
(23, 'silo', NULL, -1.453255, -48.494238, 3, '2025-11-12 03:25:34'),
(24, 'normal', 'cinza', -1.44665, -48.498319, 10, '2025-11-12 03:25:34'),
(25, 'normal', 'cinza', -1.446357, -48.498549, 10, '2025-11-12 03:25:34'),
(26, 'normal', 'cinza', -1.447022, -48.498712, 10, '2025-11-12 03:25:34'),
(27, 'normal', 'cinza', -1.446797, -48.498412, 10, '2025-11-12 03:25:34'),
(28, 'normal', 'cinza', -1.447127, -48.498615, 10, '2025-11-12 03:25:34'),
(29, 'normal', 'cinza', -1.446844, -48.498393, 10, '2025-11-12 03:25:34'),
(30, 'normal', 'cinza', -1.446434, -48.498621, 10, '2025-11-12 03:25:34'),
(31, 'normal', 'cinza', -1.446726, -48.498491, 10, '2025-11-12 03:25:34'),
(32, 'normal', 'cinza', -1.446961, -48.498641, 10, '2025-11-12 03:25:34'),
(33, 'normal', 'cinza', -1.4465, -48.498323, 10, '2025-11-12 03:25:34'),
(34, 'normal', 'cinza', -1.446869, -48.498897, 10, '2025-11-12 03:25:34'),
(35, 'normal', 'cinza', -1.446684, -48.498783, 10, '2025-11-12 03:25:34'),
(36, 'normal', 'cinza', -1.447032, -48.498994, 10, '2025-11-12 03:25:34'),
(37, 'normal', 'cinza', -1.446599, -48.498726, 10, '2025-11-12 03:25:34'),
(38, 'normal', 'cinza', -1.446757, -48.498824, 10, '2025-11-12 03:25:34'),
(39, 'reciclavel', 'tripla', -1.447205, -48.499113, 10, '2025-11-12 03:25:34'),
(40, 'reciclavel', 'tripla', -1.447229, -48.499044, 10, '2025-11-12 03:25:34'),
(41, 'reciclavel', 'tripla', -1.447178, -48.499173, 10, '2025-11-12 03:25:34'),
(42, 'reciclavel', 'tripla', -1.447371, -48.498813, 10, '2025-11-12 03:25:34'),
(43, 'reciclavel', 'tripla', -1.447297, -48.499215, 10, '2025-11-12 03:25:34'),
(44, 'reciclavel', 'tripla', -1.447256, -48.499266, 10, '2025-11-12 03:25:34'),
(45, 'reciclavel', 'multipla', -1.448208, -48.500021, 10, '2025-11-12 03:25:34'),
(46, 'reciclavel', 'multipla', -1.449289, -48.500951, 10, '2025-11-12 03:25:34'),
(47, 'reciclavel', 'multipla', -1.448431, -48.50023, 10, '2025-11-12 03:25:34'),
(48, 'reciclavel', 'multipla', -1.448703, -48.500457, 10, '2025-11-12 03:25:34'),
(49, 'reciclavel', 'multipla', -1.449991, -48.501424, 10, '2025-11-12 03:25:34'),
(50, 'reciclavel', 'multipla', -1.449489, -48.50111, 10, '2025-11-12 03:25:34'),
(51, 'reciclavel', 'multipla', -1.44902, -48.500702, 10, '2025-11-12 03:25:34'),
(52, 'reciclavel', 'multipla', -1.449664, -48.501211, 10, '2025-11-12 03:25:34'),
(53, 'reciclavel', 'multipla', -1.447534, -48.499569, 10, '2025-11-12 03:25:34'),
(54, 'normal', 'alumínio', -1.45022, -48.50162, 10, '2025-11-12 03:25:34'),
(55, 'normal', 'alumínio', -1.45009, -48.501571, 10, '2025-11-12 03:25:34'),
(56, 'normal', 'alumínio', -1.450113, -48.501702, 10, '2025-11-12 03:25:34');

-- --------------------------------------------------------

--
-- Estrutura para tabela `locais`
--

CREATE TABLE `locais` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `zoom` int(11) NOT NULL DEFAULT 14,
  `imagem_url` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `tipo_mapa` enum('leaflet','svg') NOT NULL DEFAULT 'leaflet',
  `mapa_svg_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `locais`
--

INSERT INTO `locais` (`id`, `nome`, `lat`, `lng`, `zoom`, `imagem_url`, `endereco`, `tipo_mapa`, `mapa_svg_url`) VALUES
(1, 'Praça Batista Campos', -1.459935, -48.489726, 30, NULL, NULL, 'leaflet', NULL),
(2, 'Praça da Bandeira', -1.454856, -48.499655, 30, NULL, NULL, 'leaflet', NULL),
(3, 'Praça da República', -1.45254, -48.494081, 17, NULL, NULL, 'leaflet', NULL),
(4, 'Parque Zoobotânico Mangal das Garças', -1.465089, -48.5054, 17, NULL, NULL, 'leaflet', NULL),
(5, 'Mercado Ver-o-Peso', -1.4522256684586332, -48.50379382126824, 17, NULL, NULL, 'leaflet', NULL),
(7, 'Orla Portal da Amazônia', -1.469925, -48.50215, 16, NULL, NULL, 'leaflet', NULL),
(10, 'Estação das Docas', -1.4490693363052054, -48.500125743858725, 16, NULL, NULL, 'leaflet', NULL),
(11, 'Parque Urbano Belém Porto Futuro', -1.4417570880035693, -48.494447332911164, 18, NULL, NULL, 'leaflet', NULL),
(12, 'Orla de Icoaraci', -1.2948485682001325, -48.489953577090695, 15, NULL, NULL, 'leaflet', NULL),
(13, 'Forte do Presépio', -1.454246719340576, -48.505280421268324, 18, NULL, NULL, 'leaflet', NULL),
(14, 'Parque da Residência', -1.451825053966114, -48.47337170912826, 18, NULL, NULL, 'leaflet', NULL),
(15, 'Terminal Rodoviário de Belém', -1.4486261666160525, -48.466297105925385, 18, NULL, NULL, 'leaflet', NULL),
(16, 'Mercado de São Brás', -1.4512812684013487, -48.46820087153961, 30, NULL, NULL, 'leaflet', NULL),
(17, 'Bosque Rodrigues Alves', -1.4300673181114438, -48.45687543476112, 17, NULL, NULL, 'leaflet', NULL),
(18, 'Museu Goeldi - Parque Zoobotânico', -1.4531267818646438, -48.47664911626079, 18, NULL, NULL, 'leaflet', NULL),
(19, 'UFPA', -1.4759402698967297, -48.45719890986987, 17, NULL, NULL, 'leaflet', NULL),
(20, 'Parque Estadual do Utinga', -1.4253258857921889, -48.44337972909314, 20, NULL, NULL, 'leaflet', NULL),
(21, 'Hangar Convenções', -1.421749712384386, -48.45664988872463, 18, NULL, NULL, 'leaflet', NULL),
(22, 'Av. João Paulo II', -1.4150313184365204, -48.43910086105753, 16, NULL, NULL, 'leaflet', NULL),
(23, 'Av. Alm. Barroso', -1.4293409925778728, -48.45394323661125, 16, NULL, NULL, 'leaflet', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ranking`
--

CREATE TABLE `ranking` (
  `id_usuario` int(11) NOT NULL,
  `id_jogo` varchar(100) NOT NULL COMMENT 'Identificador único do jogo',
  `pontuacao_maxima` int(11) NOT NULL DEFAULT 0,
  `ultima_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `recuperacao_senha`
--

CREATE TABLE `recuperacao_senha` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `token` varchar(255) NOT NULL,
  `data_expiracao` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sugestoes`
--

CREATE TABLE `sugestoes` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL COMMENT 'ID do usuário que sugeriu',
  `endereco` varchar(255) NOT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `tipos_lixeiras` varchar(255) DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `status` enum('pendente','aprovada','rejeitada') NOT NULL DEFAULT 'pendente',
  `data_sugestao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `idade` smallint(6) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `senha_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `idade`, `email`, `senha_hash`) VALUES
(1, 'admin', NULL, 'admin@gmail.com', '$2y$10$9dVwCCrGZVm4TgquCNYY9uAOY0qF98ez41q0k0YKCs85sdrR1ZYlS');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_local_associado` (`id_local_associado`);

--
-- Índices de tabela `lixeiras`
--
ALTER TABLE `lixeiras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_local_associado` (`id_local_associado`);

--
-- Índices de tabela `locais`
--
ALTER TABLE `locais`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`id_usuario`,`id_jogo`);

--
-- Índices de tabela `recuperacao_senha`
--
ALTER TABLE `recuperacao_senha`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Índices de tabela `sugestoes`
--
ALTER TABLE `sugestoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lixeiras`
--
ALTER TABLE `lixeiras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de tabela `locais`
--
ALTER TABLE `locais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `recuperacao_senha`
--
ALTER TABLE `recuperacao_senha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sugestoes`
--
ALTER TABLE `sugestoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_local_associado`) REFERENCES `locais` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `lixeiras`
--
ALTER TABLE `lixeiras`
  ADD CONSTRAINT `lixeiras_ibfk_1` FOREIGN KEY (`id_local_associado`) REFERENCES `locais` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `ranking_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `sugestoes`
--
ALTER TABLE `sugestoes`
  ADD CONSTRAINT `sugestoes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;
--
-- Banco de dados: `     ecommerce`
--
CREATE DATABASE IF NOT EXISTS `     ecommerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `     ecommerce`;
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Despejando dados para a tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"ltd_local\",\"table\":\"locais\"},{\"db\":\"ltd_local\",\"table\":\"lixeiras\"},{\"db\":\"ltd_local\",\"table\":\"local_lixeiras\"},{\"db\":\"aula1\",\"table\":\"usuarios\"},{\"db\":\"test\",\"table\":\"usuarios\"}]');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Despejando dados para a tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-10-27 14:41:14', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pt_BR\"}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices de tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices de tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices de tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices de tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices de tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices de tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices de tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices de tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices de tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `texto` text NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `comentarios`
--

INSERT INTO `comentarios` (`id`, `autor`, `texto`, `data_criacao`) VALUES
(1, 'felipe', 'lallalalallalalalala', '2025-10-10 11:23:22');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `idade` smallint(6) NOT NULL,
  `email` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `idade`, `email`) VALUES
(1, 'Felipe Fayal', 20, 'felipe@exemplo.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
