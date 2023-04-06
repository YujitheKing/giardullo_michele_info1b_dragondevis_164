-- OM 2021.02.17
-- FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES
-- DE REQUETES MYSQL
-- Database: giardullo_michele_info1B_dragondevis_164

-- Destruction de la BD si elle existe.
-- Pour être certain d'avoir la dernière version des données


DROP DATABASE IF EXISTS giardullo_michele_info1B_dragondevis_164;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS giardullo_michele_info1B_dragondevis_164;

-- Utilisation de cette base de donnée

USE giardullo_michele_info1B_dragondevis_164;
-- --------------------------------------------------------
-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.1.72-community - MySQL Community Server (GPL)
-- SE du serveur:                Win32
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour giardullo_michele_info1b_dragondevis_164
CREATE DATABASE IF NOT EXISTS `giardullo_michele_info1b_dragondevis_164` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `giardullo_michele_info1b_dragondevis_164`;

-- Listage de la structure de la table giardullo_michele_info1b_dragondevis_164. t_clients
CREATE TABLE IF NOT EXISTS `t_clients` (
  `id_clients` int(11) NOT NULL AUTO_INCREMENT,
  `nom_clients` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_clients`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table giardullo_michele_info1b_dragondevis_164.t_clients : ~1 rows (environ)
DELETE FROM `t_clients`;
/*!40000 ALTER TABLE `t_clients` DISABLE KEYS */;
INSERT INTO `t_clients` (`id_clients`, `nom_clients`) VALUES
	(1, 'Petit forestier');
/*!40000 ALTER TABLE `t_clients` ENABLE KEYS */;

-- Listage de la structure de la table giardullo_michele_info1b_dragondevis_164. t_devis
CREATE TABLE IF NOT EXISTS `t_devis` (
  `id_devis` int(11) NOT NULL AUTO_INCREMENT,
  `nom_chantier` varchar(50) DEFAULT NULL,
  `nom_projet` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_devis`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table giardullo_michele_info1b_dragondevis_164.t_devis : ~1 rows (environ)
DELETE FROM `t_devis`;
/*!40000 ALTER TABLE `t_devis` DISABLE KEYS */;
INSERT INTO `t_devis` (`id_devis`, `nom_chantier`, `nom_projet`) VALUES
	(1, 'Tolochenaz', 'Forestier agrandissement');
/*!40000 ALTER TABLE `t_devis` ENABLE KEYS */;

-- Listage de la structure de la table giardullo_michele_info1b_dragondevis_164. t_devis_avoir_clients
CREATE TABLE IF NOT EXISTS `t_devis_avoir_clients` (
  `id_devis_avoir_clients` int(11) NOT NULL AUTO_INCREMENT,
  `fk_client` int(11) DEFAULT NULL,
  `fk_devis` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_devis_avoir_clients`),
  KEY `fk_client` (`fk_client`),
  KEY `fk_devis` (`fk_devis`),
  CONSTRAINT `id_devis_avoir_clients_t_clients` FOREIGN KEY (`fk_client`) REFERENCES `t_clients` (`id_clients`),
  CONSTRAINT `id_devis_avoir_clients_t_devis` FOREIGN KEY (`fk_devis`) REFERENCES `t_devis` (`id_devis`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table giardullo_michele_info1b_dragondevis_164.t_devis_avoir_clients : ~1 rows (environ)
DELETE FROM `t_devis_avoir_clients`;
/*!40000 ALTER TABLE `t_devis_avoir_clients` DISABLE KEYS */;
INSERT INTO `t_devis_avoir_clients` (`id_devis_avoir_clients`, `fk_client`, `fk_devis`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `t_devis_avoir_clients` ENABLE KEYS */;

-- Listage de la structure de la table giardullo_michele_info1b_dragondevis_164. t_devis_avoir_rubriques
CREATE TABLE IF NOT EXISTS `t_devis_avoir_rubriques` (
  `id_devis_avoir_rubriques` int(11) NOT NULL AUTO_INCREMENT,
  `fk_rubriques` int(11) DEFAULT NULL,
  `fk_devis` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_devis_avoir_rubriques`),
  KEY `id_devis_avoir_rubriques_t_rubriques` (`fk_rubriques`),
  KEY `id_devis_avoir_rubriques_t_devis` (`fk_devis`),
  CONSTRAINT `id_devis_avoir_rubriques_t_devis` FOREIGN KEY (`fk_devis`) REFERENCES `t_devis` (`id_devis`),
  CONSTRAINT `id_devis_avoir_rubriques_t_rubriques` FOREIGN KEY (`fk_rubriques`) REFERENCES `t_rubriques` (`id_rubriques`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table giardullo_michele_info1b_dragondevis_164.t_devis_avoir_rubriques : ~1 rows (environ)
DELETE FROM `t_devis_avoir_rubriques`;
/*!40000 ALTER TABLE `t_devis_avoir_rubriques` DISABLE KEYS */;
INSERT INTO `t_devis_avoir_rubriques` (`id_devis_avoir_rubriques`, `fk_rubriques`, `fk_devis`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `t_devis_avoir_rubriques` ENABLE KEYS */;

-- Listage de la structure de la table giardullo_michele_info1b_dragondevis_164. t_rubriques
CREATE TABLE IF NOT EXISTS `t_rubriques` (
  `id_rubriques` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(50) DEFAULT NULL,
  `Quantité` decimal(10,2) DEFAULT NULL,
  `Prix` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_rubriques`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table giardullo_michele_info1b_dragondevis_164.t_rubriques : ~1 rows (environ)
DELETE FROM `t_rubriques`;
/*!40000 ALTER TABLE `t_rubriques` DISABLE KEYS */;
INSERT INTO `t_rubriques` (`id_rubriques`, `designation`, `Quantité`, `Prix`) VALUES
	(1, 'Pose de containère fermé', 1.00, 200.00);
/*!40000 ALTER TABLE `t_rubriques` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
