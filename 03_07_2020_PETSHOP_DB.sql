-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for petshop
CREATE DATABASE IF NOT EXISTS `petshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `petshop`;

-- Dumping structure for table petshop.animal
CREATE TABLE IF NOT EXISTS `animal` (
  `animal_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `raca` varchar(255) NOT NULL,
  `peso` double NOT NULL,
  `idade` double NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`animal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.animal: ~3 rows (approximately)
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` (`animal_id`, `nome`, `tipo`, `raca`, `peso`, `idade`, `sexo`, `reg_date`, `last_update`) VALUES
	(7, 'Tody', 'Cachorro', 'Shitsu', 4, 4, 'Macho', '2020-07-09 17:00:33', '2020-07-09 17:00:33'),
	(8, 'Tom', 'Gato', 'Vira-Lata', 6, 7, 'Macho', '2020-07-09 17:01:43', '2020-07-09 17:01:43'),
	(9, 'Lux', 'Gato', 'Siamês', 4, 10, 'Fêmea', '2020-07-10 19:26:11', '2020-07-10 19:26:11');
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;

-- Dumping structure for table petshop.atendimento
CREATE TABLE IF NOT EXISTS `atendimento` (
  `atendimento_id` int(11) NOT NULL AUTO_INCREMENT,
  `animal_id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(50) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`atendimento_id`),
  KEY `fk_atendimento_animal` (`animal_id`),
  CONSTRAINT `fk_atendimento_animal` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.atendimento: ~4 rows (approximately)
/*!40000 ALTER TABLE `atendimento` DISABLE KEYS */;
INSERT INTO `atendimento` (`atendimento_id`, `animal_id`, `descricao`, `valor`, `status`, `reg_date`, `last_update`) VALUES
	(13, 7, 'Checagem', '225.00', 'Finalizado', '2020-07-09 17:03:38', '2020-07-09 17:10:48'),
	(14, 8, 'Checagem', '125.00', 'Finalizado', '2020-07-09 17:04:21', '2020-07-09 17:11:47'),
	(16, 7, 'Teste', '125.00', 'Finalizado', '2020-07-10 15:29:00', '2020-07-10 20:05:08'),
	(17, 9, 'Banho + Exame de Checagem', '450.55', 'Em Andamento', '2020-07-10 19:26:53', '2020-07-10 23:49:14');
/*!40000 ALTER TABLE `atendimento` ENABLE KEYS */;

-- Dumping structure for table petshop.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `fornecedor_id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `peso` varchar(10) NOT NULL DEFAULT '',
  `valor_unitario` varchar(50) NOT NULL DEFAULT '0',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`categoria_id`),
  KEY `fk_forncedor_tipo` (`fornecedor_id`),
  CONSTRAINT `fk_forncedor_tipo` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`fornecedor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.categoria: ~4 rows (approximately)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`categoria_id`, `fornecedor_id`, `descricao`, `peso`, `valor_unitario`, `reg_date`, `last_update`) VALUES
	(10, 3, 'Shampoo Neutro', '1', '32', '2020-07-09 17:23:33', '2020-07-09 17:23:45'),
	(11, 2, 'Tela de Proteção pra Gatos', '0,3', '50 ', '2020-07-09 17:25:49', '2020-07-09 17:25:49'),
	(13, 3, 'Laço de Orelha', '0.1', '16.50', '2020-07-10 23:16:23', '2020-07-10 23:16:23'),
	(15, 3, 'Teste', '12', '25.00', '2020-07-10 23:30:41', '2020-07-10 23:30:41'),
	(16, 3, 'Roupinha Dourada Tamanho P', '0,1', '150.90', '2020-07-10 23:40:07', '2020-07-10 23:42:22');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Dumping structure for table petshop.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `primeiro_nome` varchar(100) NOT NULL,
  `ultimo_nome` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `logradouro` varchar(255) NOT NULL,
  `complemento` varchar(255) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `celular` varchar(30) NOT NULL,
  `bdate` date NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.cliente: ~4 rows (approximately)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`cliente_id`, `primeiro_nome`, `ultimo_nome`, `email`, `cpf`, `logradouro`, `complemento`, `cep`, `bairro`, `cidade`, `estado`, `telefone`, `celular`, `bdate`, `reg_date`, `last_update`) VALUES
	(5, 'Clarice ', 'Elaine', 'clariceelainecaldeira-98@tilapiareal.com.br', '660.542.171-00', 'Travessa Santa Izabel, 185', '', '38183-116', 'Centro', 'Nova Odessa', 'São Paulo - SP', '(34) 3974-7382', '(34) 99704-0896', '1997-01-30', '2020-07-09 16:42:23', '2020-07-09 16:42:23'),
	(6, 'Andreia ', 'Lúcia', 'andreialuciamonteiro@rubens.adm.br', '582.116.845-78', 'Rua Principal, 138', '', '58387-971', 'Povoado', 'Americana', 'São Paulo - SP', '(83) 3511-1800', '(83) 98632-5838', '1994-06-07', '2020-07-10 19:25:15', '2020-07-10 19:25:15'),
	(7, 'Lorena', 'Melo', 'lorenaevelynmelo__lorenaevelynmelo@defensoria.sp.gov.br', '823.138.233-00', 'Rua Panorama, 23', '', '69902-100', 'Loteamento Jardim São Francisco', 'Americana', 'São Paulo - SP', '(68) 2754-9834', '(68) 98693-7319', '1995-03-10', '2020-07-10 23:02:49', '2020-07-10 23:02:49');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Dumping structure for table petshop.cliente_animal
CREATE TABLE IF NOT EXISTS `cliente_animal` (
  `cliente_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  PRIMARY KEY (`cliente_id`,`animal_id`),
  KEY `fk_animal` (`animal_id`),
  CONSTRAINT `fk_animal` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.cliente_animal: ~2 rows (approximately)
