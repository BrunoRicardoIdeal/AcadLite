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


-- Copiando estrutura para tabela acadlite.execucao_jobs
CREATE TABLE IF NOT EXISTS `execucao_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT '0',
  `data_exec` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


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
  `fixo` char(1) DEFAULT 'N',
  PRIMARY KEY (`cod_lanc`),
  KEY `cod_tipo_lanc` (`cod_tipo_lanc`),
  CONSTRAINT `lancamentos_ibfk_1` FOREIGN KEY (`cod_tipo_lanc`) REFERENCES `tipos_lancamentos` (`cod_tipo_lanc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


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
  PRIMARY KEY (`cod_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


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
  PRIMARY KEY (`cod_tipo_lanc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
