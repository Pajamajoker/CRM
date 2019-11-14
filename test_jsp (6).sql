-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 11, 2019 at 12:40 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_jsp`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `insLoanDetails`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insLoanDetails` (IN `cusid` INT, IN `empid` INT, IN `typeid` INT, IN `principal` DOUBLE, IN `duration` DOUBLE, IN `int_rat` FLOAT)  begin
declare mnth_inst double;
set mnth_inst=(principal+((principal*int_rat)/100))/(duration*12);
insert into loans(CustomerID,TypeID,EmpID,Duration,Principal,Monthly_inst,Commencement) values (cusid,typeid,empid,duration,principal,mnth_inst,curdate());
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_products`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `all_products`;
CREATE TABLE IF NOT EXISTS `all_products` (
`Type` varchar(20)
,`InterestRate` float
,`Description` varchar(512)
);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` varchar(60) NOT NULL,
  `PhoneNum` varchar(12) NOT NULL,
  `pass` varchar(20) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `Address`, `PhoneNum`, `pass`) VALUES
(56, 'Seth', 'Roy', 'tristique.neque@fermentumconvallisligula.com', 'Atlanta', '8630944724', '1234'),
(57, 'Destiny', 'Chambers', 'Phasellus.in.felis@ornarelibero.net', 'Buxton', '6855272666', '1234');

--
-- Triggers `customer`
--
DROP TRIGGER IF EXISTS `on_customer_delete`;
DELIMITER $$
CREATE TRIGGER `on_customer_delete` AFTER DELETE ON `customer` FOR EACH ROW begin
delete from loans where loans.CustomerID = OLD.CustomerID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `duepayments`
--

DROP TABLE IF EXISTS `duepayments`;
CREATE TABLE IF NOT EXISTS `duepayments` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `LoaneeID` int(11) NOT NULL,
  `DueDate` varchar(64) NOT NULL,
  `IsPaid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PaymentID`)
) ENGINE=MyISAM AUTO_INCREMENT=183 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `duepayments`
--

