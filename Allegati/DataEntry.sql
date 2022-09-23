SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

USE provadbsia;

CREATE TABLE IF NOT EXISTS `claims` (
`ID` INT NOT NULL PRIMARY KEY,
`CodAnagrafica` VARCHAR(20),
`ImportoPrestazione` FLOAT,
`ImportoLiquidato` FLOAT,
`IDTipoPrestazione` INT,
`Descrizione` VARCHAR(20),
`IdPrestazione` INT,
`DescrizionePrestazione` VARCHAR(20)
);

INSERT INTO claims VALUES
(1,'CA0007',160,80,8,'Odontoiatria',2604,'Otturazione'),
(2,'CA0022',103.19,51.6,1,'Visite specialistiche',2,'Visita Specialistica'),
(3,'CA0022',36,36,4,'Mammografia e ecografia',10800,'Mammografia'),
(4,'CA0022',12.19,12.19,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(5,'CA0023',400,125,8,'Odontoiatria',2619,'Corona'),
(6,'CA0027',39.89,39.89,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(7,'CA0027',100,50,8,'Odontoiatria',2582,'Ablazione Tartaro'),
(8,'CA0042',565,125,8,'Odontoiatria',2588,'Lavorazione Dentaria'),
(9,'CAA001',25.53,25.53,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(10,'CAA001',34.82,34.82,3,'Diagnostica per immagini',10700,'Diagnostica immagini'),
(11,'CAA001',36,36,4,'Mammografia e ecografia',10800,'Mammografia'),
(12,'CAA001',100,50,1,'Visite specialistiche',2,'Visita Specialistica'),
(13,'CAA001',36,36,3,'Diagnostica per immagini',10700,'Diagnostica immagini'),
(14,'CAA001',130,65,1,'Visite specialistiche',2,'Visita Specialistica'),
(15,'CAA001',128.19,64.1,1,'Visite specialistiche',2,'Visita Specialistica'),
(16,'CAA003',36,36,3,'Diagnostica per immagini',10700,'Diagnostica immagini'),
(17,'CAA003',36,36,3,'Diagnostica per immagini',10700,'Diagnostica immagini'),
(18,'CAA003',23.79,23.79,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(19,'CAA003',50,25,1,'Visite specialistiche',2,'Visita Specialistica'),
(20,'CAA003',110,55,1,'Visite specialistiche',2,'Visita Specialistica'),
(21,'CAA003',85,42.5,1,'Visite specialistiche',2,'Visita Specialistica'),
(22,'CAA003',70,35,1,'Visite specialistiche',2,'Visita Specialistica'),
(23,'CAA003',42.81,42.81,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(24,'CAA003',330,165,8,'Odontoiatria',2604,'Otturazione'),
(25,'CAA011',2.35,2.35,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(26,'CAA011',36.15,36.15,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(27,'CAA011',25.45,25.45,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(28,'CAA011',36.15,36.15,4,'Mammografia e ecografia',10800,'Mammografia'),
(29,'CAA013',23.51,23.51,1,'Visite specialistiche',10500,'Visita Specialistica'),
(30,'CAA016',1400,125,8,'Odontoiatria',2610,'Devitalizzazione'),
(31,'CAA016',36,36,4,'Mammografia e ecografia',10800,'Mammografia'),
(32,'CAA016',10.56,10.56,1,'Visite specialistiche',10500,'Visita Specialistica'),
(33,'CAA016',36,36,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(34,'CAA016',36,36,4,'Mammografia e ecografia',10800,'Mammografia'),
(35,'CAA016',23.51,23.51,1,'Visite specialistiche',10500,'Visita Specialistica'),
(36,'CAA018',85,42.5,8,'Odontoiatria',2582,'Ablazione Tartaro'),
(37,'CAA018',85,42.5,1,'Visite specialistiche',2,'Visita Specialistica'),
(38,'CAA028',90,49.5,4,'Mammografia e ecografia',2224,'Prestazione Grastoenterologia'),
(39,'CAA028',17.35,17.35,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(40,'CAA028',100,50,1,'Visite specialistiche',2,'Visita Specialistica'),
(41,'CAA028',58.7,58.7,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(42,'CAA028',80,40,8,'Odontoiatria',2582,'Ablazione Tartaro'),
(43,'CAA033',120,60,1,'Visite specialistiche',2,'Visita Specialistica'),
(44,'CAA033',120,66,4,'Mammografia e ecografia',2223,'Esame gravidanza'),
(45,'CAA033',80,40,1,'Visite specialistiche',2,'Visita Specialistica'),
(46,'CAA033',90,45,1,'Visite specialistiche',2,'Visita Specialistica'),
(47,'CAA033',90,45,1,'Visite specialistiche',2,'Visita Specialistica'),
(48,'CAA035',36.15,36.15,3,'Diagnostica per immagini',10700,'Diagnostica immagini'),
(49,'CAA035',51,25.5,1,'Visite specialistiche',2,'Visita Specialistica'),
(50,'CAA035',150,75,1,'Visite specialistiche',2,'Visita Specialistica'),
(51,'CAA035',30.21,30.21,3,'Diagnostica per immagini',10700,'Diagnostica immagini'),
(52,'CAA035',36.15,36.15,3,'Diagnostica per immagini',10700,'Diagnostica immagini'),
(53,'CAA035',100,50,1,'Visite specialistiche',2,'Visita Specialistica'),
(54,'CAA044',36,36,4,'Mammografia e ecografia',10800,'Mammografia'),
(55,'CAA044',15.09,15.09,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(56,'CAA044',23.51,23.51,1,'Visite specialistiche',10500,'Visita Specialistica'),
(57,'CAA044',36,36,4,'Mammografia e ecografia',10800,'Mammografia'),
(58,'CAA057',130,65,1,'Visite specialistiche',2,'Visita Specialistica'),
(59,'CAA057',300,125,8,'Odontoiatria',2604,'Otturazione'),
(60,'CAA057',9.99,9.99,1,'Visite specialistiche',10500,'Visita Specialistica'),
(61,'CAA057',14.1,14.1,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(62,'CAA059',60.1,60.1,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(63,'CAA059',36.15,36.15,4,'Mammografia e ecografia',10800,'Mammografia'),
(64,'CAA059',18.95,18.95,1,'Visite specialistiche',10500,'Visita Specialistica'),
(65,'CAA059',11.9,11.9,1,'Visite specialistiche',10500,'Visita Specialistica'),
(66,'CAA059',36.15,36.15,3,'Diagnostica per immagini',10700,'Diagnostica immagini'),
(67,'CAA059',70,35,1,'Visite specialistiche',2,'Visita Specialistica'),
(68,'CAA059',70,35,8,'Odontoiatria',2582,'Ablazione Tartaro'),
(69,'CAA062',148.19,74.1,8,'Odontoiatria',2604,'Otturazione'),
(70,'CAA062',120,60,1,'Visite specialistiche',2,'Visita Specialistica'),
(71,'CAA062',36.15,36.15,3,'Diagnostica per immagini',10700,'Diagnostica immagini'),
(72,'CAA062',100,50,1,'Visite specialistiche',2,'Visita Specialistica'),
(73,'CAA070',80,40,8,'Odontoiatria',2582,'Ablazione Tartaro'),
(74,'CAA070',19.16,19.16,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(75,'CAA070',80,40,1,'Visite specialistiche',2,'Visita Specialistica'),
(76,'CAA070',19.16,19.16,2,'Analisi laboratorio',10600,'Analisi Laboratorio'),
(77,'CAA070',98.19,49.1,1,'Visite specialistiche',2,'Visita Specialistica'),
(78,'CAA078',50,25,1,'Visite specialistiche',2,'Visita Specialistica');


CREATE TABLE IF NOT EXISTS `policies` (
`IdAnagrafica` VARCHAR(20) NOT NULL PRIMARY KEY,
`Sesso` VARCHAR(20),
`DataNascita` VARCHAR(20),
`DataInserimento` VARCHAR(20),
`IdGradoParentela` INT,
`DescrizioneGradoParentela` VARCHAR(20),
`DataDecorrenza` VARCHAR(20),
`DataScadenza` VARCHAR(20)
);

INSERT INTO policies VALUES
('CAA001','F','15-lug-54','23-ott-07',1,'Intestatario','01-nov-07','15-lug-19'),
('CAA002','F','23-feb-76','15-nov-07',1,'Intestatario','01-nov-07','23-feb-41'),
('CAA003','F','27-ott-78','12-feb-08',1,'Intestatario','12-feb-08','27-ott-43'),
('CAA004','F','21-gen-53','20-feb-08',2,'Coniuge/Convivente','01-gen-08','26-dic-17'),
('CAA011','F','07-mar-57','19-mar-08',1,'Intestatario','01-lug-08','07-mar-22'),
('CAA013','F','02-nov-59','25-mar-08',1,'Intestatario','01-lug-08','02-nov-24'),
('CAA016','F','07-mar-77','08-apr-08',1,'Intestatario','01-lug-08','07-mar-42'),
('CAA018','F','10-giu-61','09-apr-08',1,'Intestatario','01-lug-08','10-giu-26'),
('CAA028','F','25-dic-74','18-apr-08',1,'Intestatario','01-lug-08','25-dic-39'),
('CAA030','F','01-ott-59','18-apr-08',1,'Intestatario','01-lug-08','01-ott-24'),
('CAA033','F','24-apr-71','21-apr-08',1,'Intestatario','01-lug-08','24-apr-36'),
('CAA035','M','24-ago-76','22-apr-08',1,'Intestatario','01-lug-08','24-ago-41'),
('CAA039','F','04-giu-49','22-apr-08',1,'Intestatario','01-lug-08','04-giu-14'),
('CAA044','F','16-lug-64','23-apr-08',1,'Intestatario','01-lug-08','16-lug-29'),
('CAA057','F','14-gen-74','24-apr-08',1,'Intestatario','01-lug-08','14-gen-39'),
('CAA059','M','28-mar-73','28-apr-08',1,'Intestatario','01-lug-08','28-mar-38'),
('CAA062','F','18-feb-70','28-apr-08',1,'Intestatario','01-lug-08','18-feb-35'),
('CAA070','F','16-lug-77','28-apr-08',1,'Intestatario','01-lug-08','16-lug-42'),
('CAA072','F','13-ago-80','28-apr-08',1,'Intestatario','01-lug-08','13-ago-45'),
('CAA078','M','31-dic-74','29-apr-08',1,'Intestatario','01-lug-08','31-dic-39'),
('CAA079','F','15-nov-77','29-apr-08',1,'Intestatario','01-lug-08','15-nov-42'),
('CA0007','M','14-lug-75','29-apr-08',1,'Intestatario','01-lug-08','14-lug-40'),
('CA0022','F','05-apr-58','30-apr-08',1,'Intestatario','01-lug-08','05-apr-23'),
('CA0023','M','12-ago-66','30-apr-08',1,'Intestatario','01-lug-08','12-ago-31'),
('CA0025','F','05-apr-56','30-apr-08',1,'Intestatario','01-lug-08','05-apr-21'),
('CA0027','M','25-nov-67','30-apr-08',1,'Intestatario','01-lug-08','25-nov-32'),
('CA0042','M','24-dic-64','30-apr-08',1,'Intestatario','01-lug-08','24-dic-29');