/*!40000 ALTER TABLE `cliente_animal` DISABLE KEYS */;
INSERT INTO `cliente_animal` (`cliente_id`, `animal_id`) VALUES
	(5, 7),
	(6, 9);
/*!40000 ALTER TABLE `cliente_animal` ENABLE KEYS */;

-- Dumping structure for table petshop.compra
CREATE TABLE IF NOT EXISTS `compra` (
  `compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `fornecedor_id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` varchar(50) NOT NULL DEFAULT '0',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`compra_id`),
  KEY `fk_forncedor_compra` (`fornecedor_id`),
  CONSTRAINT `fk_forncedor_compra` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`fornecedor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.compra: ~2 rows (approximately)
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` (`compra_id`, `fornecedor_id`, `descricao`, `valor`, `reg_date`) VALUES
	(9, 2, 'Vacina Anti-Rábica', '1000', '2020-07-10 16:11:07');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;

-- Dumping structure for table petshop.fornecedor
CREATE TABLE IF NOT EXISTS `fornecedor` (
  `fornecedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(255) NOT NULL,
  `cnpj` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `logradouro` varchar(255) NOT NULL,
  `complemento` varchar(255) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `telefone` varchar(30) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`fornecedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.fornecedor: ~2 rows (approximately)
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` (`fornecedor_id`, `razao_social`, `cnpj`, `email`, `logradouro`, `complemento`, `cep`, `bairro`, `cidade`, `estado`, `telefone`, `reg_date`, `last_update`) VALUES
	(2, 'Vicente e Fátima Telas Ltda', '24.142.282/0001-20', 'pesquisa@vicenteefatimatelasltda.com.b', 'Avenida Eduardo Toniello, 256', '', '14161-310', 'Jardim Grande Aliança', 'Sertãozinho -SP', 'São Paulo', '(16) 3512-1397', '2020-07-04 18:17:51', '2020-07-09 17:25:10'),
	(3, 'Eliane e Paulo Entregas Expressas ME', '69.720.225/0001-19', 'presidencia@elianeepauloentregasexpressasme.com.br', 'Rua Olívio Domingos Peruche, 581', '', '15093-303', 'Residencial Quinta do Golfe', 'São José do Rio Preto - SP', 'São Paulo', '(17) 2820-1789', '2020-07-09 17:16:53', '2020-07-09 17:17:25'),
	(4, 'Comercial Brasil Ltda', '07.567.426/0001-70', 'comercialbrasil@cb.com', 'Rua Serpa Brandão, 25', '', '02213-030', 'Vila Medeiros', 'São Paulo - SP', 'São Paulo', '(11) 3560-3808', '2020-07-11 12:03:02', '2020-07-11 12:03:02');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;

-- Dumping structure for table petshop.hora_salario
CREATE TABLE IF NOT EXISTS `hora_salario` (
  `hs_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `mes` varchar(45) NOT NULL,
  `ano` varchar(10) NOT NULL,
  `valor_hora` varchar(50) NOT NULL DEFAULT '0',
  `qtd_horas` varchar(50) NOT NULL DEFAULT '',
  `total` varchar(50) NOT NULL DEFAULT '',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`hs_id`),
  KEY `fk_usuario` (`user_id`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.hora_salario: ~0 rows (approximately)
/*!40000 ALTER TABLE `hora_salario` DISABLE KEYS */;
INSERT INTO `hora_salario` (`hs_id`, `user_id`, `mes`, `ano`, `valor_hora`, `qtd_horas`, `total`, `reg_date`, `last_update`) VALUES
	(16, 10, 'Janeiro', '2020', '50.00', '10', '500', '2020-07-14 17:31:29', '2020-07-16 14:35:00');
/*!40000 ALTER TABLE `hora_salario` ENABLE KEYS */;

-- Dumping structure for table petshop.inventario
CREATE TABLE IF NOT EXISTS `inventario` (
  `inventario_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `qtd` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`inventario_id`),
  KEY `fk_inventario_categoria` (`categoria_id`),
  CONSTRAINT `fk_inventario_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.inventario: ~5 rows (approximately)
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` (`inventario_id`, `categoria_id`, `qtd`, `reg_date`, `last_update`) VALUES
	(8, 10, 2, '2020-07-09 17:23:33', '2020-07-10 16:40:35'),
	(9, 11, 0, '2020-07-09 17:25:49', '2020-07-10 23:48:18'),
	(11, 13, 1, '2020-07-10 23:16:23', '2020-07-10 23:48:07'),
	(13, 15, 0, '2020-07-10 23:30:41', '2020-07-10 23:30:41'),
	(14, 16, 1, '2020-07-10 23:40:07', '2020-07-11 13:28:52');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;

-- Dumping structure for table petshop.log_transacao
CREATE TABLE IF NOT EXISTS `log_transacao` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `venda_id` int(11) DEFAULT NULL,
  `atendimento_id` int(11) DEFAULT NULL,
  `compra_id` int(11) DEFAULT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` varchar(50) NOT NULL DEFAULT '',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`log_id`),
  KEY `fk_atendimento_transacao` (`atendimento_id`),
  KEY `fk_compra_transacao` (`compra_id`),
  KEY `fk_venda_transacao` (`venda_id`),
  CONSTRAINT `fk_atendimento_transacao` FOREIGN KEY (`atendimento_id`) REFERENCES `atendimento` (`atendimento_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_compra_transacao` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`compra_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_venda_transacao` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`venda_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.log_transacao: ~6 rows (approximately)
/*!40000 ALTER TABLE `log_transacao` DISABLE KEYS */;
INSERT INTO `log_transacao` (`log_id`, `venda_id`, `atendimento_id`, `compra_id`, `descricao`, `valor`, `reg_date`) VALUES
	(27, NULL, 13, NULL, 'Atendimento realizado no Animal: 7', '225.00', '2020-07-09 17:03:38'),
	(28, NULL, 14, NULL, 'Atendimento realizado no Animal: 8', '125.00', '2020-07-09 17:04:21'),
	(31, NULL, 16, NULL, 'Atendimento realizado no Animal: 7', '125.00', '2020-07-10 15:29:00'),
	(32, NULL, NULL, 9, 'Compra de produtos do fornecedor: 2', '1000', '2020-07-10 16:11:07'),
	(33, 11, NULL, NULL, 'Venda para o Cliente: 5', '82', '2020-07-10 16:40:22'),
	(34, NULL, 17, NULL, 'Atendimento realizado no Animal: 9', '450.55', '2020-07-10 19:26:53'),
	(37, 13, NULL, NULL, 'Venda para o Cliente: 7', '116.00', '2020-07-10 23:09:49');
/*!40000 ALTER TABLE `log_transacao` ENABLE KEYS */;

-- Dumping structure for table petshop.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `produto_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`produto_id`),
  KEY `fk_produto_categoria` (`categoria_id`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.produto: ~7 rows (approximately)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`produto_id`, `categoria_id`, `status`, `reg_date`, `last_update`) VALUES
	(27, 10, 'Vendido', '2020-07-09 17:27:34', '2020-07-10 16:40:35'),
	(28, 11, 'Vendido', '2020-07-09 17:27:40', '2020-07-10 20:21:04'),
	(29, 11, 'Vendido', '2020-07-09 17:27:45', '2020-07-10 23:48:18'),
	(33, 13, 'Vendido', '2020-07-10 23:16:35', '2020-07-10 23:17:36'),
	(34, 13, 'Vendido', '2020-07-10 23:16:39', '2020-07-10 23:18:02'),
	(35, 13, 'Vendido', '2020-07-10 23:16:42', '2020-07-10 23:18:07'),
	(36, 16, 'Estoque', '2020-07-11 13:28:52', '2020-07-11 13:28:52');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Dumping structure for table petshop.representante
CREATE TABLE IF NOT EXISTS `representante` (
  `representante_id` int(11) NOT NULL AUTO_INCREMENT,
  `fornecedor_id` int(11) NOT NULL,
  `primeiro_nome` varchar(100) NOT NULL,
  `ultimo_nome` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `celular` varchar(30) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`representante_id`),
  KEY `fk_forncedor` (`fornecedor_id`),
  CONSTRAINT `fk_forncedor` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`fornecedor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.representante: ~2 rows (approximately)
/*!40000 ALTER TABLE `representante` DISABLE KEYS */;
INSERT INTO `representante` (`representante_id`, `fornecedor_id`, `primeiro_nome`, `ultimo_nome`, `email`, `cpf`, `telefone`, `celular`, `reg_date`, `last_update`) VALUES
	(10, 3, 'Julia ', 'Alves', 'juliamilenaraquelalves_@balaiofilmes.com.br', '777.234.934-36', '', '(17)98133-2259', '2020-07-09 17:19:39', '2020-07-09 17:19:55');
/*!40000 ALTER TABLE `representante` ENABLE KEYS */;

-- Dumping structure for table petshop.servico
CREATE TABLE IF NOT EXISTS `servico` (
  `servico_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `preco` varchar(50) NOT NULL DEFAULT '0',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`servico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.servico: ~4 rows (approximately)
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` (`servico_id`, `nome`, `descricao`, `departamento`, `preco`, `reg_date`, `last_update`) VALUES
	(3, 'Banho', 'Banho Comum', 'Estética - Banho', '25.00', '2020-07-09 11:29:06', '2020-07-10 23:33:49'),
	(4, 'Checagem de Rotina', 'Checagem de Rotina', 'Veterinária - Clinico Geral', '100.00', '2020-07-09 11:35:56', '2020-07-10 23:33:59'),
	(5, 'Tosa', 'Tosa Simples', 'Estética - Tosa', '50.25', '2020-07-10 23:43:07', '2020-07-10 23:47:31'),
	(6, 'Castração Gato (Fem)', 'Castração do órgão reprodutor feminino felino', 'Veterinária - Clinico Geral', '250.55', '2020-07-10 23:44:56', '2020-07-10 23:47:07'),
	(7, 'Castração Gato (Mas)', 'Castração do órgão reprodutor felino masculino', 'Estética - Banho', '100.00', '2020-07-10 23:46:49', '2020-07-10 23:46:49');
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;

-- Dumping structure for table petshop.servico_atendimento
CREATE TABLE IF NOT EXISTS `servico_atendimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atendimento_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  `valor` decimal(5,2) NOT NULL DEFAULT 0.00,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`,`atendimento_id`,`servico_id`),
  KEY `fk_antendimento_servico` (`atendimento_id`),
  KEY `fk_servico_atendimento` (`servico_id`),
  CONSTRAINT `fk_antendimento_servico` FOREIGN KEY (`atendimento_id`) REFERENCES `atendimento` (`atendimento_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_servico_atendimento` FOREIGN KEY (`servico_id`) REFERENCES `servico` (`servico_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.servico_atendimento: ~9 rows (approximately)
/*!40000 ALTER TABLE `servico_atendimento` DISABLE KEYS */;
INSERT INTO `servico_atendimento` (`id`, `atendimento_id`, `servico_id`, `valor`, `reg_date`) VALUES
	(54, 13, 4, 100.00, '2020-07-09 17:03:46'),
	(55, 13, 3, 25.00, '2020-07-09 17:03:54'),
	(56, 14, 4, 100.00, '2020-07-09 17:04:27'),
	(57, 14, 3, 25.00, '2020-07-09 17:09:55'),
	(58, 13, 4, 100.00, '2020-07-09 17:10:14'),
	(59, 16, 3, 25.00, '2020-07-10 15:43:10'),
	(61, 16, 4, 100.00, '2020-07-10 19:14:38'),
	(62, 17, 4, 100.00, '2020-07-10 20:00:26'),
	(65, 17, 6, 250.55, '2020-07-10 23:49:08'),
	(66, 17, 7, 100.00, '2020-07-10 23:49:14');
/*!40000 ALTER TABLE `servico_atendimento` ENABLE KEYS */;

-- Dumping structure for table petshop.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `primeiro_nome` varchar(100) NOT NULL,
  `ultimo_nome` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `logradouro` varchar(255) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `cep` varchar(20) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `celular` varchar(30) NOT NULL,
  `login` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `funcao` varchar(100) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.usuario: ~1 rows (approximately)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`user_id`, `primeiro_nome`, `ultimo_nome`, `email`, `cpf`, `logradouro`, `complemento`, `cep`, `bairro`, `cidade`, `estado`, `telefone`, `celular`, `login`, `senha`, `funcao`, `reg_date`, `last_update`) VALUES
	(10, 'Administrador', 'Admin', 'admin@admin.com', '000.000.000-00', 'Administrador', '', '00000-000', 'Administrador', 'Americana', 'São Paulo - SP', '(00)0000-0000', '(00)00000-0000', 'admin', 'admin', 'Administrador', '2020-07-11 17:58:41', '2020-07-11 17:58:41');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Dumping structure for table petshop.venda
CREATE TABLE IF NOT EXISTS `venda` (
  `venda_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(6,2) NOT NULL DEFAULT 0.00,
  `status` varchar(50) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`venda_id`),
  KEY `fk_cliente_venda` (`cliente_id`),
  CONSTRAINT `fk_cliente_venda` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.venda: ~2 rows (approximately)
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` (`venda_id`, `cliente_id`, `descricao`, `valor`, `status`, `reg_date`, `last_update`) VALUES
	(11, 5, 'Venda de Produto', 82.00, 'Finalizada', '2020-07-10 16:40:22', '2020-07-10 16:40:22'),
	(13, 7, 'Compra de Produto', 116.00, 'Em Andamento', '2020-07-10 23:09:49', '2020-07-10 23:09:49');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;

-- Dumping structure for table petshop.venda_produto
CREATE TABLE IF NOT EXISTS `venda_produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venda_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `valor` varchar(50) NOT NULL DEFAULT '',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`,`produto_id`,`venda_id`),
  KEY `fk_produto_venda` (`venda_id`),
  KEY `fk_venda_produto` (`produto_id`),
  CONSTRAINT `fk_produto_venda` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`venda_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_venda_produto` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table petshop.venda_produto: ~6 rows (approximately)
/*!40000 ALTER TABLE `venda_produto` DISABLE KEYS */;
INSERT INTO `venda_produto` (`id`, `venda_id`, `produto_id`, `valor`, `reg_date`) VALUES
	(73, 11, 27, '32', '2020-07-10 16:40:35'),
	(74, 11, 28, '50 ', '2020-07-10 20:21:04'),
	(81, 13, 33, '16.50', '2020-07-10 23:17:36'),
	(82, 13, 34, '16.50', '2020-07-10 23:18:02'),
	(83, 13, 35, '16.50', '2020-07-10 23:18:07'),
	(84, 13, 35, '16.50', '2020-07-10 23:48:07'),
	(85, 13, 29, '50 ', '2020-07-10 23:48:18');
/*!40000 ALTER TABLE `venda_produto` ENABLE KEYS */;

-- Dumping structure for trigger petshop.atendimento_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `atendimento_after_insert` AFTER INSERT ON `atendimento` FOR EACH ROW begin
        insert into log_transacao(atendimento_id,descricao,valor,reg_date)
        values(new.atendimento_id, concat('Atendimento realizado no Animal: ',new.animal_id), new.valor ,new.reg_date);
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger petshop.atendimento_after_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `atendimento_after_update` AFTER UPDATE ON `atendimento` FOR EACH ROW BEGIN
UPDATE log_transacao 
		  	SET valor = NEW.valor
		  	WHERE atendimento_id = new.atendimento_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger petshop.categoria_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `categoria_after_insert` AFTER INSERT ON `categoria` FOR EACH ROW BEGIN
		INSERT INTO inventario(categoria_id,qtd)
		VALUES (NEW.categoria_id,0);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger petshop.compra_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `compra_after_insert` AFTER INSERT ON `compra` FOR EACH ROW begin
        insert into log_transacao(compra_id,descricao,valor,reg_date)
        values(new.compra_id, concat('Compra de produtos do fornecedor: ',new.fornecedor_id), new.valor ,new.reg_date);
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger petshop.produto_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `produto_insert` AFTER INSERT ON `produto` FOR EACH ROW BEGIN
		  UPDATE inventario 
		  SET qtd = (SELECT COUNT(p.status) qtd 
		  				 FROM produto p
		  				 WHERE p.status = 'Estoque'
		  				 AND categoria_id = NEW.categoria_id
						 ORDER BY categoria_id)
		  WHERE categoria_id = new.categoria_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger petshop.produto_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `produto_update` AFTER UPDATE ON `produto` FOR EACH ROW begin
        UPDATE inventario 
		  SET qtd = (SELECT COUNT(p.status) qtd 
		  				 FROM produto p
		  				 WHERE p.status = 'Estoque'
						 ORDER BY categoria_id)
		  WHERE categoria_id = new.categoria_id;
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger petshop.servico_atendimento_add
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `servico_atendimento_add` AFTER INSERT ON `servico_atendimento` FOR EACH ROW BEGIN
			UPDATE atendimento a 
		  	SET valor = (SELECT SUM(valor) 
						 FROM servico_atendimento sa
						 WHERE sa.atendimento_id = new.atendimento_id)
		  	WHERE a.atendimento_id = new.atendimento_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger petshop.servico_atendimento_drop
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `servico_atendimento_drop` AFTER DELETE ON `servico_atendimento` FOR EACH ROW BEGIN
			UPDATE atendimento a 
		  	SET valor = (SELECT SUM(valor) 
						 FROM servico_atendimento sa
						 WHERE sa.atendimento_id = old.atendimento_id)
		  	WHERE a.atendimento_id = old.atendimento_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger petshop.venda_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `venda_after_insert` AFTER INSERT ON `venda` FOR EACH ROW begin
        insert into log_transacao(venda_id,descricao,valor,reg_date)
        values(new.venda_id, concat('Venda para o Cliente: ',new.cliente_id), new.valor ,new.reg_date);
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger petshop.venda_after_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `venda_after_update` AFTER UPDATE ON `venda` FOR EACH ROW BEGIN
			UPDATE log_transacao 
		  	SET valor = NEW.valor
		  	WHERE venda_id = new.venda_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger petshop.venda_produto_add
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `venda_produto_add` AFTER INSERT ON `venda_produto` FOR EACH ROW BEGIN  	
		  	UPDATE produto 
			SET STATUS = 'Vendido'
			WHERE produto_id = new.produto_id;
			
			UPDATE venda v 
		  	SET valor = (SELECT SUM(valor) 
						 FROM venda_produto vp
						 WHERE vp.venda_id = new.venda_id)
		  	WHERE v.venda_id = new.venda_id;
		  			
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger petshop.venda_produto_drop
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `venda_produto_drop` AFTER DELETE ON `venda_produto` FOR EACH ROW BEGIN
		  	UPDATE produto 
			SET STATUS = 'Estoque'
			WHERE produto_id = old.produto_id;
			
			UPDATE venda v 
		  	SET valor = (SELECT SUM(valor) 
						 FROM venda_produto vp
						 WHERE vp.venda_id = old.venda_id)
		  	WHERE v.venda_id = old.venda_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
