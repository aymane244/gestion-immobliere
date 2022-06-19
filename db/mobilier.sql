-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 16 juin 2022 à 12:28
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mobilier`
--

-- --------------------------------------------------------

--
-- Structure de la table `achat`
--

CREATE TABLE `achat` (
  `achat_id` int(11) NOT NULL,
  `achat_ajout` date DEFAULT NULL,
  `achat_confirmation` varchar(50) DEFAULT NULL,
  `achat_document` varchar(150) DEFAULT NULL,
  `achat_bien` int(11) NOT NULL,
  `achat_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `achat`
--

INSERT INTO `achat` (`achat_id`, `achat_ajout`, `achat_confirmation`, `achat_document`, `achat_bien`, `achat_client`) VALUES
(18, '2022-06-02', NULL, NULL, 1, 59),
(19, '2022-06-02', NULL, NULL, 3, 59);

-- --------------------------------------------------------

--
-- Structure de la table `achatprogramme`
--

CREATE TABLE `achatprogramme` (
  `achat_id` int(11) NOT NULL,
  `achat_ajout` date DEFAULT NULL,
  `achat_confirmation` varchar(45) DEFAULT NULL,
  `achat_document` varchar(45) DEFAULT NULL,
  `achat_programme` int(11) NOT NULL,
  `achat_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `achatprogramme`
--

INSERT INTO `achatprogramme` (`achat_id`, `achat_ajout`, `achat_confirmation`, `achat_document`, `achat_programme`, `achat_client`) VALUES
(6, '2022-06-13', 'confimer', NULL, 2, 59);

-- --------------------------------------------------------

--
-- Structure de la table `achatprojet`
--

CREATE TABLE `achatprojet` (
  `achat_id` int(11) NOT NULL,
  `achat_ajout` date DEFAULT NULL,
  `achat_confirmation` varchar(45) DEFAULT NULL,
  `achat_document` varchar(45) DEFAULT NULL,
  `achat_projet` int(11) NOT NULL,
  `achat_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `achatprojet`
--

INSERT INTO `achatprojet` (`achat_id`, `achat_ajout`, `achat_confirmation`, `achat_document`, `achat_projet`, `achat_client`) VALUES
(9, '2022-06-12', 'confirmer', 'test.pdf', 5, 59);

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(11) NOT NULL,
  `adm_nom` varchar(45) DEFAULT NULL,
  `adm_prenom` varchar(45) DEFAULT NULL,
  `adm_email` varchar(45) DEFAULT NULL,
  `adm_motdepasse` varchar(45) DEFAULT NULL,
  `adm_image` varchar(45) DEFAULT NULL,
  `adm_date` date DEFAULT NULL,
  `admin_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`adm_id`, `adm_nom`, `adm_prenom`, `adm_email`, `adm_motdepasse`, `adm_image`, `adm_date`, `admin_role`) VALUES
(1, 'Chnaif', 'Aimanee', 'a.chnaif2010@gmail.com', 'azerty', NULL, '2022-04-02', 1),
(2, 'Mourad', 'Bennis', 'aimane.chnaif@gmail.com', 'azerty', '1569162702507.jpg', '2022-04-02', 1),
(3, 'Moutanaba', 'Farid', 'farid@gmail.com', 'azerty', NULL, '2022-05-30', 1),
(5, 'Saada', 'Hicham', 'hicham@gmail.com', 'azerty', NULL, '2022-05-30', 2),
(6, 'fahmi', 'Mourad', 'mourad@gmail.com', 'azerty', NULL, '2022-06-02', 2);

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

CREATE TABLE `agent` (
  `agt_id` int(11) NOT NULL,
  `agt_nom` varchar(45) DEFAULT NULL,
  `agt_prenom` varchar(45) DEFAULT NULL,
  `agt_email` varchar(45) DEFAULT NULL,
  `agt_cin` varchar(45) DEFAULT NULL,
  `agt_password` varchar(45) DEFAULT NULL,
  `agt_image` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`agt_id`, `agt_nom`, `agt_prenom`, `agt_email`, `agt_cin`, `agt_password`, `agt_image`) VALUES
(15, 'Bennis', 'Mourad', 'aimane.chnaif@gmail.com', 'Y6666', 'azerty', '1569162702507.jpg'),
(16, 'Chnaif', 'Aimane', 'a.chnaif2010@gmail.com', 'F8888', 'azerty', 'library.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `bienprogramme`
--

CREATE TABLE `bienprogramme` (
  `bien_id` int(11) NOT NULL,
  `bien_nom` varchar(45) DEFAULT NULL,
  `bien_prix` int(11) DEFAULT NULL,
  `bien_prix_metre` int(11) DEFAULT NULL,
  `bien_chambres` int(11) DEFAULT NULL,
  `bien_type` varchar(45) DEFAULT NULL,
  `bien_programme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `bienprogramme`
--

INSERT INTO `bienprogramme` (`bien_id`, `bien_nom`, `bien_prix`, `bien_prix_metre`, `bien_chambres`, `bien_type`, `bien_programme`) VALUES
(1, 'qsdqsd', 10000, 1000, 3, 'Villas', 1),
(2, 'Residence Saada', 300000, 2000, 3, 'Appartement', 2);

-- --------------------------------------------------------

--
-- Structure de la table `bienprojet`
--

CREATE TABLE `bienprojet` (
  `bien_id` int(11) NOT NULL,
  `bien_nom` varchar(45) DEFAULT NULL,
  `bien_prix` int(11) DEFAULT NULL,
  `bien_prix_metre` int(11) DEFAULT NULL,
  `bien_chambres` int(11) DEFAULT NULL,
  `bien_type` varchar(45) DEFAULT NULL,
  `bien_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `bienprojet`
--

INSERT INTO `bienprojet` (`bien_id`, `bien_nom`, `bien_prix`, `bien_prix_metre`, `bien_chambres`, `bien_type`, `bien_projet`) VALUES
(5, 'Manara Residence', 100000, 3000, 3, 'Appartement', 2),
(11, 'Residence Rahma', 480000, 4000, 4, 'Appartement', 4),
(12, 'Residence Safaa', 10000, 3000, 3, 'Appartement', 3),
(13, 'Residence Imran', 10000, 3000, 3, 'Appartement', 4);

-- --------------------------------------------------------

--
-- Structure de la table `biens`
--

CREATE TABLE `biens` (
  `bien_id` int(11) NOT NULL,
  `bien_nom` varchar(45) DEFAULT NULL,
  `bien_type` varchar(45) DEFAULT NULL,
  `bien_addresse` varchar(45) DEFAULT NULL,
  `bien_superficie` varchar(45) DEFAULT NULL,
  `bien_chambres` varchar(45) DEFAULT NULL,
  `bien_syndic` varchar(45) DEFAULT NULL,
  `bien_ajout` date DEFAULT NULL,
  `bien_garage` varchar(45) DEFAULT NULL,
  `bien_description` longtext DEFAULT NULL,
  `bien_image` varchar(200) DEFAULT NULL,
  `bien_prix` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `biens`
--

INSERT INTO `biens` (`bien_id`, `bien_nom`, `bien_type`, `bien_addresse`, `bien_superficie`, `bien_chambres`, `bien_syndic`, `bien_ajout`, `bien_garage`, `bien_description`, `bien_image`, `bien_prix`) VALUES
(1, 'Maison a Casablanca', 'Maisons', 'xcwxc', '110', '5', '200', '2022-04-29', 'Oui', '<p>wxcwxcwxcwx<strong>cwxcwxcw</strong></p>\r\n', 'unknown_person.jpg', 200000),
(3, 'Test', 'Appartement', 'Riad Ahlan', '70', '3', '100', '2022-05-03', 'Oui', '<p>azertyuioplkjhgfdsqwxcvbn,,nbvcxwqsdfghjkl</p>\r\n\r\n<p>lkjhgfdszertyuiolkjhgfdsqwxcvbn,</p>\r\n\r\n<p>lkjhgfdszertyuio,nbvcx</p>\r\n', '200px-Portugal_Telecom_logo.png', 200000);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `clt_id` int(11) NOT NULL,
  `clt_nom` varchar(45) DEFAULT NULL,
  `clt_prenom` varchar(45) DEFAULT NULL,
  `clt_email` varchar(45) DEFAULT NULL,
  `clt_telephone` varchar(45) DEFAULT NULL,
  `clt_password` varchar(45) DEFAULT NULL,
  `clt_image` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`clt_id`, `clt_nom`, `clt_prenom`, `clt_email`, `clt_telephone`, `clt_password`, `clt_image`) VALUES
(59, 'Chnaif', 'Aimane', 'a.chnaif2010@gmail.com', '0644776612', 'azerty', NULL),
(60, 'Bennis', 'Mourad', 'aimane.chnaif@gmail.com', '0644776612', 'azerty', '1569162702507.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `conseil`
--

CREATE TABLE `conseil` (
  `con_id` int(11) NOT NULL,
  `con_conseil` longtext DEFAULT NULL,
  `con_bien` int(11) NOT NULL,
  `con_client` int(11) NOT NULL,
  `con_notaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `conseil`
--

INSERT INTO `conseil` (`con_id`, `con_conseil`, `con_bien`, `con_client`, `con_notaire`) VALUES
(5, 'Do not buy it is scam', 1, 59, 5),
(7, NULL, 3, 59, 5);

-- --------------------------------------------------------

--
-- Structure de la table `conseilprogramme`
--

CREATE TABLE `conseilprogramme` (
  `con_id` int(11) NOT NULL,
  `con_notaire` int(11) NOT NULL,
  `con_client` int(11) NOT NULL,
  `con_programme` int(11) NOT NULL,
  `con_message` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `conseilprogramme`
--

INSERT INTO `conseilprogramme` (`con_id`, `con_notaire`, `con_client`, `con_programme`, `con_message`) VALUES
(5, 5, 59, 2, 'good buy');

-- --------------------------------------------------------

--
-- Structure de la table `conseilprojet`
--

CREATE TABLE `conseilprojet` (
  `con_id` int(11) NOT NULL,
  `con_notaire` int(11) NOT NULL,
  `con_client` int(11) NOT NULL,
  `con_projet` int(11) NOT NULL,
  `con_message` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `conseilprojet`
--

INSERT INTO `conseilprojet` (`con_id`, `con_notaire`, `con_client`, `con_projet`, `con_message`) VALUES
(5, 5, 59, 5, 'C\'est un  bon projet vous pouvez l\'acheter');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `con_id` int(11) NOT NULL,
  `con_nom` varchar(45) DEFAULT NULL,
  `con_email` varchar(45) DEFAULT NULL,
  `con_sujet` varchar(45) DEFAULT NULL,
  `con_message` longtext DEFAULT NULL,
  `con_ajout` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`con_id`, `con_nom`, `con_email`, `con_sujet`, `con_message`, `con_ajout`) VALUES
(1, 'Aimane Chnaif', 'a.chnaif2010@gmail.com', 'a.chnaif2010@gmail.com', 'wxcwxcwxc', '2022-05-14');

-- --------------------------------------------------------

--
-- Structure de la table `notaire`
--

CREATE TABLE `notaire` (
  `not_id` int(11) NOT NULL,
  `not_nom` varchar(45) DEFAULT NULL,
  `not_prenom` varchar(45) DEFAULT NULL,
  `not_cin` varchar(45) DEFAULT NULL,
  `not_telephone` varchar(45) DEFAULT NULL,
  `not_email` varchar(45) DEFAULT NULL,
  `not_motdepasse` varchar(45) DEFAULT NULL,
  `not_image` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notaire`
--

INSERT INTO `notaire` (`not_id`, `not_nom`, `not_prenom`, `not_cin`, `not_telephone`, `not_email`, `not_motdepasse`, `not_image`) VALUES
(4, 'Chnaif', 'Aimane', 'Y6666', '+212644776612', 'a.chnaif2010@gmail.com', 'azerty', NULL),
(5, 'Benniss', 'Mourad', 'T6666', '0644776612', 'aimane.chnaif@gmail.com', 'azerty', '1569162702507.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `programmes`
--

CREATE TABLE `programmes` (
  `pro_id` int(11) NOT NULL,
  `pro_etat` varchar(45) DEFAULT NULL,
  `pro_description` longtext DEFAULT NULL,
  `pro_date` date DEFAULT NULL,
  `pro_image` varchar(45) DEFAULT NULL,
  `pro_nom` varchar(45) DEFAULT NULL,
  `pro_ajout` date DEFAULT NULL,
  `pro_unite` int(11) DEFAULT NULL,
  `pro_ville` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `programmes`
--

INSERT INTO `programmes` (`pro_id`, `pro_etat`, `pro_description`, `pro_date`, `pro_image`, `pro_nom`, `pro_ajout`, `pro_unite`, `pro_ville`) VALUES
(1, 'En cours', '<p>fghjkl</p>\r\n', '2025-05-27', '200px-Portugal_Telecom_logo.png', 'cvbn', '2022-05-02', 200, 'Casablanca'),
(2, 'Livr?', '<p>Programme <strong>AL KHEIR </strong>est un programme de moyen standing d&eacute;stin&eacute; &agrave; toute cat&eacute;gorie de population</p>\r\n', '2022-05-01', 'contacts.png', 'Progamme Al Kheir', '2022-06-13', 100, 'Mohammedia');

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

CREATE TABLE `projets` (
  `pro_id` int(11) NOT NULL,
  `pro_etat` varchar(45) DEFAULT NULL,
  `pro_description` longtext DEFAULT NULL,
  `pro_date` date DEFAULT NULL,
  `pro_image` varchar(45) DEFAULT NULL,
  `pro_ajout` date DEFAULT NULL,
  `pro_unite` varchar(45) DEFAULT NULL,
  `pro_nom` varchar(50) DEFAULT NULL,
  `pro_ville` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projets`
--

INSERT INTO `projets` (`pro_id`, `pro_etat`, `pro_description`, `pro_date`, `pro_image`, `pro_ajout`, `pro_unite`, `pro_nom`, `pro_ville`) VALUES
(2, 'En cours', '<p>test</p>\r\n', '2022-05-27', '200px-Portugal_Telecom_logo.png', '2022-05-14', '160', 'projet test', 'Tanger'),
(3, 'En cours', '<p>Peojet Doha</p>\r\n', '2022-06-30', 'logo.png', '2022-06-11', '200', 'Doha', 'Casablanca'),
(4, 'En cours', '<p>Un projet en cours de construction dans un quartier luxe &agrave; Rabat</p>\r\n', '2023-06-01', 'logo.png', '2022-06-13', '250', 'Projet Imran', 'Rabat');

-- --------------------------------------------------------

--
-- Structure de la table `promoteur`
--

CREATE TABLE `promoteur` (
  `pro_id` int(11) NOT NULL,
  `pro_nom` varchar(45) DEFAULT NULL,
  `pro_prenom` varchar(45) DEFAULT NULL,
  `pro_cin` varchar(45) DEFAULT NULL,
  `pro_telephone` varchar(45) DEFAULT NULL,
  `pro_email` varchar(45) DEFAULT NULL,
  `pro_motdepasse` varchar(45) DEFAULT NULL,
  `pro_image` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `promoteur`
--

INSERT INTO `promoteur` (`pro_id`, `pro_nom`, `pro_prenom`, `pro_cin`, `pro_telephone`, `pro_email`, `pro_motdepasse`, `pro_image`) VALUES
(2, 'Chnaif', 'Aimane', 'T6666', '0644776612', 'a.chnaif2010@gmail.com', 'azerty', NULL),
(3, 'Bennis', 'Mourad', 'G6666', '0644776612', 'aymane@gmail.com', 'azerty', 'logo.png');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `res_id` int(11) NOT NULL,
  `res_nom` varchar(45) DEFAULT NULL,
  `res_email` varchar(45) DEFAULT NULL,
  `res_phone` varchar(45) DEFAULT NULL,
  `res_date` date DEFAULT NULL,
  `res_heure` varchar(45) DEFAULT NULL,
  `res_ajout` date DEFAULT NULL,
  `res_bien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`res_id`, `res_nom`, `res_email`, `res_phone`, `res_date`, `res_heure`, `res_ajout`, `res_bien`) VALUES
(1, 'Aimane Chnaif', 'a.chnaif2010@gmail.com', '0644776612', '2022-05-18', '09:00', '2022-05-11', 1),
(2, 'Aimane Chnaif', 'a.chnaif2010@gmail.com', '0644776612', '2022-05-18', '09:00', '2022-05-11', 1),
(3, 'Aimane Chnaif', 'a.chnaif2010@gmail.com', '0644776612', '2022-05-18', '09:00', '2022-05-11', 1),
(4, 'Chnaif Aimane', NULL, NULL, NULL, NULL, '2022-05-11', 1),
(5, 'Chnaif Aimane', NULL, NULL, NULL, NULL, '2022-05-11', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservationprogramme`
--

CREATE TABLE `reservationprogramme` (
  `res_id` int(11) NOT NULL,
  `res_nom` varchar(45) DEFAULT NULL,
  `res_email` varchar(45) DEFAULT NULL,
  `res_phone` varchar(45) DEFAULT NULL,
  `res_date` varchar(45) DEFAULT NULL,
  `res_heure` varchar(45) DEFAULT NULL,
  `res_ajout` varchar(45) DEFAULT NULL,
  `res_programme` int(11) DEFAULT NULL,
  `res_nom_programme` varchar(50) DEFAULT NULL,
  `res_nom_residence` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservationprogramme`
--

INSERT INTO `reservationprogramme` (`res_id`, `res_nom`, `res_email`, `res_phone`, `res_date`, `res_heure`, `res_ajout`, `res_programme`, `res_nom_programme`, `res_nom_residence`) VALUES
(2, 'Aimane Chnaif', 'a.chnaif2010@gmail.com', '0644776612', '2022-06-02', '09:00', '2022-05-31', 1, 'cvbn', 'wxcv');

-- --------------------------------------------------------

--
-- Structure de la table `reservationprojet`
--

CREATE TABLE `reservationprojet` (
  `res_id` int(11) NOT NULL,
  `res_nom` varchar(45) DEFAULT NULL,
  `res_email` varchar(45) DEFAULT NULL,
  `res_phone` varchar(45) DEFAULT NULL,
  `res_date` date DEFAULT NULL,
  `res_heure` varchar(45) DEFAULT NULL,
  `res_projet` int(11) DEFAULT NULL,
  `res_ajout` date DEFAULT NULL,
  `res_nom_projet` varchar(50) DEFAULT NULL,
  `res_nom_residence` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservationprojet`
--

INSERT INTO `reservationprojet` (`res_id`, `res_nom`, `res_email`, `res_phone`, `res_date`, `res_heure`, `res_projet`, `res_ajout`, `res_nom_projet`, `res_nom_residence`) VALUES
(1, 'Aimane Chnaif', 'a.chnaif2010@gmail.com', '0644776612', '2022-05-28', '14:00', 2, '2022-05-16', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `rol_id` int(11) NOT NULL,
  `rol_nom` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`rol_id`, `rol_nom`) VALUES
(1, 'Superviseur'),
(2, 'Moderateur');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `achat`
--
ALTER TABLE `achat`
  ADD PRIMARY KEY (`achat_id`),
  ADD KEY `achatClient` (`achat_client`),
  ADD KEY `achatBien` (`achat_bien`);

--
-- Index pour la table `achatprogramme`
--
ALTER TABLE `achatprogramme`
  ADD PRIMARY KEY (`achat_id`),
  ADD KEY `programmeClient` (`achat_client`),
  ADD KEY `programmeBien` (`achat_programme`);

--
-- Index pour la table `achatprojet`
--
ALTER TABLE `achatprojet`
  ADD PRIMARY KEY (`achat_id`),
  ADD KEY `clients` (`achat_client`),
  ADD KEY `achatProjets` (`achat_projet`);

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`),
  ADD KEY `adminRole` (`admin_role`);

--
-- Index pour la table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`agt_id`);

--
-- Index pour la table `bienprogramme`
--
ALTER TABLE `bienprogramme`
  ADD PRIMARY KEY (`bien_id`),
  ADD KEY `bienProgramme` (`bien_programme`);

--
-- Index pour la table `bienprojet`
--
ALTER TABLE `bienprojet`
  ADD PRIMARY KEY (`bien_id`),
  ADD KEY `bienProjets` (`bien_projet`);

--
-- Index pour la table `biens`
--
ALTER TABLE `biens`
  ADD PRIMARY KEY (`bien_id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`clt_id`);

--
-- Index pour la table `conseil`
--
ALTER TABLE `conseil`
  ADD PRIMARY KEY (`con_id`),
  ADD KEY `conseilClient` (`con_client`),
  ADD KEY `conseilBien` (`con_bien`),
  ADD KEY `conseilNotaire` (`con_notaire`);

--
-- Index pour la table `conseilprogramme`
--
ALTER TABLE `conseilprogramme`
  ADD PRIMARY KEY (`con_id`),
  ADD KEY `connotaire` (`con_notaire`),
  ADD KEY `conclient` (`con_client`),
  ADD KEY `conprogramme` (`con_programme`);

--
-- Index pour la table `conseilprojet`
--
ALTER TABLE `conseilprojet`
  ADD PRIMARY KEY (`con_id`),
  ADD KEY `conseilsnotaire` (`con_notaire`),
  ADD KEY `conseilsclient` (`con_client`),
  ADD KEY `conseilProjet` (`con_projet`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`con_id`);

--
-- Index pour la table `notaire`
--
ALTER TABLE `notaire`
  ADD PRIMARY KEY (`not_id`);

--
-- Index pour la table `programmes`
--
ALTER TABLE `programmes`
  ADD PRIMARY KEY (`pro_id`);

--
-- Index pour la table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`pro_id`);

--
-- Index pour la table `promoteur`
--
ALTER TABLE `promoteur`
  ADD PRIMARY KEY (`pro_id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `res_bien` (`res_bien`);

--
-- Index pour la table `reservationprogramme`
--
ALTER TABLE `reservationprogramme`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `res_programme` (`res_programme`);

--
-- Index pour la table `reservationprojet`
--
ALTER TABLE `reservationprojet`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `res_projet` (`res_projet`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`rol_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `achat`
--
ALTER TABLE `achat`
  MODIFY `achat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `achatprogramme`
--
ALTER TABLE `achatprogramme`
  MODIFY `achat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `achatprojet`
--
ALTER TABLE `achatprojet`
  MODIFY `achat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `agent`
--
ALTER TABLE `agent`
  MODIFY `agt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `bienprogramme`
--
ALTER TABLE `bienprogramme`
  MODIFY `bien_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `bienprojet`
--
ALTER TABLE `bienprojet`
  MODIFY `bien_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `biens`
--
ALTER TABLE `biens`
  MODIFY `bien_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `clt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pour la table `conseil`
--
ALTER TABLE `conseil`
  MODIFY `con_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `conseilprogramme`
--
ALTER TABLE `conseilprogramme`
  MODIFY `con_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `conseilprojet`
--
ALTER TABLE `conseilprojet`
  MODIFY `con_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `con_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `notaire`
--
ALTER TABLE `notaire`
  MODIFY `not_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `programmes`
--
ALTER TABLE `programmes`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `projets`
--
ALTER TABLE `projets`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `promoteur`
--
ALTER TABLE `promoteur`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `res_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `reservationprogramme`
--
ALTER TABLE `reservationprogramme`
  MODIFY `res_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `reservationprojet`
--
ALTER TABLE `reservationprojet`
  MODIFY `res_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `achat`
--
ALTER TABLE `achat`
  ADD CONSTRAINT `achatBien` FOREIGN KEY (`achat_bien`) REFERENCES `biens` (`bien_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `achatClient` FOREIGN KEY (`achat_client`) REFERENCES `client` (`clt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `achatprogramme`
--
ALTER TABLE `achatprogramme`
  ADD CONSTRAINT `programmeBien` FOREIGN KEY (`achat_programme`) REFERENCES `bienprogramme` (`bien_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `programmeClient` FOREIGN KEY (`achat_client`) REFERENCES `client` (`clt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `achatprojet`
--
ALTER TABLE `achatprojet`
  ADD CONSTRAINT `achatProjets` FOREIGN KEY (`achat_projet`) REFERENCES `bienprojet` (`bien_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `clients` FOREIGN KEY (`achat_client`) REFERENCES `client` (`clt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `adminRole` FOREIGN KEY (`admin_role`) REFERENCES `role` (`rol_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `bienprogramme`
--
ALTER TABLE `bienprogramme`
  ADD CONSTRAINT `bienProgramme` FOREIGN KEY (`bien_programme`) REFERENCES `programmes` (`pro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `bienprojet`
--
ALTER TABLE `bienprojet`
  ADD CONSTRAINT `bienProjets` FOREIGN KEY (`bien_projet`) REFERENCES `projets` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `conseil`
--
ALTER TABLE `conseil`
  ADD CONSTRAINT `conseilBien` FOREIGN KEY (`con_bien`) REFERENCES `biens` (`bien_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `conseilClient` FOREIGN KEY (`con_client`) REFERENCES `client` (`clt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `conseilNotaire` FOREIGN KEY (`con_notaire`) REFERENCES `notaire` (`not_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `conseilprogramme`
--
ALTER TABLE `conseilprogramme`
  ADD CONSTRAINT `conclient` FOREIGN KEY (`con_client`) REFERENCES `client` (`clt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `connotaire` FOREIGN KEY (`con_notaire`) REFERENCES `notaire` (`not_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `conprogramme` FOREIGN KEY (`con_programme`) REFERENCES `bienprogramme` (`bien_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `conseilprojet`
--
ALTER TABLE `conseilprojet`
  ADD CONSTRAINT `conseilProjet` FOREIGN KEY (`con_projet`) REFERENCES `bienprojet` (`bien_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `conseilsclient` FOREIGN KEY (`con_client`) REFERENCES `client` (`clt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `conseilsnotaire` FOREIGN KEY (`con_notaire`) REFERENCES `notaire` (`not_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`res_bien`) REFERENCES `biens` (`bien_id`);

--
-- Contraintes pour la table `reservationprogramme`
--
ALTER TABLE `reservationprogramme`
  ADD CONSTRAINT `res_programme` FOREIGN KEY (`res_programme`) REFERENCES `programmes` (`pro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reservationprojet`
--
ALTER TABLE `reservationprojet`
  ADD CONSTRAINT `res_projet` FOREIGN KEY (`res_projet`) REFERENCES `projets` (`pro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
