-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.24-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para acadlite
CREATE DATABASE IF NOT EXISTS `acadlite` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `acadlite`;


-- Copiando estrutura para tabela acadlite.equipamentos
CREATE TABLE IF NOT EXISTS `equipamentos` (
  `cod_equip` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_equip`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acadlite.equipamentos: ~103 rows (aproximadamente)
DELETE FROM `equipamentos`;
/*!40000 ALTER TABLE `equipamentos` DISABLE KEYS */;
INSERT INTO `equipamentos` (`cod_equip`, `nome`, `tipo`, `dt_cadastro`) VALUES
	(1, 'Acadmix Executivo Metalmix 300.25.03 Prata/Vermelho', 'Musculação', '2016-04-27 13:44:21'),
	(2, 'Estação de Musculação Smart 8000 23 Exercícios Cinza e Preto Life Zone', 'Musculação', '2016-04-27 13:44:21'),
	(3, 'Esteira Elétrica Polimet EP-1600 Dobrável Bivolt - Preta - Esteira Polimet EP-1600', 'Ergometria', '2016-05-02 22:52:57'),
	(4, 'Risus Consulting', 'Ergometria', '2016-05-06 23:44:44'),
	(5, 'Erat In Consectetuer Corp.', 'Ergometria', '2016-05-06 23:44:44'),
	(6, 'Donec Fringilla Donec Corporation', 'Ergometria', '2016-05-06 23:44:44'),
	(7, 'Non Sollicitudin A LLC', 'Musculação', '2016-05-06 23:44:44'),
	(8, 'Sit Amet Ltd', 'Musculação', '2016-05-06 23:44:44'),
	(9, 'Aliquet Diam Sed Consulting', 'Ergometria', '2016-05-06 23:44:44'),
	(10, 'Lobortis Ltd', 'Ergometria', '2016-05-06 23:44:44'),
	(11, 'Ornare Elit Elit PC', 'Musculação', '2016-05-06 23:44:44'),
	(12, 'Dictum Augue Ltd', 'Ergometria', '2016-05-06 23:44:44'),
	(13, 'Purus LLP', 'Musculação', '2016-05-06 23:44:44'),
	(14, 'At Lacus Institute', 'Musculação', '2016-05-06 23:44:44'),
	(15, 'Tincidunt Aliquam Arcu LLC', 'Ergometria', '2016-05-06 23:44:44'),
	(16, 'Risus LLP', 'Ergometria', '2016-05-06 23:44:44'),
	(17, 'Luctus Aliquet Limited', 'Musculação', '2016-05-06 23:44:44'),
	(18, 'Aliquam Company', 'Musculação', '2016-05-06 23:44:44'),
	(19, 'Cum Sociis Ltd', 'Musculação', '2016-05-06 23:44:44'),
	(20, 'Congue A Aliquet Institute', 'Musculação', '2016-05-06 23:44:44'),
	(21, 'Dolor Institute', 'Musculação', '2016-05-06 23:44:44'),
	(22, 'Enim Sit Limited', 'Musculação', '2016-05-06 23:44:44'),
	(23, 'Convallis In LLC', 'Ergometria', '2016-05-06 23:44:44'),
	(24, 'Eu Tellus Phasellus Limited', 'Musculação', '2016-05-06 23:44:44'),
	(25, 'A Corporation', 'Ergometria', '2016-05-06 23:44:44'),
	(26, 'Eros Nam Company', 'Musculação', '2016-05-06 23:44:44'),
	(27, 'Purus Sapien LLC', 'Ergometria', '2016-05-06 23:44:44'),
	(28, 'Mollis Consulting', 'Ergometria', '2016-05-06 23:44:44'),
	(29, 'Aliquam Iaculis Lacus LLP', 'Musculação', '2016-05-06 23:44:44'),
	(30, 'Est Mauris Company', 'Musculação', '2016-05-06 23:44:44'),
	(31, 'Donec Inc.', 'Ergometria', '2016-05-06 23:44:44'),
	(32, 'Nam Foundation', 'Musculação', '2016-05-06 23:44:44'),
	(33, 'Non Hendrerit Id LLC', 'Ergometria', '2016-05-06 23:44:44'),
	(34, 'Ullamcorper Inc.', 'Ergometria', '2016-05-06 23:44:44'),
	(35, 'Semper Institute', 'Musculação', '2016-05-06 23:44:44'),
	(36, 'Sapien Imperdiet Corp.', 'Ergometria', '2016-05-06 23:44:44'),
	(37, 'Tellus Eu Industries', 'Musculação', '2016-05-06 23:44:44'),
	(38, 'In Faucibus Orci Corp.', 'Musculação', '2016-05-06 23:44:44'),
	(39, 'Arcu Vestibulum Ante Company', 'Ergometria', '2016-05-06 23:44:44'),
	(40, 'Nisi Corporation', 'Musculação', '2016-05-06 23:44:44'),
	(41, 'Magnis Inc.', 'Ergometria', '2016-05-06 23:44:44'),
	(42, 'Dolor Quisque Corporation', 'Ergometria', '2016-05-06 23:44:44'),
	(43, 'Dictum Cursus Industries', 'Ergometria', '2016-05-06 23:44:44'),
	(44, 'Cursus Industries', 'Musculação', '2016-05-06 23:44:44'),
	(45, 'Ornare Placerat Orci Foundation', 'Musculação', '2016-05-06 23:44:44'),
	(46, 'Vel Quam Ltd', 'Ergometria', '2016-05-06 23:44:44'),
	(47, 'Pretium LLC', 'Musculação', '2016-05-06 23:44:44'),
	(48, 'Ultricies Ornare Elit Company', 'Musculação', '2016-05-06 23:44:44'),
	(49, 'Tellus Imperdiet Non Corp.', 'Ergometria', '2016-05-06 23:44:44'),
	(50, 'Justo Consulting', 'Musculação', '2016-05-06 23:44:44'),
	(51, 'Pellentesque Sed Associates', 'Ergometria', '2016-05-06 23:44:44'),
	(52, 'Vestibulum Inc.', 'Ergometria', '2016-05-06 23:44:44'),
	(53, 'Proin Nisl Sem Institute', 'Ergometria', '2016-05-06 23:44:44'),
	(54, 'Tempor LLP', 'Ergometria', '2016-05-06 23:44:44'),
	(55, 'Magna Sed Consulting', 'Musculação', '2016-05-06 23:44:44'),
	(56, 'Dolor Egestas Corporation', 'Ergometria', '2016-05-06 23:44:44'),
	(57, 'Fusce Consulting', 'Ergometria', '2016-05-06 23:44:44'),
	(58, 'Quis Tristique Ac Foundation', 'Musculação', '2016-05-06 23:44:44'),
	(59, 'Tellus Ltd', 'Ergometria', '2016-05-06 23:44:44'),
	(60, 'Commodo Auctor Velit Limited', 'Musculação', '2016-05-06 23:44:44'),
	(61, 'Purus Nullam Inc.', 'Ergometria', '2016-05-06 23:44:44'),
	(62, 'Lacus Cras Interdum LLP', 'Musculação', '2016-05-06 23:44:44'),
	(63, 'Diam Proin Corp.', 'Ergometria', '2016-05-06 23:44:44'),
	(64, 'Natoque Penatibus Et LLC', 'Musculação', '2016-05-06 23:44:44'),
	(65, 'Non Quam Inc.', 'Ergometria', '2016-05-06 23:44:44'),
	(66, 'Dictum Phasellus PC', 'Ergometria', '2016-05-06 23:44:44'),
	(67, 'Auctor Velit Institute', 'Musculação', '2016-05-06 23:44:44'),
	(68, 'Duis Volutpat Nunc Consulting', 'Musculação', '2016-05-06 23:44:44'),
	(69, 'Sit Amet Ultricies Limited', 'Ergometria', '2016-05-06 23:44:44'),
	(70, 'Faucibus Id Libero Associates', 'Ergometria', '2016-05-06 23:44:44'),
	(71, 'Eleifend Egestas Sed Ltd', 'Musculação', '2016-05-06 23:44:44'),
	(72, 'Blandit At LLP', 'Ergometria', '2016-05-06 23:44:44'),
	(73, 'Arcu Incorporated', 'Ergometria', '2016-05-06 23:44:44'),
	(74, 'Pharetra Nibh Consulting', 'Ergometria', '2016-05-06 23:44:44'),
	(75, 'Proin Nisl Sem Ltd', 'Musculação', '2016-05-06 23:44:44'),
	(76, 'Volutpat Limited', 'Musculação', '2016-05-06 23:44:44'),
	(77, 'Posuere At Velit Company', 'Ergometria', '2016-05-06 23:44:44'),
	(78, 'Sed Inc.', 'Musculação', '2016-05-06 23:44:44'),
	(79, 'Turpis Foundation', 'Musculação', '2016-05-06 23:44:44'),
	(80, 'Consequat LLC', 'Musculação', '2016-05-06 23:44:44'),
	(81, 'Etiam Bibendum Fermentum Institute', 'Ergometria', '2016-05-06 23:44:44'),
	(82, 'In Nec Incorporated', 'Musculação', '2016-05-06 23:44:44'),
	(83, 'Purus Industries', 'Musculação', '2016-05-06 23:44:44'),
	(84, 'Phasellus Libero Mauris Limited', 'Musculação', '2016-05-06 23:44:44'),
	(85, 'Tristique Senectus Foundation', 'Musculação', '2016-05-06 23:44:44'),
	(86, 'Placerat Cras Inc.', 'Musculação', '2016-05-06 23:44:44'),
	(87, 'Id Sapien Cras Incorporated', 'Ergometria', '2016-05-06 23:44:44'),
	(88, 'Mattis Ornare Lectus Institute', 'Musculação', '2016-05-06 23:44:44'),
	(89, 'Ipsum Ac Mi Industries', 'Ergometria', '2016-05-06 23:44:44'),
	(90, 'Sem Pellentesque Ut Corporation', 'Musculação', '2016-05-06 23:44:44'),
	(91, 'Dui Cras Ltd', 'Musculação', '2016-05-06 23:44:44'),
	(92, 'Morbi Corp.', 'Musculação', '2016-05-06 23:44:44'),
	(93, 'Quis Arcu Vel Foundation', 'Musculação', '2016-05-06 23:44:44'),
	(94, 'Aliquet Sem Industries', 'Ergometria', '2016-05-06 23:44:44'),
	(95, 'Eu Placerat Company', 'Musculação', '2016-05-06 23:44:44'),
	(96, 'Tempor Associates', 'Ergometria', '2016-05-06 23:44:44'),
	(97, 'Imperdiet Ornare In Industries', 'Musculação', '2016-05-06 23:44:44'),
	(98, 'Risus Odio LLC', 'Ergometria', '2016-05-06 23:44:44'),
	(99, 'Posuere PC', 'Musculação', '2016-05-06 23:44:44'),
	(100, 'Morbi Quis PC', 'Musculação', '2016-05-06 23:44:44'),
	(101, 'Adipiscing Consulting', 'Ergometria', '2016-05-06 23:44:44'),
	(102, 'Nec Urna Suscipit Incorporated', 'Musculação', '2016-05-06 23:44:44'),
	(103, 'Neque Pellentesque Massa Company', 'Musculação', '2016-05-06 23:44:44');
/*!40000 ALTER TABLE `equipamentos` ENABLE KEYS */;


-- Copiando estrutura para tabela acadlite.execucao_jobs
CREATE TABLE IF NOT EXISTS `execucao_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT '0',
  `data_exec` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acadlite.execucao_jobs: ~4 rows (aproximadamente)
DELETE FROM `execucao_jobs`;
/*!40000 ALTER TABLE `execucao_jobs` DISABLE KEYS */;
INSERT INTO `execucao_jobs` (`id`, `nome`, `data_exec`) VALUES
	(1, 'JOB_LANC_AUTO', '2016-05-03 09:28:00'),
	(2, 'JOB_LANC_AUTO', '2016-05-06 02:16:42'),
	(3, 'JOB_LANC_AUTO', '2016-05-07 08:57:05'),
	(4, 'JOB_LANC_AUTO', '2016-05-07 09:28:00');
/*!40000 ALTER TABLE `execucao_jobs` ENABLE KEYS */;


-- Copiando estrutura para evento acadlite.JOB_LANC_AUTO
DELIMITER //
CREATE DEFINER=`rise`@`localhost` EVENT `JOB_LANC_AUTO` ON SCHEDULE EVERY 1 DAY STARTS '2016-05-03 09:28:00' ON COMPLETION PRESERVE ENABLE COMMENT 'Rotina para criar os lançamentos fixos' DO BEGIN
 call PROC_REALIZA_LANC_FIXOS;
 insert into execucao_jobs(nome) values('JOB_LANC_AUTO');
END//
DELIMITER ;


-- Copiando estrutura para tabela acadlite.lancamentos
CREATE TABLE IF NOT EXISTS `lancamentos` (
  `cod_lanc` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `dt_lanc` datetime DEFAULT CURRENT_TIMESTAMP,
  `dt_vencimento` date DEFAULT NULL,
  `cod_tipo_lanc` int(11) DEFAULT NULL,
  `dt_exclusao` datetime DEFAULT NULL,
  `valor` double DEFAULT '0',
  `cod_mensalidade` int(11) DEFAULT '0',
  `fixo` char(1) DEFAULT 'N',
  PRIMARY KEY (`cod_lanc`),
  KEY `cod_tipo_lanc` (`cod_tipo_lanc`),
  CONSTRAINT `lancamentos_ibfk_1` FOREIGN KEY (`cod_tipo_lanc`) REFERENCES `tipos_lancamentos` (`cod_tipo_lanc`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acadlite.lancamentos: ~116 rows (aproximadamente)
DELETE FROM `lancamentos`;
/*!40000 ALTER TABLE `lancamentos` DISABLE KEYS */;
INSERT INTO `lancamentos` (`cod_lanc`, `descricao`, `dt_lanc`, `dt_vencimento`, `cod_tipo_lanc`, `dt_exclusao`, `valor`, `cod_mensalidade`, `fixo`) VALUES
	(1, 'teste', NULL, NULL, 3, '2016-05-02 22:57:40', NULL, 0, 'N'),
	(2, 'Teste novo', '2016-04-27 17:13:41', '2010-09-11', 1, '2016-05-02 18:52:51', NULL, 0, 'N'),
	(3, 'Lançamento de Receita', '2016-04-27 17:30:06', '2016-12-20', 3, '2016-04-27 21:54:44', NULL, 0, 'N'),
	(4, 'Lançamento despesa', '2016-04-27 17:36:42', NULL, 3, '2016-05-02 22:57:41', NULL, 0, 'N'),
	(5, 'Teste final', '2016-05-01 22:22:08', '2019-10-10', 1, '2016-05-02 22:57:35', 100, 0, 'N'),
	(9, 'Vendas de artigos esportivos em geral', '2016-05-02 22:58:47', '2016-05-08', 1, NULL, 970, 0, 'N'),
	(10, 'Danos devido a uma forte chuva e raios', '2016-05-02 22:59:54', '2016-05-03', 3, NULL, 60, 0, 'N'),
	(11, 'Matrícula de novo aluno', '2016-05-02 23:00:55', '2016-05-09', 4, NULL, 100, 0, 'N'),
	(12, 'Vendas de Squeeze', '2016-05-02 23:30:59', '2016-05-05', 1, NULL, 100, 0, 'N'),
	(14, 'Aluguel do prédio', '2016-05-03 09:28:00', '2016-05-03', 5, NULL, 850, 0, 'S'),
	(15, NULL, '2016-05-05 22:30:04', NULL, NULL, NULL, NULL, NULL, 'N'),
	(16, '213', '2016-05-05 22:46:41', '1321-10-12', 7, NULL, 213, 6, 'N'),
	(17, 'gbv', '2016-05-05 23:18:55', '2010-10-10', 7, NULL, 23, 7, 'N'),
	(18, 'mensalidade comum', '2016-05-05 23:20:08', '2000-10-10', 7, NULL, 200, 8, 'N'),
	(19, 'Lorem Inc.', '2016-05-06 23:58:31', '2031-10-16', 4, NULL, 99, 0, 'N'),
	(20, 'Pharetra Nibh Incorporated', '2016-05-06 23:58:31', '2005-07-16', 1, NULL, 71, 0, 'N'),
	(21, 'Et Associates', '2016-05-06 23:58:31', '2001-06-16', 1, NULL, 45, 0, 'N'),
	(22, 'Eu Tempor LLP', '2016-05-06 23:58:31', '2012-06-15', 8, NULL, 118, 0, 'N'),
	(23, 'Duis Cursus Diam Limited', '2016-05-06 23:58:31', '2003-05-16', 3, NULL, 100, 0, 'N'),
	(24, 'Mi LLP', '2016-05-06 23:58:31', '2013-02-16', 2, NULL, 59, 0, 'N'),
	(25, 'Tellus Corp.', '2016-05-06 23:58:31', '2025-07-16', 6, NULL, 58, 0, 'N'),
	(26, 'Semper Erat Company', '2016-05-06 23:58:31', '2026-02-16', 2, NULL, 90, 0, 'N'),
	(27, 'Augue Porttitor Interdum Company', '2016-05-06 23:58:31', '2018-07-16', 4, NULL, 43, 0, 'N'),
	(28, 'Augue Sed Corporation', '2016-05-06 23:58:31', '2024-04-16', 2, NULL, 94, 0, 'N'),
	(29, 'Ornare Fusce LLC', '2016-05-06 23:58:31', '2011-03-17', 4, NULL, 45, 0, 'N'),
	(30, 'Nec Incorporated', '2016-05-06 23:58:31', '2004-04-16', 1, NULL, 46, 0, 'N'),
	(31, 'Elit Incorporated', '2016-05-06 23:58:31', '2029-05-15', 3, NULL, 97, 0, 'N'),
	(32, 'Vitae Aliquam Eros PC', '2016-05-06 23:58:31', '2002-06-15', 3, NULL, 58, 0, 'N'),
	(33, 'Purus Maecenas Industries', '2016-05-06 23:58:31', '2003-09-15', 2, NULL, 45, 0, 'N'),
	(34, 'Semper Pretium Neque Incorporated', '2016-05-06 23:58:31', '2013-06-16', 7, NULL, 75, 0, 'N'),
	(35, 'Duis Limited', '2016-05-06 23:58:31', '2030-07-15', 6, NULL, 55, 0, 'N'),
	(36, 'Eleifend Nec Corporation', '2016-05-06 23:58:31', '2028-04-17', 6, NULL, 77, 0, 'N'),
	(37, 'Mi Eleifend Ltd', '2016-05-06 23:58:31', '2030-06-15', 4, NULL, 36, 0, 'N'),
	(38, 'Rhoncus Nullam Associates', '2016-05-06 23:58:31', '2027-08-15', 1, NULL, 87, 0, 'N'),
	(39, 'Donec Dignissim Foundation', '2016-05-06 23:58:31', '2010-02-16', 5, NULL, 109, 0, 'N'),
	(40, 'Tortor Associates', '2016-05-06 23:58:31', '2016-09-16', 6, NULL, 69, 0, 'N'),
	(41, 'Pellentesque Institute', '2016-05-06 23:58:31', '2027-02-17', 6, NULL, 72, 0, 'N'),
	(42, 'Justo Faucibus Lectus Incorporated', '2016-05-06 23:58:31', '2018-10-15', 5, NULL, 75, 0, 'N'),
	(43, 'Imperdiet Ullamcorper Duis Corp.', '2016-05-06 23:58:31', '2023-02-16', 1, NULL, 98, 0, 'N'),
	(44, 'Aenean Egestas Corporation', '2016-05-06 23:58:31', '2022-11-16', 2, NULL, 106, 0, 'N'),
	(45, 'Sit Institute', '2016-05-06 23:58:31', '2020-10-15', 6, NULL, 93, 0, 'N'),
	(46, 'Eget Metus Limited', '2016-05-06 23:58:31', '2021-07-15', 6, NULL, 94, 0, 'N'),
	(47, 'Facilisis Suspendisse Commodo LLP', '2016-05-06 23:58:31', '2022-10-15', 6, NULL, 93, 0, 'N'),
	(48, 'Et Magnis Dis LLC', '2016-05-06 23:58:31', '2023-01-16', 1, NULL, 66, 0, 'N'),
	(49, 'Sed Eu Nibh Institute', '2016-05-06 23:58:31', '2029-10-16', 6, NULL, 78, 0, 'N'),
	(50, 'Lacus Corporation', '2016-05-06 23:58:31', '2028-12-15', 7, NULL, 57, 0, 'N'),
	(51, 'Magna LLP', '2016-05-06 23:58:31', '2006-10-16', 8, NULL, 93, 0, 'N'),
	(52, 'Integer Sem Limited', '2016-05-06 23:58:31', '2009-04-16', 9, NULL, 79, 0, 'N'),
	(53, 'Duis Gravida Company', '2016-05-06 23:58:31', '2013-06-16', 2, NULL, 102, 0, 'N'),
	(54, 'Porttitor Interdum Sed Consulting', '2016-05-06 23:58:31', '2021-01-16', 7, NULL, 53, 0, 'N'),
	(55, 'Nisi Mauris Nulla Limited', '2016-05-06 23:58:31', '2016-01-17', 2, NULL, 50, 0, 'N'),
	(56, 'Tempus Lorem LLC', '2016-05-06 23:58:31', '2014-06-16', 8, NULL, 104, 0, 'N'),
	(57, 'Diam Vel Arcu Consulting', '2016-05-06 23:58:31', '2009-07-15', 9, NULL, 58, 0, 'N'),
	(58, 'In Consectetuer PC', '2016-05-06 23:58:31', '2004-03-16', 4, NULL, 104, 0, 'N'),
	(59, 'Eros Proin Ultrices Associates', '2016-05-06 23:58:31', '2031-05-16', 1, NULL, 66, 0, 'N'),
	(60, 'Lacus Ut Nec LLC', '2016-05-06 23:58:31', '2026-04-17', 5, NULL, 82, 0, 'N'),
	(61, 'Metus Aenean Sed LLP', '2016-05-06 23:58:31', '2028-06-16', 2, NULL, 56, 0, 'N'),
	(62, 'Enim Mauris Quis Limited', '2016-05-06 23:58:31', '2030-08-16', 2, NULL, 80, 0, 'N'),
	(63, 'Tincidunt Pede Ac Institute', '2016-05-06 23:58:31', '2020-07-15', 3, NULL, 52, 0, 'N'),
	(64, 'Ut PC', '2016-05-06 23:58:31', '2026-06-16', 7, NULL, 77, 0, 'N'),
	(65, 'Vulputate Posuere Incorporated', '2016-05-06 23:58:31', '2026-05-16', 4, NULL, 43, 0, 'N'),
	(66, 'Donec Dignissim LLC', '2016-05-06 23:58:31', '2016-07-15', 9, NULL, 76, 0, 'N'),
	(67, 'Lorem Industries', '2016-05-06 23:58:31', '2005-05-17', 3, NULL, 62, 0, 'N'),
	(68, 'Lorem Luctus Ut Company', '2016-05-06 23:58:31', '2025-03-17', 9, NULL, 47, 0, 'N'),
	(69, 'Risus LLP', '2016-05-06 23:58:31', '2003-07-16', 9, NULL, 91, 0, 'N'),
	(70, 'Tortor Foundation', '2016-05-06 23:58:31', '2027-10-15', 1, NULL, 47, 0, 'N'),
	(71, 'Vehicula Pellentesque Tincidunt Incorporated', '2016-05-06 23:58:31', '2017-02-16', 9, NULL, 117, 0, 'N'),
	(72, 'Iaculis Aliquet Diam Limited', '2016-05-06 23:58:31', '2001-01-17', 7, NULL, 80, 0, 'N'),
	(73, 'Turpis Aliquam Adipiscing Corporation', '2016-05-06 23:58:31', '2028-12-15', 6, NULL, 85, 0, 'N'),
	(74, 'Consequat Incorporated', '2016-05-06 23:58:31', '2008-11-16', 9, NULL, 111, 0, 'N'),
	(75, 'Vulputate Consulting', '2016-05-06 23:58:31', '2013-08-15', 3, NULL, 54, 0, 'N'),
	(76, 'Consequat Purus LLC', '2016-05-06 23:58:31', '2027-05-15', 1, NULL, 95, 0, 'N'),
	(77, 'Condimentum Donec LLC', '2016-05-06 23:58:31', '2011-05-16', 7, NULL, 54, 0, 'N'),
	(78, 'Lacus Quisque Institute', '2016-05-06 23:58:31', '2020-05-15', 6, NULL, 57, 0, 'N'),
	(79, 'Pharetra Felis Eget Institute', '2016-05-06 23:58:31', '2025-08-16', 8, NULL, 82, 0, 'N'),
	(80, 'Tellus Nunc Lectus PC', '2016-05-06 23:58:31', '2016-09-16', 2, NULL, 41, 0, 'N'),
	(81, 'Mus Donec Inc.', '2016-05-06 23:58:31', '2005-07-16', 1, NULL, 45, 0, 'N'),
	(82, 'Proin Limited', '2016-05-06 23:58:31', '2024-10-16', 3, NULL, 90, 0, 'N'),
	(83, 'Et Associates', '2016-05-06 23:58:31', '2030-01-17', 1, NULL, 68, 0, 'N'),
	(84, 'Dapibus Rutrum Institute', '2016-05-06 23:58:31', '2010-12-15', 3, NULL, 110, 0, 'N'),
	(85, 'Eget Metus Ltd', '2016-05-06 23:58:31', '2018-11-15', 9, NULL, 60, 0, 'N'),
	(86, 'Dis Parturient Montes Inc.', '2016-05-06 23:58:31', '2007-05-15', 4, NULL, 45, 0, 'N'),
	(87, 'Et Magnis Dis Corporation', '2016-05-06 23:58:31', '2025-01-16', 6, NULL, 60, 0, 'N'),
	(88, 'Aliquam Company', '2016-05-06 23:58:31', '2006-11-15', 2, NULL, 119, 0, 'N'),
	(89, 'At PC', '2016-05-06 23:58:31', '2003-05-16', 4, NULL, 61, 0, 'N'),
	(90, 'Eu LLP', '2016-05-06 23:58:31', '2013-11-16', 1, NULL, 62, 0, 'N'),
	(91, 'Nisi Magna Sed Company', '2016-05-06 23:58:31', '2010-08-15', 9, NULL, 65, 0, 'N'),
	(92, 'Mollis Duis Sit Limited', '2016-05-06 23:58:31', '2016-11-15', 9, NULL, 84, 0, 'N'),
	(93, 'In Foundation', '2016-05-06 23:58:31', '2025-08-15', 2, NULL, 46, 0, 'N'),
	(94, 'Nunc Sed Associates', '2016-05-06 23:58:31', '2007-07-15', 2, NULL, 106, 0, 'N'),
	(95, 'Arcu Corporation', '2016-05-06 23:58:31', '2008-03-16', 1, NULL, 102, 0, 'N'),
	(96, 'Cursus In Hendrerit Ltd', '2016-05-06 23:58:31', '2030-12-16', 3, NULL, 48, 0, 'N'),
	(97, 'Tempor Bibendum Donec LLP', '2016-05-06 23:58:31', '2001-05-16', 4, NULL, 43, 0, 'N'),
	(98, 'Justo Faucibus Limited', '2016-05-06 23:58:31', '2004-06-15', 5, NULL, 77, 0, 'N'),
	(99, 'Faucibus Leo PC', '2016-05-06 23:58:32', '2028-04-17', 6, NULL, 73, 0, 'N'),
	(100, 'Habitant Morbi Tristique Inc.', '2016-05-06 23:58:32', '2013-11-16', 6, NULL, 104, 0, 'N'),
	(101, 'Curae; Inc.', '2016-05-06 23:58:32', '2024-09-16', 3, NULL, 64, 0, 'N'),
	(102, 'At Sem Molestie Corporation', '2016-05-06 23:58:32', '2011-04-17', 4, NULL, 104, 0, 'N'),
	(103, 'Vel Ltd', '2016-05-06 23:58:32', '2020-04-16', 1, NULL, 101, 0, 'N'),
	(104, 'Facilisi Sed Consulting', '2016-05-06 23:58:32', '2030-09-15', 1, NULL, 93, 0, 'N'),
	(105, 'Porttitor Limited', '2016-05-06 23:58:32', '2001-06-16', 3, NULL, 54, 0, 'N'),
	(106, 'Egestas Sed Consulting', '2016-05-06 23:58:32', '2017-03-17', 6, NULL, 102, 0, 'N'),
	(107, 'Elit Pellentesque Company', '2016-05-06 23:58:32', '2020-01-17', 9, NULL, 90, 0, 'N'),
	(108, 'Velit Inc.', '2016-05-06 23:58:32', '2025-05-15', 1, NULL, 52, 0, 'N'),
	(109, 'Nullam Feugiat Corporation', '2016-05-06 23:58:32', '2030-10-16', 1, NULL, 115, 0, 'N'),
	(110, 'Arcu Ac Orci Consulting', '2016-05-06 23:58:32', '2026-04-17', 1, NULL, 94, 0, 'N'),
	(111, 'Suspendisse Limited', '2016-05-06 23:58:32', '2016-06-15', 6, NULL, 53, 0, 'N'),
	(112, 'Non Leo Institute', '2016-05-06 23:58:32', '2018-02-16', 1, NULL, 104, 0, 'N'),
	(113, 'Aliquet Molestie Tellus Corp.', '2016-05-06 23:58:32', '2021-03-17', 7, NULL, 93, 0, 'N'),
	(114, 'Morbi Corp.', '2016-05-06 23:58:32', '2005-11-15', 2, NULL, 109, 0, 'N'),
	(115, 'Velit Dui PC', '2016-05-06 23:58:32', '2023-08-16', 6, NULL, 91, 0, 'N'),
	(116, 'Eu Erat Incorporated', '2016-05-06 23:58:32', '2006-12-16', 8, NULL, 85, 0, 'N'),
	(117, 'Phasellus Nulla Company', '2016-05-06 23:58:32', '2018-02-17', 2, NULL, 107, 0, 'N'),
	(118, 'Laoreet Corporation', '2016-05-06 23:58:32', '2020-08-15', 9, NULL, 66, 0, 'N'),
	(119, 'mensalidade', '2016-05-08 22:24:46', '2017-01-01', 7, NULL, 90, 12, 'N'),
	(120, 'Mensalidade comum', '2016-05-09 15:35:20', '2017-03-10', 7, NULL, 100, 76, 'N');
/*!40000 ALTER TABLE `lancamentos` ENABLE KEYS */;


-- Copiando estrutura para tabela acadlite.lancamentos_fixos
CREATE TABLE IF NOT EXISTS `lancamentos_fixos` (
  `cod_lanc_fixo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT '0',
  `cod_tipo_lanc` int(11) DEFAULT '0',
  `dt_ini` date DEFAULT NULL,
  `dia` int(11) DEFAULT '0',
  `valor` double DEFAULT '0',
  KEY `pk_cod_lanc_fixo` (`cod_lanc_fixo`),
  KEY `FK_cod_tipo_lanc` (`cod_tipo_lanc`),
  CONSTRAINT `FK_cod_tipo_lanc` FOREIGN KEY (`cod_tipo_lanc`) REFERENCES `tipos_lancamentos` (`cod_tipo_lanc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acadlite.lancamentos_fixos: ~2 rows (aproximadamente)
DELETE FROM `lancamentos_fixos`;
/*!40000 ALTER TABLE `lancamentos_fixos` DISABLE KEYS */;
INSERT INTO `lancamentos_fixos` (`cod_lanc_fixo`, `descricao`, `cod_tipo_lanc`, `dt_ini`, `dia`, `valor`) VALUES
	(4, 'Aluguel do prédio', 5, '2016-05-03', 3, 850),
	(5, 'Locação para aulas de pilates', 6, '2016-05-04', 4, 80);
/*!40000 ALTER TABLE `lancamentos_fixos` ENABLE KEYS */;


-- Copiando estrutura para tabela acadlite.log
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` int(11) NOT NULL DEFAULT '0',
  `computador` varchar(50) NOT NULL DEFAULT '0',
  `operacao` varchar(50) NOT NULL DEFAULT '0',
  `dt_operacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_log_cod_usu` (`cod_usuario`),
  CONSTRAINT `FK_log_cod_usu` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acadlite.log: ~77 rows (aproximadamente)
DELETE FROM `log`;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` (`id`, `cod_usuario`, `computador`, `operacao`, `dt_operacao`) VALUES
	(1, 14, 'SERVIDOR', 'Login', '2016-05-06 18:54:31'),
	(2, 14, 'SERVIDOR', 'Login', '2016-05-06 19:01:34'),
	(3, 14, 'SERVIDOR', 'Logout', '2016-05-06 19:01:37'),
	(7, 14, 'SERVIDOR', 'Login', '2016-05-06 19:19:07'),
	(8, 14, 'SERVIDOR', 'Logout', '2016-05-06 19:19:28'),
	(9, 14, 'SERVIDOR', 'Login', '2016-05-06 19:20:20'),
	(10, 14, 'SERVIDOR', 'Logout', '2016-05-06 19:20:58'),
	(11, 14, 'SERVIDOR', 'Login', '2016-05-06 19:22:05'),
	(12, 14, 'SERVIDOR', 'Login', '2016-05-06 19:31:01'),
	(13, 14, 'SERVIDOR', 'Logout', '2016-05-06 19:34:34'),
	(14, 14, 'SERVIDOR', 'Login', '2016-05-06 19:38:03'),
	(15, 14, 'SERVIDOR', 'Logout', '2016-05-06 19:39:28'),
	(16, 14, 'SERVIDOR', 'Login', '2016-05-06 19:41:36'),
	(17, 14, 'SERVIDOR', 'Logout', '2016-05-06 19:43:47'),
	(18, 14, 'SERVIDOR', 'Login', '2016-05-06 19:48:27'),
	(19, 14, 'SERVIDOR', 'Logout', '2016-05-06 19:48:49'),
	(20, 14, 'SERVIDOR', 'Login', '2016-05-06 19:50:09'),
	(21, 14, 'SERVIDOR', 'Login', '2016-05-06 19:52:31'),
	(22, 13, 'SERVIDOR', 'Login', '2016-05-06 19:55:15'),
	(23, 13, 'SERVIDOR', 'Logout', '2016-05-06 19:55:44'),
	(24, 15, 'SERVIDOR', 'Login', '2016-05-06 19:56:01'),
	(25, 14, 'BRUNO-PC', 'Login', '2016-05-06 23:29:42'),
	(26, 14, 'BRUNO-PC', 'Logout', '2016-05-06 23:30:04'),
	(27, 14, 'BRUNO-PC', 'Login', '2016-05-06 23:35:26'),
	(28, 14, 'BRUNO-PC', 'Login', '2016-05-06 23:35:51'),
	(29, 14, 'BRUNO-PC', 'Logout', '2016-05-06 23:36:03'),
	(30, 14, 'BRUNO-PC', 'Login', '2016-05-06 23:36:54'),
	(31, 14, 'BRUNO-PC', 'Login', '2016-05-07 00:49:24'),
	(32, 14, 'BRUNO-PC', 'Login', '2016-05-07 00:50:02'),
	(33, 14, 'BRUNO-PC', 'Login', '2016-05-07 00:51:11'),
	(34, 14, 'BRUNO-PC', 'Login', '2016-05-08 12:13:19'),
	(35, 14, 'BRUNO-PC', 'Logout', '2016-05-08 12:14:47'),
	(36, 14, 'BRUNO-PC', 'Login', '2016-05-08 22:23:16'),
	(37, 14, 'BRUNO-PC', 'Login', '2016-05-09 09:08:01'),
	(38, 14, 'BRUNO-PC', 'Logout', '2016-05-09 09:08:20'),
	(39, 14, 'BRUNO-PC', 'Login', '2016-05-09 09:09:25'),
	(40, 14, 'BRUNO-PC', 'Logout', '2016-05-09 09:10:11'),
	(41, 14, 'BRUNO-PC', 'Login', '2016-05-09 09:11:31'),
	(42, 14, 'BRUNO-PC', 'Login', '2016-05-09 09:13:34'),
	(43, 14, 'BRUNO-PC', 'Login', '2016-05-09 09:16:31'),
	(44, 14, 'BRUNO-PC', 'Login', '2016-05-09 09:20:39'),
	(45, 14, 'BRUNO-PC', 'Logout', '2016-05-09 09:24:13'),
	(46, 14, 'BRUNO-PC', 'Login', '2016-05-09 09:26:18'),
	(47, 14, 'BRUNO-PC', 'Login', '2016-05-09 10:07:33'),
	(48, 14, 'BRUNO-PC', 'Login', '2016-05-09 10:09:22'),
	(49, 14, 'BRUNO-PC', 'Login', '2016-05-09 10:14:21'),
	(50, 14, 'BRUNO-PC', 'Login', '2016-05-09 10:15:21'),
	(51, 14, 'BRUNO-PC', 'Login', '2016-05-09 10:16:18'),
	(52, 14, 'BRUNO-PC', 'Login', '2016-05-09 10:20:17'),
	(53, 14, 'BRUNO-PC', 'Login', '2016-05-09 10:20:38'),
	(54, 14, 'BRUNO-PC', 'Login', '2016-05-09 10:21:09'),
	(55, 14, 'BRUNO-PC', 'Login', '2016-05-09 10:27:42'),
	(56, 14, 'BRUNO-PC', 'Login', '2016-05-09 10:45:11'),
	(57, 14, 'BRUNO-PC', 'Login', '2016-05-09 11:30:30'),
	(58, 14, 'BRUNO-PC', 'Login', '2016-05-09 11:33:35'),
	(59, 14, 'BRUNO-PC', 'Login', '2016-05-09 11:36:56'),
	(60, 14, 'BRUNO-PC', 'Login', '2016-05-09 11:38:25'),
	(61, 14, 'BRUNO-PC', 'Login', '2016-05-09 14:28:22'),
	(62, 14, 'BRUNO-PC', 'Logout', '2016-05-09 14:28:24'),
	(63, 14, 'BRUNO-PC', 'Login', '2016-05-09 15:04:42'),
	(64, 14, 'BRUNO-PC', 'Logout', '2016-05-09 15:04:46'),
	(65, 14, 'BRUNO-PC', 'Login', '2016-05-09 15:28:53'),
	(66, 14, 'BRUNO-PC', 'Logout', '2016-05-09 15:29:48'),
	(67, 14, 'BRUNO-PC', 'Login', '2016-05-09 15:30:35'),
	(68, 14, 'BRUNO-PC', 'Logout', '2016-05-09 15:31:41'),
	(69, 14, 'BRUNO-PC', 'Login', '2016-05-09 15:32:42'),
	(70, 14, 'BRUNO-PC', 'Logout', '2016-05-09 15:33:17'),
	(71, 14, 'BRUNO-PC', 'Login', '2016-05-09 15:34:50'),
	(72, 14, 'BRUNO-PC', 'Login', '2016-05-09 16:30:17'),
	(73, 14, 'BRUNO-PC', 'Login', '2016-05-09 16:34:32'),
	(74, 14, 'BRUNO-PC', 'Login', '2016-05-09 16:37:36'),
	(75, 14, 'BRUNO-PC', 'Login', '2016-05-09 16:40:43'),
	(76, 14, 'BRUNO-PC', 'Login', '2016-05-09 16:43:09'),
	(77, 14, 'BRUNO-PC', 'Login', '2016-05-09 16:48:36'),
	(78, 14, 'BRUNO-PC', 'Login', '2016-05-09 17:02:28'),
	(79, 14, 'BRUNO-PC', 'Logout', '2016-05-09 17:03:18'),
	(80, 14, 'BRUNO-PC', 'Login', '2016-05-09 18:53:34'),
	(81, 14, 'BRUNO-PC', 'Login', '2016-05-10 15:36:55'),
	(82, 14, 'BRUNO-PC', 'Login', '2016-05-10 15:37:48'),
	(83, 14, 'BRUNO-PC', 'Login', '2016-05-10 15:41:06'),
	(84, 14, 'BRUNO-PC', 'Login', '2016-05-10 15:46:59'),
	(85, 14, 'BRUNO-PC', 'Login', '2016-05-10 15:47:42'),
	(86, 14, 'BRUNO-PC', 'Login', '2016-05-10 15:48:35'),
	(87, 14, 'BRUNO-PC', 'Login', '2016-05-10 15:49:22'),
	(88, 14, 'BRUNO-PC', 'Login', '2016-05-10 16:24:41'),
	(89, 14, 'BRUNO-PC', 'Login', '2016-05-10 16:25:41'),
	(90, 14, 'BRUNO-PC', 'Login', '2016-05-10 16:27:58'),
	(91, 14, 'BRUNO-PC', 'Login', '2016-05-10 16:28:39'),
	(92, 14, 'BRUNO-PC', 'Login', '2016-05-10 16:31:47'),
	(93, 14, 'BRUNO-PC', 'Login', '2016-05-10 16:35:56'),
	(94, 14, 'BRUNO-PC', 'Login', '2016-05-10 16:39:32'),
	(95, 14, 'BRUNO-PC', 'Login', '2016-05-10 16:46:58'),
	(96, 14, 'BRUNO-PC', 'Login', '2016-05-10 16:56:34'),
	(97, 14, 'BRUNO-PC', 'Login', '2016-05-10 16:59:38'),
	(98, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:01:02'),
	(99, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:04:08'),
	(100, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:05:54'),
	(101, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:06:49'),
	(102, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:07:51'),
	(103, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:09:37'),
	(104, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:11:59'),
	(105, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:13:43'),
	(106, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:14:44'),
	(107, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:15:43'),
	(108, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:18:57'),
	(109, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:22:18'),
	(110, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:32:41'),
	(111, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:34:31'),
	(112, 14, 'BRUNO-PC', 'Login', '2016-05-10 17:36:07');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;


-- Copiando estrutura para tabela acadlite.mensalidades
CREATE TABLE IF NOT EXISTS `mensalidades` (
  `cod_mensalidade` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL DEFAULT '0',
  `cod_aluno` int(11) NOT NULL DEFAULT '0',
  `dt_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dt_vencimento` date DEFAULT NULL,
  `dt_recebimento` datetime DEFAULT NULL,
  `valor` double NOT NULL DEFAULT '0',
  `valor_recebido` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_mensalidade`),
  KEY `fk_cod_aluno_mens` (`cod_aluno`),
  CONSTRAINT `fk_cod_aluno_mens` FOREIGN KEY (`cod_aluno`) REFERENCES `pessoas` (`cod_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acadlite.mensalidades: ~96 rows (aproximadamente)
DELETE FROM `mensalidades`;
/*!40000 ALTER TABLE `mensalidades` DISABLE KEYS */;
INSERT INTO `mensalidades` (`cod_mensalidade`, `descricao`, `cod_aluno`, `dt_cadastro`, `dt_vencimento`, `dt_recebimento`, `valor`, `valor_recebido`) VALUES
	(10, 'Mensalidade comum', 6, '2016-05-06 10:32:16', '2016-10-10', NULL, 100, 0),
	(11, 'Mensalidade', 38, '2016-05-08 12:14:43', '2018-10-10', NULL, 90, 0),
	(12, 'mensalidade', 9, '2016-05-08 22:24:36', '2017-01-01', '2016-05-08 22:24:46', 90, 90),
	(13, 'teste de datas', 42, '2016-05-09 09:13:59', '2017-01-31', NULL, 80, 0),
	(14, 'teste de datas', 42, '2016-05-09 11:31:03', '2017-02-28', NULL, 80, 0),
	(15, 'teste de datas', 42, '2016-05-09 11:31:14', '2017-03-31', NULL, 80, 0),
	(16, 'teste de datas', 42, '2016-05-09 11:31:14', '2017-04-30', NULL, 80, 0),
	(17, 'teste de datas', 42, '2016-05-09 11:31:41', '2017-04-30', NULL, 80, 0),
	(18, 'teste de datas', 42, '2016-05-09 11:31:41', '2017-05-31', NULL, 80, 0),
	(19, 'teste de datas', 42, '2016-05-09 11:31:41', '2017-06-30', NULL, 80, 0),
	(20, 'teste de datas', 42, '2016-05-09 11:31:41', '2017-07-31', NULL, 80, 0),
	(21, 'teste de datas', 42, '2016-05-09 11:31:41', '2017-08-31', NULL, 80, 0),
	(22, 'teste de datas', 42, '2016-05-09 11:31:41', '2017-09-30', NULL, 80, 0),
	(23, 'teste de datas', 42, '2016-05-09 11:31:41', '2017-10-31', NULL, 80, 0),
	(24, 'teste de datas', 42, '2016-05-09 11:31:41', '2017-11-30', NULL, 80, 0),
	(25, 'teste de datas', 42, '2016-05-09 11:31:41', '2017-12-31', NULL, 80, 0),
	(26, 'teste de datas', 42, '2016-05-09 11:31:41', '2018-01-31', NULL, 80, 0),
	(27, 'teste de datas', 42, '2016-05-09 11:31:41', '2018-02-28', NULL, 80, 0),
	(28, 'teste de datas', 42, '2016-05-09 11:31:41', '2018-03-31', NULL, 80, 0),
	(29, 'teste de datas', 42, '2016-05-09 11:31:41', '2018-04-30', NULL, 80, 0),
	(30, 'teste de datas', 42, '2016-05-09 11:31:41', '2018-05-31', NULL, 80, 0),
	(31, 'teste de datas', 42, '2016-05-09 11:31:42', '2018-06-30', NULL, 80, 0),
	(32, 'teste de datas', 42, '2016-05-09 11:31:42', '2018-07-31', NULL, 80, 0),
	(33, 'teste de datas', 42, '2016-05-09 11:31:42', '2018-08-31', NULL, 80, 0),
	(34, 'teste de datas', 42, '2016-05-09 11:31:42', '2018-09-30', NULL, 80, 0),
	(35, 'teste de datas', 42, '2016-05-09 11:31:42', '2018-10-31', NULL, 80, 0),
	(36, 'teste de datas', 42, '2016-05-09 11:31:42', '2018-11-30', NULL, 80, 0),
	(37, 'teste de datas', 42, '2016-05-09 11:31:42', '2018-12-31', NULL, 80, 0),
	(38, 'teste de datas', 42, '2016-05-09 11:31:42', '2019-01-31', NULL, 80, 0),
	(39, 'teste de datas', 42, '2016-05-09 11:31:42', '2019-02-28', NULL, 80, 0),
	(40, 'teste de datas', 42, '2016-05-09 11:31:42', '2019-03-31', NULL, 80, 0),
	(41, 'teste de datas', 42, '2016-05-09 11:31:42', '2019-04-30', NULL, 80, 0),
	(42, 'teste de datas', 42, '2016-05-09 11:31:42', '2019-05-31', NULL, 80, 0),
	(43, 'teste de datas', 42, '2016-05-09 11:31:42', '2019-06-30', NULL, 80, 0),
	(44, 'teste de datas', 42, '2016-05-09 11:31:42', '2019-07-31', NULL, 80, 0),
	(45, 'teste de datas', 42, '2016-05-09 11:31:42', '2019-08-31', NULL, 80, 0),
	(46, 'teste de datas', 42, '2016-05-09 11:31:42', '2019-09-30', NULL, 80, 0),
	(47, 'teste de datas', 42, '2016-05-09 11:31:42', '2019-10-31', NULL, 80, 0),
	(48, 'Mensalidade', 38, '2016-05-09 11:33:56', '2018-11-10', NULL, 90, 0),
	(49, 'Mensalidade', 38, '2016-05-09 11:33:58', '2018-12-10', NULL, 90, 0),
	(50, 'Mensalidade', 38, '2016-05-09 11:34:00', '2019-01-10', NULL, 90, 0),
	(51, 'Mensalidade', 38, '2016-05-09 11:34:01', '2019-02-10', NULL, 90, 0),
	(52, 'Mensalidade comum', 6, '2016-05-09 11:37:11', '2016-11-10', NULL, 100, 0),
	(53, 'Mensalidade comum', 6, '2016-05-09 11:37:11', '2016-12-10', NULL, 100, 0),
	(54, 'Mensalidade comum', 6, '2016-05-09 11:37:11', '2017-01-10', NULL, 100, 0),
	(55, 'Mensalidade comum', 6, '2016-05-09 11:37:11', '2017-02-10', NULL, 100, 0),
	(56, 'Mensalidade comum', 6, '2016-05-09 11:37:11', '2017-03-10', NULL, 100, 0),
	(57, 'Mensalidade comum', 6, '2016-05-09 11:37:11', '2017-04-10', NULL, 100, 0),
	(58, 'Mensalidade comum', 6, '2016-05-09 11:37:11', '2017-05-10', NULL, 100, 0),
	(59, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2017-06-10', NULL, 100, 0),
	(60, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2017-07-10', NULL, 100, 0),
	(61, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2017-08-10', NULL, 100, 0),
	(62, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2017-09-10', NULL, 100, 0),
	(63, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2017-10-10', NULL, 100, 0),
	(64, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2017-11-10', NULL, 100, 0),
	(65, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2017-12-10', NULL, 100, 0),
	(66, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2018-01-10', NULL, 100, 0),
	(67, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2018-02-10', NULL, 100, 0),
	(68, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2018-03-10', NULL, 100, 0),
	(69, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2018-04-10', NULL, 100, 0),
	(70, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2018-05-10', NULL, 100, 0),
	(71, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2018-06-10', NULL, 100, 0),
	(72, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2018-07-10', NULL, 100, 0),
	(73, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2018-08-10', NULL, 100, 0),
	(74, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2018-09-10', NULL, 100, 0),
	(75, 'Mensalidade comum', 6, '2016-05-09 11:37:12', '2018-10-10', NULL, 100, 0),
	(76, 'Mensalidade comum', 6, '2016-05-09 11:38:40', '2017-03-10', '2016-05-09 15:35:20', 100, 100),
	(77, 'Mensalidade comum', 6, '2016-05-09 11:38:40', '2017-04-10', NULL, 100, 0),
	(78, 'Mensalidade comum', 6, '2016-05-09 11:38:40', '2017-05-10', NULL, 100, 0),
	(79, 'Mensalidade comum', 6, '2016-05-09 11:38:40', '2017-06-10', NULL, 100, 0),
	(80, 'Mensalidade comum', 6, '2016-05-09 11:38:40', '2017-07-10', NULL, 100, 0),
	(81, 'Mensalidade comum', 6, '2016-05-09 11:38:40', '2017-08-10', NULL, 100, 0),
	(82, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2017-09-10', NULL, 100, 0),
	(83, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2017-10-10', NULL, 100, 0),
	(84, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2017-11-10', NULL, 100, 0),
	(85, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2017-12-10', NULL, 100, 0),
	(86, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2018-01-10', NULL, 100, 0),
	(87, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2018-02-10', NULL, 100, 0),
	(88, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2018-03-10', NULL, 100, 0),
	(89, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2018-04-10', NULL, 100, 0),
	(90, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2018-05-10', NULL, 100, 0),
	(91, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2018-06-10', NULL, 100, 0),
	(92, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2018-07-10', NULL, 100, 0),
	(93, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2018-08-10', NULL, 100, 0),
	(94, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2018-09-10', NULL, 100, 0),
	(95, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2018-10-10', NULL, 100, 0),
	(96, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2018-11-10', NULL, 100, 0),
	(97, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2018-12-10', NULL, 100, 0),
	(98, 'Mensalidade comum', 6, '2016-05-09 11:38:41', '2019-01-10', NULL, 100, 0),
	(99, 'Mensalidade comum', 6, '2016-05-09 15:29:12', '2017-10-10', NULL, 100, 0),
	(100, 'Mensalidade comum', 6, '2016-05-09 15:29:12', '2017-11-10', NULL, 100, 0),
	(101, 'Mensalidade comum', 6, '2016-05-09 15:29:12', '2017-12-10', NULL, 100, 0),
	(102, 'Mensalidade comum', 6, '2016-05-09 15:29:12', '2018-01-10', NULL, 100, 0),
	(103, 'teste de datas', 42, '2016-05-09 16:32:23', '2019-02-28', NULL, 80, 0),
	(104, 'teste de datas', 42, '2016-05-09 16:32:23', '2019-03-31', NULL, 80, 0),
	(105, 'teste de datas', 42, '2016-05-09 16:32:23', '2019-04-30', NULL, 80, 0);
/*!40000 ALTER TABLE `mensalidades` ENABLE KEYS */;


-- Copiando estrutura para tabela acadlite.pessoas
CREATE TABLE IF NOT EXISTS `pessoas` (
  `cod_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `dt_nascimento` date DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `telefone` varchar(13) DEFAULT NULL,
  `celular` varchar(13) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  `logradouro` varchar(100) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`cod_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acadlite.pessoas: ~104 rows (aproximadamente)
DELETE FROM `pessoas`;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` (`cod_pessoa`, `nome`, `dt_nascimento`, `cpf`, `telefone`, `celular`, `tipo`, `dt_cadastro`, `logradouro`, `complemento`, `cep`, `bairro`, `cidade`, `uf`) VALUES
	(5, 'Visitante da Academia', '1998-05-10', '604.131.977-51', '(  )         ', '(61) 99876543', 'Comum', '2016-05-02 22:48:45', NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'Aluno Regular', '1986-03-09', '369.196.069-33', '(62) 32245687', NULL, 'Aluno', '2016-05-02 22:49:49', NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'Personal Trainer ', '1978-05-03', '978.331.550-12', '(62) 34558765', '(62) 98765435', 'Professor', '2016-05-02 22:50:54', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 'Todd', '2031-10-15', NULL, '1684060222399', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'Fritz', '2023-05-16', NULL, '1675071956199', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'Rooney', '2018-06-15', NULL, '1696050532599', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'Cullen', '2012-02-16', NULL, '1629060224099', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 'Norman', '2010-03-16', NULL, '1641092968399', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 'Zahir', '2020-02-17', NULL, '1632092567599', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 'Sebastian', '2030-09-16', NULL, '1602092452299', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 'Cole', '2019-12-16', NULL, '1615090859799', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 'Ferris', '2018-01-16', NULL, '1673060709299', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(17, 'Evan', '2014-10-15', NULL, '1644041127499', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(18, 'Ishmael', '2013-03-16', NULL, '1673021814799', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(19, 'David', '2006-01-16', NULL, '1653032486199', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(20, 'Howard', '2030-04-17', NULL, '1646022712899', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(21, 'Neil', '2022-11-16', NULL, '1686111054999', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 'Cade', '2017-10-16', NULL, '1681100715699', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 'Patrick', '2021-01-17', NULL, '1651092973999', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(24, 'Allen', '2018-04-17', NULL, '1601072916099', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(25, 'Dexter', '2015-01-17', NULL, '1648011676499', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(26, 'Kevin', '2006-10-15', NULL, '1697091687899', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(27, 'Curran', '2009-10-15', NULL, '1647102218699', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(28, 'Barrett', '2025-08-16', NULL, '1637120200099', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(29, 'Basil', '2020-09-16', NULL, '1617060820999', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(30, 'Uriah', '2012-11-16', NULL, '1619121023199', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(31, 'Chadwick', '2004-10-16', NULL, '1635051076799', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(32, 'Len', '2027-01-16', NULL, '1660070393899', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(33, 'Leonard', '2015-10-15', NULL, '1602043099499', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(34, 'Peter', '2002-05-17', NULL, '1640010479699', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(35, 'Geoffrey', '2010-10-15', NULL, '1666012115999', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(36, 'Marshall', '2028-08-16', NULL, '1665061522099', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(37, 'Yoshio', '2016-04-17', NULL, '1624102931699', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(38, 'Baxter', '2030-11-15', NULL, '1650043013299', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(39, 'Mannix', '2014-10-15', NULL, '1697092285699', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(40, 'Joseph', '2008-03-16', NULL, '1643070829999', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(41, 'Hashim', '2019-12-15', NULL, '1676102015399', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(42, 'Declan', '2007-04-17', NULL, '1649062602099', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(43, 'Ali', '2005-09-15', NULL, '1638060231499', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(44, 'Ulric', '2020-08-15', NULL, '1661042255499', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(45, 'Elvis', '2024-12-16', NULL, '1637071210299', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(46, 'Hoyt', '2005-10-15', NULL, '1674010198299', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(47, 'Stone', '2009-07-16', NULL, '1688081832699', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(48, 'Jermaine', '2012-03-16', NULL, '1616102003099', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(49, 'Kennedy', '2004-11-15', NULL, '1665062118499', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(50, 'Stewart', '2024-03-17', NULL, '1646051289399', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(51, 'Thaddeus', '2014-09-15', NULL, '1669121075299', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(52, 'Xenos', '2012-08-16', NULL, '1610102725399', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(53, 'Hammett', '2015-04-16', NULL, '1675122515599', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(54, 'Tobias', '2020-04-17', NULL, '1673113034399', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(55, 'Deacon', '2006-01-16', NULL, '1602010477499', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(56, 'Hammett', '2021-05-16', NULL, '1625082732899', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(57, 'Anthony', '2015-11-15', NULL, '1692012831599', NULL, 'Comum', '2016-05-06 23:49:50', 'Rua Dona St', '', '74650-100', 'Se', 'GoiÃ¢nia', 'GO'),
	(58, 'Wallace', '2018-06-16', NULL, '1666080577299', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(59, 'Aquila', '2030-05-15', NULL, '1676010346899', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(60, 'Judah', '2012-12-16', NULL, '1651081105399', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(61, 'Callum', '2019-12-15', NULL, '1683100987499', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(62, 'Mason', '2017-09-16', NULL, '1682022133699', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(63, 'Gage', '2002-03-16', NULL, '1615050478599', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(64, 'Craig', '2006-01-16', NULL, '1625092417699', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(65, 'Tanner', '2011-12-15', NULL, '1602081033999', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(66, 'Brandon', '2025-12-16', NULL, '1653092142299', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(67, 'Benedict', '2027-11-15', NULL, '1625122700699', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(68, 'Fritz', '2017-10-16', NULL, '1651052684299', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(69, 'Jordan', '2011-01-16', NULL, '1672050596199', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(70, 'Yardley', '2006-08-16', NULL, '1632050588599', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(71, 'Stewart', '2008-09-16', NULL, '1625011958999', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(72, 'Burke', '2006-10-15', NULL, '1605071861899', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(73, 'Ashton', '2011-05-16', NULL, '1670081913899', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, '123123123', NULL, NULL, NULL),
	(74, 'Channing', '2012-03-17', NULL, '1684110623699', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(75, 'Hayden', '2022-07-16', NULL, '1677121842499', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(76, 'Brenden', '2007-12-16', NULL, '1689100828099', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(77, 'Jerome', '2014-04-17', NULL, '1677100932799', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(78, 'Elvis', '2017-06-16', NULL, '1678053018899', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(79, 'Solomon', '2030-11-16', NULL, '1698032733699', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(80, 'Jesse', '2023-08-16', NULL, '1604060498399', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(81, 'Peter', '2030-06-16', NULL, '1646042022299', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(82, 'Griffin', '2020-12-15', NULL, '1671020380599', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(83, 'Rudyard', '2031-03-16', NULL, '1689110162799', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(84, 'Carlos', '2025-09-15', NULL, '1610090252299', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(85, 'Hayden', '2006-01-17', NULL, '1646041138099', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(86, 'Peter', '2009-07-16', NULL, '1607010814699', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(87, 'Baxter', '2022-03-17', NULL, '1687122708099', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(88, 'Thor', '2023-09-15', NULL, '1645120860999', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(89, 'Norman', '2022-10-15', NULL, '1664091132599', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(90, 'Baker', '2016-06-15', NULL, '1609022235299', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(91, 'Graham', '2029-04-17', NULL, '1603032816399', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(92, 'Igor', '2009-06-16', NULL, '1672011393899', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(93, 'Cadman', '2023-02-17', NULL, '1639011994599', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(94, 'Tate', '2014-06-15', NULL, '1626060550799', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(95, 'Keith', '2023-07-15', NULL, '1664021504399', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(96, 'Dolan', '2001-12-16', NULL, '1625011938499', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(97, 'Slade', '2024-09-16', NULL, '1671051580599', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(98, 'Ezekiel', '2010-01-16', NULL, '1628022449099', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(99, 'Walker', '2013-06-15', NULL, '1611062680199', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(100, 'Mark', '2014-06-16', NULL, '1601121945799', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(101, 'Jacob', '2001-02-16', NULL, '1682090544999', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(102, 'Lester', '2008-06-15', NULL, '1652011804699', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(103, 'Abel', '2005-09-16', NULL, '1633073094799', NULL, 'Comum', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(104, 'Jamal', '2029-02-16', NULL, '1644082789699', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(105, 'Lucas', '2002-10-15', NULL, '1673070479199', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(106, 'Gannon', '2009-07-16', NULL, '1646050462699', NULL, 'Aluno', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(107, 'Dieter', '2014-08-16', NULL, '1646080655899', NULL, 'Professor', '2016-05-06 23:49:50', NULL, NULL, NULL, NULL, NULL, NULL),
	(108, NULL, NULL, NULL, NULL, NULL, 'Comum', '2016-05-09 15:40:48', NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;


-- Copiando estrutura para procedure acadlite.PROC_REALIZA_LANC_FIXOS
DELIMITER //
CREATE DEFINER=`rise`@`localhost` PROCEDURE `PROC_REALIZA_LANC_FIXOS`()
    COMMENT 'Procedure que realiza os lançamentos fixos'
BEGIN
		INSERT INTO LANCAMENTOS(
				DESCRICAO,
				COD_TIPO_LANC,
				DT_LANC,
				DT_VENCIMENTO,
				VALOR,
				FIXO)
		SELECT DESCRICAO
		      ,COD_TIPO_LANC 
		      ,NOW()
		      ,CURDATE()
				,VALOR
				,'S' 
		FROM LANCAMENTOS_FIXOS LF
		WHERE LF.DT_INI <= CURDATE()
		AND (   ( LF.DIA = EXTRACT(DAY FROM CURDATE()) )
		      OR( ( LF.DIA > LAST_DAY(CURDATE()) ) AND EXTRACT(DAY FROM CURDATE()) = LAST_DAY(CURDATE()) )    
		    )
		AND VALOR > 0;

END//
DELIMITER ;


-- Copiando estrutura para tabela acadlite.tipos_lancamentos
CREATE TABLE IF NOT EXISTS `tipos_lancamentos` (
  `cod_tipo_lanc` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `categoria` varchar(15) DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  `padrao` char(1) DEFAULT 'N',
  PRIMARY KEY (`cod_tipo_lanc`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acadlite.tipos_lancamentos: ~9 rows (aproximadamente)
DELETE FROM `tipos_lancamentos`;
/*!40000 ALTER TABLE `tipos_lancamentos` DISABLE KEYS */;
INSERT INTO `tipos_lancamentos` (`cod_tipo_lanc`, `descricao`, `categoria`, `dt_cadastro`, `padrao`) VALUES
	(1, 'Vendas do Bazar', 'Receita', '2016-04-27 15:31:16', 'N'),
	(2, 'tipo lanc', 'Receita', '2016-05-06 23:55:09', 'N'),
	(3, 'Troca de Lâmpadas Queimadas', 'Despesa', '2016-04-27 17:11:19', 'N'),
	(4, 'Matrícula de Aluno', 'Receita', '2016-05-02 22:57:21', 'N'),
	(5, 'Aluguel ', 'Despesa', '2016-05-02 23:02:55', 'N'),
	(6, 'Locação de espaço para aulas particulares', 'Receita', '2016-05-02 23:04:04', 'N'),
	(7, 'Mensalidade de Aluno', 'Receita', '2016-05-05 20:13:56', 'S'),
	(8, 'Conta de Luz', 'Despesa', '2016-05-05 20:19:47', 'S'),
	(9, 'Conta de Água', 'Despesa', '2016-05-05 20:19:47', 'S');
/*!40000 ALTER TABLE `tipos_lancamentos` ENABLE KEYS */;


-- Copiando estrutura para tabela acadlite.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '0',
  `senha` varchar(50) NOT NULL DEFAULT '0',
  `admin` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acadlite.usuarios: ~3 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nome`, `senha`, `admin`) VALUES
	(13, 'Admin', '#Admin123', 'S'),
	(14, 'bruno', '123', 'N'),
	(15, 'João Caçilds', '10', 'N');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
