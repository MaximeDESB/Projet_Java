-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 24 Avril 2017 à 23:01
-- Version du serveur :  5.7.17-log
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gestionstage`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSecurite` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Administateur_Securite1_idx` (`idSecurite`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `idSecurite`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rue` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Contenu de la table `adresse`
--

INSERT INTO `adresse` (`id`, `rue`, `ville`) VALUES
(1, '13 rue du Renard', 'Paris'),
(2, '5 rue Perrault', 'Paris'),
(3, '29 rue des Saint-Peres', 'Paris'),
(4, '7 rue Maitre Albert', 'Paris'),
(5, '42 rue de Sevres', 'Paris'),
(6, '58 Avenue Bosquet', 'Paris'),
(7, '1 rue de la Tour des dames', 'Paris'),
(8, '27 Passage Thiere', 'Paris'),
(9, '58 rue de Ponthieu', 'Paris'),
(10, '2 rue Duroc', 'Paris'),
(11, '19 rue de l''Ermitage', 'Paris'),
(12, '124 rue du Theatre', 'Paris'),
(13, '5 rue Tronchet', 'Paris'),
(14, '10 rue Perignon', 'Paris'),
(15, '15 rue Linne', 'Paris');

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

CREATE TABLE IF NOT EXISTS `domaine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `domaine`
--

INSERT INTO `domaine` (`id`, `nom`) VALUES
(1, 'Reseau'),
(2, 'Conception'),
(3, 'Logistique'),
(4, 'Marketing'),
(5, 'Developpement'),
(6, 'Web'),
(7, 'Droit');

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE IF NOT EXISTS `entreprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `idAdresse` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `idSecteur` int(11) NOT NULL,
  `idSecurite` int(11) NOT NULL,
  `logo` varchar(50) NOT NULL DEFAULT 'images\\\\Default.png',
  PRIMARY KEY (`id`),
  KEY `fk_Entreprise_Adresse_idx` (`idAdresse`),
  KEY `fk_Entreprise_Secteur1_idx` (`idSecteur`),
  KEY `fk_Entreprise_Securite1_idx` (`idSecurite`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `entreprise`
--

INSERT INTO `entreprise` (`id`, `nom`, `idAdresse`, `email`, `tel`, `idSecteur`, `idSecurite`, `logo`) VALUES
(1, 'Ravas SARL', 2, 'Ravas@gmail.com', '01 69 45 23 79', 1, 7, 'images\\\\Ravas.png'),
(2, 'Alltedia ESR', 5, 'Alltedia@gmail.com', '01 69 56 52 02', 1, 9, 'images\\\\Alltedia.jpg'),
(3, 'Enertopia', 4, 'Enertopia@gmail.com', '06 87 12 23 25', 2, 10, 'images\\\\Enertopia.png'),
(4, 'IconeGroupe', 1, 'Icone@gmail.com', '01 45 69 87 45', 3, 11, 'images\\\\Iconegroup.jpg'),
(5, 'Google', 9, 'google@gmail.com', '07 89 56 32 25', 1, 12, 'images\\\\Google.png'),
(6, 'SAT', 10, 'SAT@gmail.com', '06 73 69 51 28', 1, 13, 'images\\\\Sat.png');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `idAdresse` int(11) NOT NULL,
  `idSecurite` int(11) NOT NULL,
  `nouveauStage` tinyint(1) NOT NULL DEFAULT '0',
  `pathCv` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Etudiant_Adresse1_idx` (`idAdresse`),
  KEY `fk_Etudiant_Securite1_idx` (`idSecurite`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `email`, `idAdresse`, `idSecurite`, `nouveauStage`, `pathCv`) VALUES
(1, 'ETUDIANT', 'etudiant', 'etudiant@gmail.fr', 7, 1, 0, 'cv_etudiant//cv__de_ETUDIANT.pdf'),
(2, 'Desbois', 'Maxime', 'max@gmail.com', 6, 4, 0, NULL),
(3, 'Thoraval ', 'Adlan', 'adlan@gmail.com', 10, 5, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `offre`
--

CREATE TABLE IF NOT EXISTS `offre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDomaine` int(11) NOT NULL,
  `nomOffre` varchar(45) DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `description` varchar(3000) DEFAULT NULL,
  `idEntreprise` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Offre_Domaine1_idx` (`idDomaine`),
  KEY `fk_Offre_Entreprise2_idx` (`idEntreprise`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `offre`
--

INSERT INTO `offre` (`id`, `idDomaine`, `nomOffre`, `dateDebut`, `duree`, `description`, `idEntreprise`) VALUES
(1, 3, 'Stage Développer JavaScript', '2017-02-23', 30, 'ActuData http://www.actudata.fr est une start-up spécialisée dans l’édition de solutions Big Data pour l’assurance. Nos clients sont des acteurs majeurs de l’assurance : compagnies d’assurance, mutuelles, sociétés de courtage… \r\nLa structure développe des technologies en \r\ninterne et des algorithmes de machine learning pour répondre à la \r\ndigitalisation de l’assurance. L’outil de veille tarifaire aSpider lancé par ActuData est le premier sur le marché permettant aux assureurs d’avoir les données des concurrents pour une analyse directe en temps\r\n réel. \r\nAujourd’hui composée de six collaborateurs, la start-up a reçu le label FinTech du pôle de compétitivité mondial Finance Innovation et continue de se développer dans un environnement de\r\n travail dynamique impliquant des technologies à la pointe des évolutions. \r\nNous recherchons des stagiaires pour rejoindre notre équipe R&D.\r\nEn tant que Développeur Fullstack, vous serez amené à travailler sur \r\nnotre moteur de recherche tarifaire dédié au marché de l’assurance. \r\nMISSIONS\r\nDéveloppement et maintenance des scripts de collecte de données\r\nAnalyse des besoins\r\nModélisation\r\nArchitecture\r\nTechno : Node.js / AJAX / ElasticSearch, MongoDB, JQuery,', 1),
(2, 2, 'Stage StartUp', '2017-02-10', 45, 'Communication, Culture (Multimedia, Internet) - Informatique, télécom \r\n(Bases de données, Développement, Génie logiciel, Informatique de gestion, Intelligence artificielle, \r\nMaintenance informatique, Télécoms, Web, Réseaux, )', 4),
(3, 3, 'HotLiner Reseaux Telecom', '2017-04-06', 60, 'Répondre aux demandes techniques \r\nRésoudre les problèmes selon une procédure', 6),
(4, 4, 'Data Scientist', '2017-05-12', 7, 'La Direction des Services Partagés (DSP) est l''opérateur des fonctions supports et des activités de services\r\n des entités du Groupe EDF, qui regroupe des expertises mutualisées et des centres de production de services tertiaires.\r\n\r\nLa DSPIT-DMA (Direction des Services Partagés Informatique et Télécom -\r\n Développement et Maintenance des Applications) de la Direction des Services Partagés (DSP) assure pour le groupe EDF les activités de \r\nconseil et de conception des applications informatiques, des Télécoms ainsi que leur maintien en conditions opérationnelles. Elle \r\nregroupe 500 salariés.\r\n\r\n\r\nAu sein de la DSP IT, le Centre de Compétences SPENCER (Sécurisation Projet Entreprise Numérique Conseil\r\n Expertise Réalisation) a en charge la promotion des nouvelles \r\ntechnologies au sein d''EDF, ainsi que la mise en place de l''expertise associée. Afin de mener à bien ces missions, il a la responsabilité d''un\r\n certain nombre de projets innovants mettant en oeuvre des technologies de pointe (bigdata, data science, data visualisation,...). Dans le cadre de\r\n la transformation numérique de l''entreprise, SPENCER a en charge le développement de nouvelles solutions par les méthodes et techniques de machine learning . En fonction du \r\nbesoin métier il s''agit de proposer une solution adaptée et industrialisable. Le stagiaire sera chargé de mettre en place des algorithmes qui répondent au besoin\r\n des clients.\r\n\r\nLe stage sera orienté Data Science, ce qui nécessite une bonne\r\n connaissance préalable - tout au moins en théorie - des concepts du \r\nbigdata et du machine learning. Le stagiaire sera intégré dans les équipes du Centre de Compétences qui assureront le support nécessaire pour\r\n le guider dans son travail. Il sera encadré par un maître de stage, \r\nresponsable du bon déroulement de celui-ci et de l''atteinte des objectifs. Il pourra également s''appuyer sur un référent technique.\r\n', 5),
(5, 5, 'Chef de Projet informatique', '2017-08-13', 50, 'Nous sommes une Start up qui développe ses propre projet a fort\r\n potentiel. C’est un jeu pour smartphone (Android et iOS) similaire à Pokémon go (Cartes avec \r\nvisualisation et actions des utilisateurs en live) avec un niveau\r\n de complexité supplémentaire. \r\n\r\nVous serez le lien avec une équipe \r\ninternationale de 3 développeurs et 1 designer. Vous devrez les encadré, \r\nsuivre leurs production et compléter les besoins dans les projets. Nous \r\nsouhaitons nous transformer en studio de développement applicatif. \r\n\r\n\r\nCompétences nécessaires :\r\n•	Connaissance dans le domaine des jeux vidéo.\r\n•	Connaissance applications iOS/Android/Unity 3D.\r\n•	Connaissance REST ou Web Services.\r\n•	Connaissance et expérience des différentes solutions de cloud services (IaaS, PaaS, SaaS)\r\n•	Connaissance de programmation en Adobe Coldfusion \r\n•	Connaissance de C#/PHP multi-thread, ….\r\n•	Connaisances des outils de gestion de projet et mise en place de protocole.', 2),
(6, 6, 'Stagiaire Outils d''analyse de Fichier', '2017-09-20', 100, 'Monext, ce sont 500 personnes qui oeuvrent chaque jour pour proposer\r\n aux banques, commerçants, e-commerçants... le meilleur du paiement au travers de solutions \r\ninnovantes, simples et séduisantes pour les consommateurs !\r\n\r\n\r\nEmettre des cartes, proposer du paiement sur tous les canaux (web, \r\nmobile, magasin...), distribuer des offres de crédit, améliorer la \r\nrelation client ou encore sécuriser les données sensibles font partie de\r\n la palette de prestations proposée par Monext.\r\n\r\nL''innovation nous anime au quotidien. Plus qu''un mot, c''est un état \r\nd''esprit que nous mettons en oeuvre au service de nos clients pour qu''ils\r\n puissent proposer le meilleur du \r\npaiement d''aujourd''hui et de demain !\r\n', 6),
(7, 6, 'Stage Développement Web', '2017-07-02', 200, 'Orange Business Services, entité d''Orange dédiée aux services de \r\ncommunication pour les entreprises dans le monde (B2B), est l''un des \r\nleaders mondiaux en matière d''intégration de solutions de \r\ncommunication pour les sociétés multinationales.\r\nAu sein d''Orange Business Services, Orange Applications for Business est l''entité spécialisée dans l''intégration de systèmes et la fourniture de services applicatifs sur mesure ou en mode SaaS. Elle se\r\n positionne comme le partenaire IT et télécoms de la transformation \r\ndigitale des entreprises, au service de leur performance métier. Elle a \r\nprincipalement 3 domaines d''expertises :\r\n· le machine to machine et les objets communicants\r\n· le big data et l''analytics\r\n· l''expérience client\r\n\r\nL''objectif du stage est d''étudier / valider le comportement et l''usage \r\nd''Angular 4 comme portail / CMS d''administration pour des apps mobiles.\r\n\r\nLe stagiaire sera encadré par un ingénieur concepteur confirmé et utilisera une méthode Agile / Scrum avec des\r\npériodes de 2 semaines. Il présentera\r\n régulièrement ses études et POC réalisations lors de démonstrations\r\n\r\nRémunération de stage: De 600.0 à 700.0 EUR par mois', 3);

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE IF NOT EXISTS `secteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `secteur`
--

INSERT INTO `secteur` (`id`, `nom`) VALUES
(1, 'Informatique'),
(2, 'Commerce'),
(3, 'Banque'),
(4, 'Aeronautique');

-- --------------------------------------------------------

--
-- Structure de la table `securite`
--

CREATE TABLE IF NOT EXISTS `securite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `mdp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `securite`
--

INSERT INTO `securite` (`id`, `login`, `mdp`) VALUES
(1, 'etudiant', '63a9f0ea7bb98050796b649e85481845'),
(2, 'admin', '63a9f0ea7bb98050796b649e85481845'),
(3, 'entreprise', '63a9f0ea7bb98050796b649e85481845'),
(4, 'Maxime', '2ffe4e77325d9a7152f7086ea7aa5114'),
(5, 'Adlan', 'aeb574d75a62588ca3f86b7e5cd481c'),
(7, 'Ravas SARL', '427a803782fbe50f42d2c335f95a59ce'),
(9, 'Alltedia ESR', 'aa60322dc9f1d5d72c53ce3d7eb24ca2'),
(10, 'Enertopia', 'de361ca739ca8810d0ca1e79c260ea85'),
(11, 'IconeGroupe', 'baec6461b0d69dde1b861aefbe375d8a'),
(12, 'Google', 'feb2c2847da5e274f3d530d5ab438af8'),
(13, 'SAT', '53e8254b3222a33f42b5a6b3d156056c');

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

CREATE TABLE IF NOT EXISTS `stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEtudiant` int(11) NOT NULL,
  `idOffre` int(11) NOT NULL,
  `statut` varchar(45) DEFAULT NULL,
  `motivation` text,
  PRIMARY KEY (`id`),
  KEY `fk_Stage_Etudiant1_idx` (`idEtudiant`),
  KEY `fk_Stage_Offre1_idx` (`idOffre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Contenu de la table `stage`
--

INSERT INTO `stage` (`id`, `idEtudiant`, `idOffre`, `statut`, `motivation`) VALUES
(21, 2, 1, 'En attente', 'Je suis très motivé !'),
(22, 2, 3, 'En attente', 'Je suis très motivé'),
(23, 1, 1, 'En attente', 'Je veux faire ce stage'),
(24, 1, 2, 'En attente', 'Prenez moi !');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `fk_Administateur_Securite1` FOREIGN KEY (`idSecurite`) REFERENCES `securite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD CONSTRAINT `fk_Entreprise_Adresse` FOREIGN KEY (`idAdresse`) REFERENCES `adresse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Entreprise_Secteur1` FOREIGN KEY (`idSecteur`) REFERENCES `secteur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Entreprise_Securite1` FOREIGN KEY (`idSecurite`) REFERENCES `securite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `fk_Etudiant_Adresse1` FOREIGN KEY (`idAdresse`) REFERENCES `adresse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Etudiant_Securite1` FOREIGN KEY (`idSecurite`) REFERENCES `securite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `fk_Offre_Domaine1` FOREIGN KEY (`idDomaine`) REFERENCES `domaine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Offre_Entreprise2` FOREIGN KEY (`idEntreprise`) REFERENCES `entreprise` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `stage`
--
ALTER TABLE `stage`
  ADD CONSTRAINT `fk_Stage_Etudiant1` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Stage_Offre1` FOREIGN KEY (`idOffre`) REFERENCES `offre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