INSERT INTO `duepayments` (`PaymentID`, `LoaneeID`, `DueDate`, `IsPaid`) VALUES
(182, 17, '2019-10-11', 0),
(181, 16, '2019-10-11', 0),
(180, 14, '2019-10-11', 0),
(179, 13, '2019-10-11', 0),
(178, 17, '2019-10-11', 0),
(177, 16, '2019-10-11', 0),
(176, 14, '2019-10-11', 0),
(175, 13, '2019-10-11', 0),
(174, 16, '2019-10-11', 0),
(173, 14, '2019-10-11', 0),
(172, 13, '2019-10-11', 1),
(171, 16, '2019-10-11', 0),
(170, 14, '2019-10-11', 0),
(169, 13, '2019-10-11', 0),
(168, 16, '2019-10-11', 0),
(167, 14, '2019-10-11', 0),
(166, 13, '2019-10-11', 0),
(165, 16, '2019-10-11', 0),
(164, 14, '2019-10-11', 0),
(163, 13, '2019-10-11', 0),
(162, 16, '2019-10-11', 1),
(161, 14, '2019-10-11', 0),
(160, 13, '2019-10-11', 0),
(159, 16, '2019-10-11', 1),
(158, 14, '2019-10-11', 0),
(157, 13, '2019-10-11', 0),
(156, 16, '2019-10-11', 1),
(155, 14, '2019-10-11', 0),
(154, 13, '2019-10-11', 0),
(153, 16, '2019-10-11', 1),
(152, 14, '2019-10-11', 0),
(151, 13, '2019-10-11', 0),
(150, 15, '2019-10-11', 0),
(149, 14, '2019-10-11', 0),
(148, 13, '2019-10-11', 1),
(147, 15, '2019-10-11', 0),
(146, 14, '2019-10-11', 0),
(145, 13, '2019-10-11', 0),
(144, 15, '2019-10-11', 0),
(143, 14, '2019-10-11', 0),
(142, 13, '2019-10-11', 0),
(141, 15, '2019-10-11', 0),
(140, 14, '2019-10-11', 0),
(139, 13, '2019-10-11', 0),
(138, 15, '2019-10-11', 0),
(137, 14, '2019-10-11', 0),
(136, 13, '2019-10-11', 0),
(135, 15, '2019-10-11', 0),
(134, 14, '2019-10-11', 0),
(133, 13, '2019-10-11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `EmpID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `PhoneNum` varchar(12) NOT NULL,
  PRIMARY KEY (`EmpID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmpID`, `FirstName`, `LastName`, `Email`, `Address`, `PhoneNum`) VALUES
(1, 'Pratham', 'Josh', 'jp@gmail.com', 'Nilgiri chowk,Pune', '8812345678'),
(2, 'Shib', 'Likh', 'sl@gmail.com', 'Kothrud,Pune', '9912345567'),
(3, 'Ishi', 'Jain', 'ij@gmail.com', 'Gandhi Nagar,Udaipur', '7812346657');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
CREATE TABLE IF NOT EXISTS `leads` (
  `LeadID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `PhoneNum` varchar(12) NOT NULL,
  `Status` int(11) NOT NULL,
  `Nature` int(11) NOT NULL,
  `Requirement` varchar(255) DEFAULT NULL,
  `Next_action` varchar(30) DEFAULT NULL,
  `Next_action_date` date NOT NULL,
  `TypeID` int(11) DEFAULT NULL,
  `EmpID` int(11) NOT NULL,
  `CreditCat` int(11) NOT NULL,
  PRIMARY KEY (`LeadID`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`LeadID`, `FirstName`, `LastName`, `Email`, `Address`, `PhoneNum`, `Status`, `Nature`, `Requirement`, `Next_action`, `Next_action_date`, `TypeID`, `EmpID`, `CreditCat`) VALUES
(153, 'Hop', 'Copeland', 'enim.Sed@sagittisplacerat.co.uk', 'Limena', '7285721362', 3, 1, 'ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce', 'ac, fermentum vel,', '2019-10-16', 2, 3, 3),
(152, 'Jason', 'Holcomb', 'amet.orci@eudolor.co.uk', 'Sint-Katherina-Lombeek', '1772100242', 3, 3, 'eu neque pellentesque massa', 'a sollicitudin orci', '2019-11-21', 2, 1, 2),
(151, 'Bert', 'Snider', 'semper.tellus.id@feugiatLoremipsum.co.uk', 'Edmundston', '8308350099', 3, 2, 'sit amet diam eu dolor egestas rhoncus. Proin', 'amet nulla. Donec', '2019-11-02', 3, 2, 1),
(150, 'Odysseus', 'Park', 'malesuada.Integer.id@sodalespurus.com', 'Massa Martana', '6990070181', 3, 2, 'conubia nostra, per inceptos hymenaeos. Mauris ut quam', 'augue ut lacus.', '2019-10-17', 2, 3, 2),
(149, 'Lois', 'Gibson', 'adipiscing.non@scelerisquemollisPhasellus.net', 'Buckingham', '1011083970', 3, 3, 'nibh sit amet orci. Ut sagittis', 'posuere cubilia Curae;', '2019-11-03', 3, 3, 3),
(148, 'Virginia', 'Munoz', 'In.nec@non.co.uk', 'Helena', '7512774827', 2, 3, 'mollis', 'fermentum risus, at', '2019-12-05', 3, 1, 1),
(147, 'Kadeem', 'Oliver', 'sit.amet@semperegestasurna.edu', 'Laramie', '7781532443', 2, 2, 'arcu. Nunc mauris. Morbi non sapien', 'elit, pharetra ut,', '2019-10-22', 1, 2, 3),
(146, 'Aquila', 'Bryan', 'volutpat.Nulla.facilisis@elita.ca', 'Lac-Serent', '0712387273', 2, 3, 'in consequat enim diam vel arcu. Curabitur ut odio vel', 'penatibus et magnis', '2019-10-12', 3, 2, 2),
(145, 'Vanna', 'Kennedy', 'eu.odio@sed.co.uk', 'Mosciano Sant\'Angelo', '6859466353', 2, 1, 'molestie sodales. Mauris blandit enim consequat purus. Maecenas', 'est tempor bibendum.', '2019-10-12', 1, 2, 1),
(144, 'Alice', 'Herman', 'pellentesque.Sed.dictum@eu.com', 'Yellowhead County', '2229858894', 2, 3, 'porta elit, a feugiat', 'arcu. Vestibulum ante', '2019-12-05', 2, 1, 3),
(143, 'Karly', 'Barrett', 'odio.Aliquam@tempusnon.co.uk', 'Erembodegem', '7600116648', 3, 3, 'Mauris nulla.', 'elit pede, malesuada', '2019-10-22', 1, 3, 2),
(142, 'Zachery', 'Crawford', 'Vestibulum.ante.ipsum@at.edu', 'Olinda', '9230268458', 3, 2, 'risus.', 'auctor vitae, aliquet', '2019-11-15', 2, 2, 1),
(141, 'India', 'Wise', 'tempus.lorem.fringilla@egestashendrerit.com', 'La Spezia', '0511744284', 2, 2, 'amet ultricies sem magna nec quam.', 'lacus. Cras interdum.', '2019-11-01', 2, 1, 2),
(140, 'Quail', 'Moran', 'Donec.est@liberoProinsed.com', 'Dubbo', '3027260510', 3, 2, 'justo faucibus lectus, a sollicitudin', 'sem ut dolor', '2019-10-10', 1, 1, 2),
(139, 'Zephania', 'Sargent', 'Morbi.non@vellectus.co.uk', 'Sundrie', '0369235045', 2, 1, 'euismod ac, fermentum vel, mauris. Integer sem elit,', 'enim, gravida sit', '2019-10-23', 3, 2, 2),
(138, 'Allegra', 'Pratt', 'sit.amet@nonbibendum.co.uk', 'Bosa', '0727045496', 3, 3, 'In scelerisque scelerisque dui. Suspendisse ac metus vitae', 'et malesuada fames', '2019-12-06', 3, 3, 1),
(137, 'Charles', 'Alford', 'enim@nonummy.com', 'Meeuwen-Gruitrode', '8186842563', 2, 2, 'eros turpis non enim. Mauris quis', 'dolor sit amet,', '2019-10-29', 3, 2, 2),
(136, 'Kerry', 'Diaz', 'mauris@Nullamenim.edu', 'Retie', '9527797497', 2, 3, 'odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque', 'eu nibh vulputate', '2019-10-21', 2, 2, 3),
(135, 'Leigh', 'Hall', 'ac@ullamcorperDuiscursus.org', 'Savona', '9553735691', 2, 2, 'mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor', 'bibendum fermentum metus.', '2019-10-16', 1, 3, 2),
(134, 'Brandon', 'Gilbert', 'diam.lorem@Cumsociis.ca', 'Olivola', '1051080013', 3, 1, 'Integer vulputate,', 'purus sapien, gravida', '2019-11-26', 2, 2, 3),
(133, 'Dora', 'Valenzuela', 'litora.torquent@ametfaucibusut.org', 'Aurora', '8038562792', 2, 1, 'porta elit, a', 'semper erat, in', '2019-11-06', 1, 2, 3),
(132, 'Xander', 'Christian', 'orci.lacus.vestibulum@augueeutellus.com', 'Nemi', '1305333461', 3, 1, 'nibh enim, gravida sit amet, dapibus', 'metus. Aliquam erat', '2019-12-04', 3, 2, 3),
(131, 'Fritz', 'Bridges', 'ultricies.ligula@odioauctor.com', 'College', '1710038654', 3, 1, 'sit', 'et malesuada fames', '2019-11-05', 1, 2, 2),
(130, 'Randall', 'Keith', 'ornare@ipsum.edu', 'Lauterach', '2486041608', 2, 2, 'magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum', 'suscipit, est ac', '2019-10-27', 3, 1, 2),
(129, 'Leroy', 'Hester', 'ante@variuset.ca', 'Bellegem', '0167822292', 3, 1, 'neque sed dictum eleifend,', 'arcu. Aliquam ultrices', '2019-12-09', 2, 2, 2),
(128, 'Hayes', 'Pate', 'Aenean.eget.magna@MaurismagnaDuis.com', 'Sabadell', '1843732280', 3, 1, 'mauris sit amet', 'dolor. Donec fringilla.', '2019-10-15', 3, 3, 3),
(127, 'MacKensie', 'Bullock', 'sollicitudin@dolor.co.uk', 'San Antonio', '4566802625', 2, 2, 'orci tincidunt adipiscing.', 'Etiam laoreet, libero', '2019-10-21', 1, 1, 2),
(126, 'Colleen', 'Greene', 'convallis.convallis.dolor@velconvallis.co.uk', 'Salon-de-Provence', '8470369352', 3, 2, 'vel turpis. Aliquam adipiscing lobortis', 'laoreet, libero et', '2019-11-08', 2, 3, 3),
(125, 'Byron', 'Summers', 'Suspendisse.sagittis@ullamcorpervelit.net', 'Harrisburg', '2965146186', 3, 1, 'Lorem ipsum dolor sit', 'eu odio tristique', '2019-11-27', 3, 3, 1),
(124, 'Eric', 'Dillon', 'vitae.sodales.at@adipiscinglobortis.ca', 'Oudenaken', '5522851825', 2, 1, 'a neque.', 'aptent taciti sociosqu', '2019-11-23', 3, 3, 2),
(123, 'Keefe', 'Lott', 'sem.eget.massa@Phaselluselitpede.edu', 'Francavilla Fontana', '9873421988', 2, 1, 'sed pede nec', 'molestie in, tempus', '2019-10-27', 3, 3, 1),
(122, 'Igor', 'Chandler', 'interdum@felisadipiscing.ca', 'Guaitecas', '9747230295', 3, 1, 'Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque', 'mauris. Integer sem', '2019-10-30', 3, 2, 2),
(121, 'Ann', 'Becker', 'Suspendisse@amet.ca', 'Shepparton', '7230133318', 2, 1, 'in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum', 'ultrices, mauris ipsum', '2019-10-19', 3, 1, 3),
(120, 'Kato', 'Peterson', 'nulla.vulputate@pedeCum.com', 'Sperlinga', '2715443946', 1, 3, 'ut ipsum ac mi eleifend egestas. Sed pharetra,', 'Quisque tincidunt pede', '2019-11-30', 2, 1, 3),
(119, 'Theodore', 'Ratliff', 'Integer.tincidunt@Quisquelibero.edu', 'Chesterfield', '1521080680', 2, 3, 'amet, consectetuer adipiscing elit. Aliquam auctor,', 'nisi. Aenean eget', '2019-10-19', 3, 2, 1),
(117, 'Mona', 'Hahn', 'nec.ante.blandit@Seddiamlorem.org', 'Bellegem', '4574473893', 3, 2, 'id magna et ipsum', 'interdum ligula eu', '2019-12-10', 2, 1, 3),
(118, 'Alyssa', 'Bray', 'et.malesuada@euenim.edu', 'Whittlesey', '9403620321', 3, 1, 'diam luctus lobortis. Class aptent taciti sociosqu', 'dolor, tempus non,', '2019-10-17', 2, 1, 3),
(116, 'Cora', 'Cruz', 'nisl.arcu.iaculis@doloregestas.net', 'Piancastagnaio', '7977822230', 2, 1, 'nisi. Aenean eget metus. In nec orci.', 'erat, in consectetuer', '2019-10-25', 2, 2, 3),
(115, 'Riley', 'Fuentes', 'Aliquam.tincidunt@dolorQuisquetincidunt.co.uk', 'Matagami', '9125877489', 3, 1, 'libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet', 'euismod mauris eu', '2019-10-21', 3, 2, 3),
(114, 'Jennifer', 'Garner', 'nec.quam@Proin.org', 'Knittelfeld', '9629290180', 3, 2, 'nulla. Integer vulputate, risus a', 'arcu. Sed et', '2019-10-25', 2, 2, 2),
(113, 'Seth', 'Roy', 'tristique.neque@fermentumconvallisligula.com', 'Atlanta', '8630944724', 1, 2, 'vulputate velit eu sem. Pellentesque', 'nulla. Donec non', '2019-11-21', 1, 1, 2),
(112, 'Echo', 'Clay', 'at.sem@sodales.com', 'Oss', '6640560264', 3, 3, 'purus mauris a', 'Fusce aliquam, enim', '2019-10-28', 3, 3, 2),
(111, 'Emerald', 'Luna', 'dui@massaInteger.edu', 'Port Coquitlam', '7392445273', 3, 1, 'felis ullamcorper', 'fringilla cursus purus.', '2019-12-08', 2, 2, 1),
(110, 'Mona', 'Travis', 'mauris@sapiengravida.org', 'Sala Baganza', '9454972086', 3, 1, 'eros turpis non', 'vitae odio sagittis', '2019-10-15', 3, 3, 1),
(109, 'Merritt', 'Wall', 'vehicula@risus.org', 'Montpelier', '0942631901', 3, 2, 'id ante dictum cursus. Nunc mauris', 'quis urna. Nunc', '2019-12-06', 1, 1, 1),
(108, 'Ivory', 'Beasley', 'Praesent.eu.dui@scelerisquescelerisque.edu', 'Stirling', '8263815792', 3, 1, 'sodales elit erat vitae', 'enim non nisi.', '2019-10-26', 3, 1, 2),
(107, 'Brooke', 'Frye', 'sociis.natoque.penatibus@neque.net', 'Boo', '9111703295', 2, 3, 'pretium et, rutrum non, hendrerit id, ante. Nunc', 'cubilia Curae; Phasellus', '2019-10-12', 3, 3, 3),
(105, 'Kevyn', 'Medina', 'elementum@nullavulputatedui.ca', 'Dhuy', '7808237778', 3, 2, 'Curae;', 'id, mollis nec,', '2019-10-30', 1, 3, 2),
(106, 'Ryan', 'Parker', 'ultrices.iaculis.odio@cursuspurus.edu', 'Namur', '8790240760', 3, 1, 'lorem fringilla', 'sem mollis dui,', '2019-12-04', 1, 1, 2),
(104, 'Samson', 'Hester', 'Nunc.commodo.auctor@antebibendum.ca', 'Eckville', '2505609553', 2, 3, 'semper, dui lectus rutrum', 'Aliquam erat volutpat.', '2019-10-21', 2, 2, 2),
(102, 'Dawn', 'Padilla', 'Donec.dignissim.magna@cubilia.ca', 'Basirhat', '0433460071', 3, 3, 'erat volutpat.', 'eros nec tellus.', '2019-11-16', 1, 1, 1),
(103, 'Ebony', 'Montoya', 'libero@est.net', 'Bamberg', '5359107092', 3, 2, 'mauris erat eget ipsum. Suspendisse sagittis. Nullam', 'placerat, augue. Sed', '2019-11-07', 1, 2, 2),
(101, 'Fuller', 'Tyson', 'non.hendrerit.id@semeget.org', 'Annapolis', '6352374075', 2, 2, 'velit eget', 'velit dui, semper', '2019-10-24', 3, 3, 2),
(99, 'Solomon', 'Solis', 'Donec@elit.org', 'Abbotsford', '9657896825', 2, 1, 'placerat.', 'bibendum sed, est.', '2019-11-25', 3, 2, 1),
(100, 'Martha', 'Pratt', 'vel.venenatis.vel@risus.co.uk', 'Uberaba', '7538239650', 2, 2, 'nec, euismod in, dolor. Fusce feugiat. Lorem ipsum', 'arcu. Curabitur ut', '2019-12-02', 3, 3, 1),
(98, 'Robin', 'Moon', 'Quisque.imperdiet@Aenean.ca', 'Makurdi', '7634526311', 2, 3, 'massa. Mauris vestibulum,', 'et, eros. Proin', '2019-11-24', 1, 3, 3),
(97, 'Jamal', 'Stanton', 'ut.mi@estNuncullamcorper.edu', 'Asbestos', '4144697488', 3, 3, 'Etiam bibendum fermentum metus. Aenean', 'gravida nunc sed', '2019-10-28', 1, 3, 3),
(96, 'Destiny', 'Chambers', 'Phasellus.in.felis@ornarelibero.net', 'Buxton', '6855272666', 1, 2, 'ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam', 'nibh sit amet', '2019-11-05', 1, 1, 3),
(95, 'Larissa', 'Hewitt', 'ac@orcitincidunt.org', 'Okigwe', '0936369310', 3, 3, 'diam vel arcu. Curabitur ut odio vel est tempor bibendum.', 'ipsum dolor sit', '2019-10-15', 3, 2, 2),
(94, 'Raphael', 'Vaughn', 'urna.suscipit.nonummy@perconubianostra.ca', 'Tarvisio', '7587328272', 2, 3, 'quis diam. Pellentesque', 'nunc. In at', '2019-11-03', 1, 2, 3),
(154, 'Melanie', 'Walter', 'orci@Fuscemilorem.net', 'Sant\'Agata Bolognese', '4650256848', 3, 2, 'nisl arcu iaculis enim, sit', 'elementum, lorem ut', '2019-11-10', 2, 3, 1),
(155, 'Alexis', 'Casey', 'justo@risusvariusorci.org', 'Gullegem', '7195601560', 3, 1, 'non enim commodo hendrerit. Donec', 'egestas rhoncus. Proin', '2019-12-04', 1, 2, 1),
(156, 'Lucy', 'Elliott', 'pretium@nibhDonecest.ca', 'Beuzet', '6665603293', 3, 2, 'tincidunt vehicula risus. Nulla', 'hendrerit a, arcu.', '2019-11-30', 1, 2, 3),
(157, 'Baxter', 'Guy', 'dui.Suspendisse@arcu.net', 'Heppenheim', '0421873828', 2, 1, 'fermentum arcu.', 'Maecenas libero est,', '2019-10-30', 3, 1, 2),
(158, 'Victoria', 'Ingram', 'inceptos.hymenaeos@Fusce.net', 'Oamaru', '9431233501', 2, 2, 'fermentum vel,', 'auctor, velit eget', '2019-10-24', 3, 1, 3),
(159, 'Joel', 'Prince', 'purus.ac.tellus@luctusut.ca', 'Parrano', '6118122171', 2, 3, 'Ut semper pretium neque. Morbi quis urna. Nunc quis', 'sagittis. Nullam vitae', '2019-11-01', 1, 1, 3),
(160, 'Xerxes', 'Odonnell', 'mauris.blandit@diam.org', 'Cedar Rapids', '8782156855', 3, 3, 'in consequat enim diam vel arcu. Curabitur ut', 'lorem, luctus ut,', '2019-11-24', 2, 3, 2),
(161, 'Giselle', 'Bridges', 'malesuada.ut.sem@lorem.edu', 'Niel-bij-As', '1777040971', 2, 3, 'sociis natoque', 'nec ante. Maecenas', '2019-10-18', 1, 3, 1),
(162, 'Aiko', 'Stevenson', 'odio.vel@loremfringillaornare.net', 'Moliterno', '1406633014', 2, 1, 'ipsum ac mi', 'nisi sem semper', '2019-10-11', 2, 1, 2),
(163, 'Bianca', 'Dunlap', 'porttitor.scelerisque.neque@acmieleifend.com', 'College', '4457689018', 3, 2, 'blandit at, nisi. Cum sociis natoque', 'at, velit. Pellentesque', '2019-12-09', 2, 3, 2);

--
-- Triggers `leads`
--
DROP TRIGGER IF EXISTS `check_vals_lead`;
DELIMITER $$
CREATE TRIGGER `check_vals_lead` BEFORE INSERT ON `leads` FOR EACH ROW BEGIN

    IF (NEW.TypeID < 0 or NEW.TypeID > 3) THEN
      SIGNAL SQLSTATE '45000' 
      SET MESSAGE_TEXT = "TypeID error";
    END IF;

    IF (NEW.CreditCat< 0 or NEW.CreditCat > 3) THEN
      SIGNAL SQLSTATE '45000' 
      SET MESSAGE_TEXT = "CreditCat error";
    END IF;         

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `loandetails`
--

DROP TABLE IF EXISTS `loandetails`;
CREATE TABLE IF NOT EXISTS `loandetails` (
  `TypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) NOT NULL,
  `InterestRate` float NOT NULL,
  `Description` varchar(512) NOT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loandetails`
--

INSERT INTO `loandetails` (`TypeID`, `Type`, `InterestRate`, `Description`) VALUES
(1, 'HomeLoan', 8.5, 'hello homeloan'),
(2, 'VehicleLoan', 10.5, 'hello vehicleLoan'),
(3, 'EducationLoan', 10.75, 'hello Educational loan');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
CREATE TABLE IF NOT EXISTS `loans` (
  `LoaneeID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `TypeID` int(11) NOT NULL,
  `EmpID` int(11) NOT NULL,
  `Duration` float NOT NULL,
  `Principal` double NOT NULL,
  `Monthly_inst` double NOT NULL,
  `Amt_paid` double DEFAULT '0',
  `Commencement` varchar(20) NOT NULL,
  PRIMARY KEY (`LoaneeID`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`LoaneeID`, `CustomerID`, `TypeID`, `EmpID`, `Duration`, `Principal`, `Monthly_inst`, `Amt_paid`, `Commencement`) VALUES
(13, 56, 1, 1, 10, 1200000, 10850, 21700, '2019-10-10'),
(14, 57, 1, 1, 8, 1500000, 16953.125, 0, '2019-10-10'),
(17, 56, 2, 1, 3, 100000, 3069.4444444444443, 0, '2019-10-11'),
(16, 56, 1, 1, 2, 100000, 4520.833333333333, 18083.333333333332, '2019-10-11');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `pass` varchar(20) DEFAULT NULL,
  `EmpID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`EmpID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`pass`, `EmpID`) VALUES
