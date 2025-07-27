/*
SQLyog Ultimate v8.55 
MySQL - 5.1.36-community : Database - ecrimesecurity
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ecrimesecurity` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ecrimesecurity`;

/*Table structure for table `aadharaddress` */

DROP TABLE IF EXISTS `aadharaddress`;

CREATE TABLE `aadharaddress` (
  `AOAId` int(11) NOT NULL AUTO_INCREMENT,
  `AadharNo` varchar(20) DEFAULT NULL,
  `OldAddress` varchar(1000) DEFAULT NULL,
  `DateModify` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AOAId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `aadharaddress` */

insert  into `aadharaddress`(`AOAId`,`AadharNo`,`OldAddress`,`DateModify`) values (1,'832805617507','HK Nagar,Mysuru','17/06/2023'),(2,'368087187211','TK Layout,Mysuru','27/06/2023');

/*Table structure for table `aadharmaster` */

DROP TABLE IF EXISTS `aadharmaster`;

CREATE TABLE `aadharmaster` (
  `AadharNo` varchar(15) NOT NULL,
  `AWSFilePath` varchar(100) DEFAULT NULL,
  `PhotoPath` varchar(100) DEFAULT NULL,
  `DataKey` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`AadharNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aadharmaster` */

insert  into `aadharmaster`(`AadharNo`,`AWSFilePath`,`PhotoPath`,`DataKey`) values ('203450810275','aadhar2023/3570_3570.jpg','~/PhotoFiles/Ramesh_6995.jpg','3570'),('368087187211','aadhar2023/5740_5740.jpg','~/PhotoFiles/Bharath_7714.jpg','5740'),('701281827482','aadhar2023/5288_8517.jpg','~/PhotoFiles/Kiran_7643.png','5288'),('832805617507','aadhar2023/7827_7827.jpg','~/PhotoFiles/Manu_4888.png','7827');

/*Table structure for table `aadharstaff` */

DROP TABLE IF EXISTS `aadharstaff`;

CREATE TABLE `aadharstaff` (
  `ASId` int(11) NOT NULL,
  `CityId` int(11) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `MobileNo` varchar(20) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Address` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ASId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aadharstaff` */

insert  into `aadharstaff`(`ASId`,`CityId`,`Name`,`Password`,`MobileNo`,`EmailId`,`Address`) values (479431,1,'Guru','8138','9986337563','srinivaskarthik.v@gmail.com','Mysuru'),(682513,1,'Ramesh','123','9986337563','srinivaskarthik9.v@gmail.com','Mysuru');

/*Table structure for table `applicationmanager` */

DROP TABLE IF EXISTS `applicationmanager`;

CREATE TABLE `applicationmanager` (
  `AMId` varchar(10) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `applicationmanager` */

insert  into `applicationmanager`(`AMId`,`Password`) values ('Admin','123');

/*Table structure for table `areamaster` */

DROP TABLE IF EXISTS `areamaster`;

CREATE TABLE `areamaster` (
  `AreaId` int(11) NOT NULL AUTO_INCREMENT,
  `CityId` int(11) DEFAULT NULL,
  `AreaName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`AreaId`),
  KEY `FK_areamaster` (`CityId`),
  CONSTRAINT `FK_areamaster` FOREIGN KEY (`CityId`) REFERENCES `citymaster` (`CityId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `areamaster` */

insert  into `areamaster`(`AreaId`,`CityId`,`AreaName`) values (1,1,'HK Nagar'),(2,1,'JP Nagar'),(3,1,'VV Mohalla'),(4,2,'JP Nagar');

/*Table structure for table `citymaster` */

DROP TABLE IF EXISTS `citymaster`;

CREATE TABLE `citymaster` (
  `CityId` int(11) NOT NULL AUTO_INCREMENT,
  `StateId` int(11) DEFAULT NULL,
  `CityName` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`CityId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `citymaster` */

insert  into `citymaster`(`CityId`,`StateId`,`CityName`) values (1,1,'Mysuru'),(2,1,'Bangalore'),(3,1,'Hassan');

/*Table structure for table `countrymaster` */

DROP TABLE IF EXISTS `countrymaster`;

CREATE TABLE `countrymaster` (
  `CountryId` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `countrymaster` */

insert  into `countrymaster`(`CountryId`,`CountryName`) values (1,'India'),(2,'USA'),(3,'Dubai');

/*Table structure for table `crimelog` */

DROP TABLE IF EXISTS `crimelog`;

CREATE TABLE `crimelog` (
  `CLId` int(11) NOT NULL AUTO_INCREMENT,
  `CId` int(11) DEFAULT NULL,
  `LogDate` varchar(100) DEFAULT NULL,
  `CLHV` varchar(1000) DEFAULT NULL,
  `FilePath` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`CLId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `crimelog` */

insert  into `crimelog`(`CLId`,`CId`,`LogDate`,`CLHV`,`FilePath`) values (1,1,'06/28/2023 13:21:27:PM','9886','crimecase1/JP Nagar Murder_9886.jpg');

/*Table structure for table `crimemaster` */

DROP TABLE IF EXISTS `crimemaster`;

CREATE TABLE `crimemaster` (
  `CrimeId` int(11) NOT NULL AUTO_INCREMENT,
  `PSId` int(11) DEFAULT NULL,
  `CrimeName` varchar(100) DEFAULT NULL,
  `CrimePlace` varchar(100) DEFAULT NULL,
  `CrimeType` varchar(100) DEFAULT NULL,
  `Description` varchar(8000) DEFAULT NULL,
  `CrimeDate` varchar(100) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CrimeId`),
  KEY `FK_crimemaster` (`PSId`),
  CONSTRAINT `FK_crimemaster` FOREIGN KEY (`PSId`) REFERENCES `policestationmaster` (`PoliceStationId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `crimemaster` */

insert  into `crimemaster`(`CrimeId`,`PSId`,`CrimeName`,`CrimePlace`,`CrimeType`,`Description`,`CrimeDate`,`Status`) values (1,425846,'JP Nagar Murder','JP Nagar near 5th cross park','Murder','A person Murder at JP Nagar Park, age around 45 to 50 at midnight 2:30 AM','06/28/2023 13:16:34:PM','Process');

/*Table structure for table `criminalcrimerecord` */

DROP TABLE IF EXISTS `criminalcrimerecord`;

CREATE TABLE `criminalcrimerecord` (
  `CRId` int(11) NOT NULL AUTO_INCREMENT,
  `CrimeId` int(11) DEFAULT NULL,
  `CriminalId` int(11) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`CRId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `criminalcrimerecord` */

insert  into `criminalcrimerecord`(`CRId`,`CrimeId`,`CriminalId`,`Description`) values (2,1,678183,'Criminal involved in JP Nagar murder crime,arrested based on crime evidence.'),(3,1,155016,'Criminal involved in JP Nagar murder crime arrested based strong evidence.');

/*Table structure for table `criminaldata` */

DROP TABLE IF EXISTS `criminaldata`;

CREATE TABLE `criminaldata` (
  `CDId` int(11) NOT NULL AUTO_INCREMENT,
  `CriminalId` int(11) DEFAULT NULL,
  `Eyecolor` varchar(100) DEFAULT NULL,
  `FingerPrint` varchar(100) DEFAULT NULL,
  `Height` varchar(100) DEFAULT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `PhotoPath` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CDId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `criminaldata` */

insert  into `criminaldata`(`CDId`,`CriminalId`,`Eyecolor`,`FingerPrint`,`Height`,`Weight`,`PhotoPath`) values (2,678183,'brown ','Left Loop','5.2','78','~/PhotoFiles/678183_7482.png'),(3,155016,'brown ','Right Loop','5.2','65','~/PhotoFiles/155016_4231.jpg');

/*Table structure for table `criminaldetails` */

DROP TABLE IF EXISTS `criminaldetails`;

CREATE TABLE `criminaldetails` (
  `CriminalId` int(11) NOT NULL,
  `CriminalName` varchar(100) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `MobileNo` varchar(10) DEFAULT NULL,
  `AadharNo` varchar(15) DEFAULT NULL,
  `PassportNo` varchar(20) DEFAULT NULL,
  `Address` varchar(1000) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CriminalId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `criminaldetails` */

insert  into `criminaldetails`(`CriminalId`,`CriminalName`,`Age`,`Gender`,`MobileNo`,`AadharNo`,`PassportNo`,`Address`,`Status`) values (155016,'AnnJohn',21,'Male','9986337563','0','561298','#10,2nd cross,4th main,JP Nagar,Mysuru','Active'),(678183,'Manu',42,'Male','9986337521','832805617507','0','TK Layout,Mysuru','Active');

/*Table structure for table `foreignerpassport` */

DROP TABLE IF EXISTS `foreignerpassport`;

CREATE TABLE `foreignerpassport` (
  `FPPNo` int(11) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `MobileNo` varchar(20) DEFAULT NULL,
  `AMobileNo` varchar(20) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Address` varchar(1000) DEFAULT NULL,
  `SAddress` varchar(1000) DEFAULT NULL,
  `DateFrom` varchar(100) DEFAULT NULL,
  `DateTo` varchar(100) DEFAULT NULL,
  `FilePath` varchar(100) DEFAULT NULL,
  `Status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `foreignerpassport` */

insert  into `foreignerpassport`(`FPPNo`,`Name`,`LastName`,`Age`,`Gender`,`MobileNo`,`AMobileNo`,`EmailId`,`Address`,`SAddress`,`DateFrom`,`DateTo`,`FilePath`,`Status`) values (457678,'zen','sam',21,'Male','9986337563','9986337563','srinivaskarthik.v@gmail.com','USA','JP Nagar,Mysuru','20/5/2023','20/8/2026','zen457678/457678_N_128848.pdf','Active'),(562314,'John','Mark',21,'Male','8050850147','9986337563','srinivaskarthik.v@gmail.com','JT Street,USA','#10,2nd cross,4th main,JP Nagar,Mysuru','20/6/2023','20/8/2027','john562314/562314_N_131727.pdf','Active'),(561298,'Ann','John',21,'Male','9986337563','9986337563','srinivaskarthik.v@gmail.com','USA','#10,2nd cross,4th main,JP Nagar,Mysuru','20/5/2023','20/8/2027','ann561298/561298_N_17851.pdf','Active');

/*Table structure for table `higherofficermaster` */

DROP TABLE IF EXISTS `higherofficermaster`;

CREATE TABLE `higherofficermaster` (
  `HOId` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `MobileNo` varchar(10) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`HOId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `higherofficermaster` */

insert  into `higherofficermaster`(`HOId`,`Name`,`Password`,`Role`,`MobileNo`,`EmailId`,`Address`) values (148169,'Kruthan','9671','DGP','9986337563','srinivaskarthik.v@gmail.com','JP Nagar,Mysuru');

/*Table structure for table `passportstaff` */

DROP TABLE IF EXISTS `passportstaff`;

CREATE TABLE `passportstaff` (
  `PPSId` int(11) DEFAULT NULL,
  `CityId` int(11) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `MobileNo` varchar(10) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Address` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `passportstaff` */

insert  into `passportstaff`(`PPSId`,`CityId`,`Name`,`Password`,`MobileNo`,`EmailId`,`Address`) values (115434,1,'Gupta','123','9986337563','srinivaskarthik.v@gmail.com','JP Nagar,Mysuru'),(476977,1,'Shiva','6003','9986337563','srinivaskarthik.v@gmail.com','TK Layout,Mysuru');

/*Table structure for table `policestationmaster` */

DROP TABLE IF EXISTS `policestationmaster`;

CREATE TABLE `policestationmaster` (
  `PoliceStationId` int(11) NOT NULL,
  `AreaId` int(11) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `MobileNo` varchar(10) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Address` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`PoliceStationId`),
  KEY `FK_policestationmaster` (`AreaId`),
  CONSTRAINT `FK_policestationmaster` FOREIGN KEY (`AreaId`) REFERENCES `areamaster` (`AreaId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `policestationmaster` */

insert  into `policestationmaster`(`PoliceStationId`,`AreaId`,`Name`,`Password`,`MobileNo`,`EmailId`,`Address`) values (224525,1,'PS_HKN','123','9986337563','srinivaskarthik.v@gmail.com','HK Nagar,Mysuru'),(425846,2,'PS_JPN','3367','9986337563','srinivaskarthik.v@gmail.com','JP Nagar,Mysuru'),(863562,3,'VVMPS','6361','9986337521','srinivaskarthik.v@gmail.com','Mysuru');

/*Table structure for table `statemaster` */

DROP TABLE IF EXISTS `statemaster`;

CREATE TABLE `statemaster` (
  `StateId` int(11) NOT NULL AUTO_INCREMENT,
  `CountryId` int(11) DEFAULT NULL,
  `StateName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StateId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `statemaster` */

insert  into `statemaster`(`StateId`,`CountryId`,`StateName`) values (1,1,'Karnataka'),(2,1,'Kerala');

/*Table structure for table `usermaster` */

DROP TABLE IF EXISTS `usermaster`;

CREATE TABLE `usermaster` (
  `UserId` int(11) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `MobileNo` varchar(10) DEFAULT NULL,
  `AadharNo` varchar(20) DEFAULT NULL,
  `Address` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usermaster` */

insert  into `usermaster`(`UserId`,`Name`,`Password`,`MobileNo`,`AadharNo`,`Address`) values (896025,'Ramesh','123','9986337521','203450810275','TK Layout,Mysuru');

/*Table structure for table `userrequest` */

DROP TABLE IF EXISTS `userrequest`;

CREATE TABLE `userrequest` (
  `ReqId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `ReqAadharNo` varchar(20) DEFAULT NULL,
  `ReqReason` varchar(1000) DEFAULT NULL,
  `ReqDate` varchar(100) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ReqId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `userrequest` */

insert  into `userrequest`(`ReqId`,`UserId`,`ReqAadharNo`,`ReqReason`,`ReqDate`,`Status`) values (1,896025,'832805617507','Need to Provide Rent','16/06/2023','Approve');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
