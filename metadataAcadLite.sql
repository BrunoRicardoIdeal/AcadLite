-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.12-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.3.0.4984
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela acadlite.lancamentos
CREATE TABLE IF NOT EXISTS `lancamentos` (
  `cod_lanc` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `dt_lanc` datetime DEFAULT CURRENT_TIMESTAMP,
  `dt_vencimento` date DEFAULT NULL,
  `cod_tipo_lanc` int(11) DEFAULT NULL,
  `dt_exclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_lanc`),
  KEY `cod_tipo_lanc` (`cod_tipo_lanc`),
  CONSTRAINT `lancamentos_ibfk_1` FOREIGN KEY (`cod_tipo_lanc`) REFERENCES `tipos_lancamentos` (`cod_tipo_lanc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela acadlite.pessoas
CREATE TABLE IF NOT EXISTS `pessoas` (
  `cod_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `dt_nascimento` date DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `celular` varchar(12) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela acadlite.tipos_lancamentos
CREATE TABLE IF NOT EXISTS `tipos_lancamentos` (
  `cod_tipo_lanc` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `categoria` varchar(15) DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_tipo_lanc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