('1234', 1),
('shibani', 2),
('ishita', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `TaskID` int(11) NOT NULL AUTO_INCREMENT,
  `EmpID` int(11) NOT NULL,
  `Task` varchar(512) NOT NULL,
  `Start_date` varchar(10) NOT NULL,
  `Status` int(11) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `due` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TaskID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`TaskID`, `EmpID`, `Task`, `Start_date`, `Status`, `Name`, `due`) VALUES
(1, 1, 'hello world', '2019-10-12', 2, 'HL1', 0),
(2, 1, 'hello', '2019-10-12', 2, 'H1', 0),
(3, 1, 'hello world', '2019-10-26', 2, 'HL2', 0),
(8, 1, 'hello world', '2019-10-08', 2, 'SomeName', 1),
(9, 1, 'hello world', '2019-10-11', 2, 'SomeName', 1),
(13, 1, 'task latest', '2019-10-11', 2, 'Latest Task', 1),
(12, 1, 'some task here', '2019-10-11', 2, 'somenewtask', 1);

-- --------------------------------------------------------

--
-- Structure for view `all_products`
--
DROP TABLE IF EXISTS `all_products`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_products`  AS  select `loandetails`.`Type` AS `Type`,`loandetails`.`InterestRate` AS `InterestRate`,`loandetails`.`Description` AS `Description` from `loandetails` ;

DELIMITER $$
--
-- Events
--
DROP EVENT `monthly_inst_try`$$
CREATE DEFINER=`root`@`localhost` EVENT `monthly_inst_try` ON SCHEDULE EVERY 1 HOUR STARTS '2019-10-10 16:00:17' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
insert into duepayments(LoaneeID,DueDate)select LoaneeID,curdate() from loans; 
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
