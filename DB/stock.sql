-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 25, 2019 at 03:55 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `stock`
--
CREATE DATABASE IF NOT EXISTS `stock` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `stock`;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id_art` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_art` varchar(50) NOT NULL,
  `type_art` int(11) NOT NULL,
  `prix_art` double NOT NULL,
  `qte_art` int(11) NOT NULL,
  `id_fr` int(11) NOT NULL,
  PRIMARY KEY (`id_art`),
  KEY `id_fr` (`id_fr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `id_com` int(11) NOT NULL AUTO_INCREMENT,
  `id_res` int(11) NOT NULL,
  `date_com` date NOT NULL,
  `Total` int(11) NOT NULL,
  PRIMARY KEY (`id_com`),
  KEY `id_res` (`id_res`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
  `id_fac` int(11) NOT NULL AUTO_INCREMENT,
  `date_fac` date NOT NULL,
  `id_com` int(11) NOT NULL,
  PRIMARY KEY (`id_fac`),
  KEY `id_com` (`id_com`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id_fr` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_fr` varchar(50) NOT NULL,
  `adresse_fr` varchar(100) NOT NULL,
  `tel_fr` int(11) NOT NULL,
  `email_fr` varchar(50) NOT NULL,
  PRIMARY KEY (`id_fr`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `ligne_de_commande`
--

CREATE TABLE IF NOT EXISTS `ligne_de_commande` (
  `qte` int(11) NOT NULL,
  `id_com` int(11) NOT NULL,
  `id_art` int(11) NOT NULL,
  KEY `id_com` (`id_com`),
  KEY `id_art` (`id_art`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `responsable`
--

CREATE TABLE IF NOT EXISTS `responsable` (
  `id_res` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_res` varchar(50) NOT NULL,
  `adresse_res` varchar(100) NOT NULL,
  `tel_res` int(11) NOT NULL,
  `email_res` varchar(50) NOT NULL,
  PRIMARY KEY (`id_res`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `login_user` varchar(50) NOT NULL,
  `mdp` varchar(50) NOT NULL,
  `libelle_user` varchar(50) NOT NULL,
  `dateNaissance_user` date NOT NULL,
  `sexe_user` varchar(10) NOT NULL,
  `service_user` varchar(50) NOT NULL,
  `adresse_user` varchar(100) NOT NULL,
  `tel_user` int(11) NOT NULL,
  `email_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `login_user`, `mdp`, `libelle_user`, `dateNaissance_user`, `sexe_user`, `service_user`, `adresse_user`, `tel_user`, `email_user`) VALUES
(1, 'yassine', 'azerty', 'yassine faiq', '1998-05-05', 'M', 'Service informatique', 'Lyccée lissane Eddine Ibnou Lkhatib', 635488101, 'yassinorajawino@gmail.com'),
(2, 'test', 'test', 'test', '2019-11-11', 'M', 'test', 'test', 655, 'test@');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`id_fr`) REFERENCES `fournisseur` (`id_fr`);

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_res`) REFERENCES `responsable` (`id_res`);

--
-- Constraints for table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`id_com`) REFERENCES `commande` (`id_com`);

--
-- Constraints for table `ligne_de_commande`
--
ALTER TABLE `ligne_de_commande`
  ADD CONSTRAINT `ligne_de_commande_ibfk_2` FOREIGN KEY (`id_art`) REFERENCES `article` (`id_art`),
  ADD CONSTRAINT `ligne_de_commande_ibfk_1` FOREIGN KEY (`id_com`) REFERENCES `commande` (`id_com`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
