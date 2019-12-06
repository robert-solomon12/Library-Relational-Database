CREATE DATABASE /*!32312 IF NOT EXISTS*/`librarydatabase` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `librarydatabase`;

SET foreign_key_checks = 0;

  DROP TABLE IF EXISTS `employeeinfos`;
  DROP TABLE IF EXISTS `payments`;
  DROP TABLE IF EXISTS `members`;
  DROP TABLE IF EXISTS `borrowings`;
  DROP TABLE IF EXISTS `books`;
  DROP TABLE IF EXISTS `copies`;
  DROP TABLE IF EXISTS `fines`;

 CREATE TABLE `payments` (
  `paymentId` INT(13),
  `type` VARCHAR(45) NOT NULL,
  `pay_Date` VARCHAR(15),
  `amount` VARCHAR(8) NULL,
  `bank` VARCHAR(20) NOT NULL,
  `IBAN` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`paymentId`));
  
  
    insert  into `payments`(`paymentId`,`pay_Date`,`type`,`amount`,`bank`,`IBAN`)
   
   values
    (1243,'23/02/2019','pay_slip','€12.35','AIB','AIBEK32445656'),
    
    (1343,'12/03/2019','cheque','€9.85','Zenith Bank','ZB34785390'),
    
    (1453,'05/06/2019','benefit-in-kind','€9.85','AIB','AIBEK23452754'),
    
    (1563,'17/07/2019','cheque','€8.56','Ulster Bank','UB34851243'),
    
    (1255,'19/02/2019','benefit-in-kind','€12.35','Zenith Bank','AIBEK23246745'),
    
    (1783,'20/02/2019','payslip','€12.35','AIB','AIBEK34568967');
    
    
  CREATE TABLE `employeeinfos` (
  `employeeId` INT(13) AUTO_INCREMENT,
  `first_Name` VARCHAR(45) NOT NULL,
  `last_Name` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(6) NOT NULL,
  `dateOfBirth` VARCHAR(10),
  `address_Line1` VARCHAR(40) NOT NULL,
  `address_Line2` VARCHAR(40) DEFAULT NULL,
  `city` VARCHAR(50) NOT NULL,
  `country` VARCHAR(20) NOT NULL,
  `phoneNumber` INT(15),
  `socialSecurityNo` INT(15),
  `start_Date` VARCHAR(10),
  `jobTitle` VARCHAR(50) NOT NULL,
  `contract` VARCHAR(15) NULL,
  `payRate` VARCHAR(10),

  #ASK LECTURER ABOUT 
  PRIMARY KEY (`employeeId`),
   KEY `employeeId_1` (`employeeId`),
    KEY `employeeId_2` (`employeeId`),
	CONSTRAINT `employeeinfos_fk_1` FOREIGN KEY (`employeeId`) REFERENCES `payments` (`paymentId`),
    CONSTRAINT `employeeinfos_fk_2` FOREIGN KEY (`employeeId`) REFERENCES `borrowings` (`borrowingId`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    );

 insert  into `employeeinfos`(`employeeId`,`first_Name`,`last_Name`,`gender`,`dateOfBirth`,`address_Line1`,`address_Line2`,`city`,`country`,`phoneNumber`,`socialSecurityNo`,`start_Date`,`jobTitle`,`contract`,`payRate`) 
 
 values 
(1003,'Carine','Schmitt','Female','12/11/1985','89 Strong St.','Kilmeaden','Waterford','Ireland',0864673164,1370788,'21/05/2004','Cleaner','Part-Time','Wage'),

(1023,'Sommer','Martín','Male','12/11/1965','21 Macklemore St.','Ashald','Kildare','Ireland',0874232433,2741546,'03/04/2005','Librarian','Permanent','Wage'),

(1232,'Ferguson','Peter','Male','06/07/1998','897 Long Airport Avenue','Ashald','Kildare','Ireland',0874498564,2454631,'26/03/2006','Librarian','Part-Time','Wage'),

(1502,'Labrune','Janine ','Female','25/02/1992','5557 North Pendale Street','Derry','Derry','Ireland',0878978564,2901778,'19/06/2008','Manager','Permanent','Salary'),

(1342,'Bergulfsen','Jonas ','Male','12/11/1980','Vinbæltet 34','Lucan','Dublin','Ireland',0874412564,2904764,'21/02/2005','Librarian','Part-Time','Wage'),

(1532,'Nelson','Susan','Female','12/11/1980','28 Macklemore St.','Ashald','Kildare','Ireland',0874413464,2654234,'23/03/2004','Cleaner','Permanent','Wage'),

(1644,'Saveley','Mary','Female','12/11/1988','23 Chalamagne St.','Cunewalde','Monaghan','Ireland',0871567364,2652356,'23/03/2004','Cleaner','Part-Time','Wage'),

(1996,'Taylor','Maddie','Female','12/11/1989','18, Place Kléber','Glendale','Wicklow','Ireland',0874413464,2654234,'23/03/2004','Cleaner','Permanent','Wage');


#Add more employees into the LibraryDatabase above !!! 


   CREATE TABLE `members` (
  `cardNumber` INT(13) AUTO_INCREMENT,
  `first_Name` VARCHAR(25) NULL,
  `last_Name` VARCHAR(25) NULL,
  `gender` VARCHAR(10) NULL,
  `address_Line1` VARCHAR(40) NOT NULL,
  `address_Line2` VARCHAR(40) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `dateOfBirth` VARCHAR(10),
  `medicalIssues` VARCHAR(10),
  PRIMARY KEY (`cardNumber`),
   KEY `cardNumber` (`cardNumber`),
  CONSTRAINT `members_fk_1` FOREIGN KEY (`cardNumber`) REFERENCES `borrowings` (`borrowingId`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    );
  
     insert  into `members`(`cardNumber`,`last_Name`,`first_Name`,`gender`,`dateOfBirth`,`address_Line1`,`address_Line2`,`city`,`postalCode`,`country`,`medicalIssues`) 
 
 values
 
 (2354,'Frick','Stefanie','Female','23/11/1985','89 Strong St.','Drumcondra','Dublin','XRT 9WAD','Ireland','NONE'),
 
 (2343,'Huang','Wing',',Male','23/09/1985','78 Strong St.','Rialto','Dublin','DNT 9DES','Ireland','NONE'),
 
 (2363,'Brown','Julie','Female','12/01/1995','92 Furth Circle','Kilmeaden','Cork','XRT 6DFF','Ireland','Headache'),
 
 (2333,'Graham','Mike','Male','12/11/1977','94 Furth Circle','Ballsbridge','Dublin','DNT 9YTR','Ireland','Obesity'),
 
 (2453,'Brown','William','Female','13/06/1978','67 Strong St.','Terenure','Dublin','DNT 977D','Ireland','Headache'),
 
 (2454,'Calaghan','Ben','Male','01/06/1967','89 Strong St.','Kimmage','Dublin','XRT RT4D','Ireland','Headache'),
 
 (2544,'Suominen','Kalle','Female','06/11/1965','45 Strong St.','Kilmeaden','Waterford','XRT 9DRD','Ireland','Asthma'),
 
 (2654,'McKenna','Patricia','Female','06/10/1995','43 Strong St.','KilMcThomas','Waterford','XRT 9DSD','Ireland','Obesity'),
 
 (2673,'Lebihan','Laurence ','Female','25/11/1996','89 Strong St.','Carriganore','Waterford','XRT 94GD','Ireland','NONE'),
 
 (2543,'Tseng','Jerry','Male','12/11/1997','23 Strong St.','Rossduff','Waterford','XRT 9DSD','Ireland','Obesity');
    
    
  CREATE TABLE `books` (
  `idBook` INT(15) AUTO_INCREMENT,
  `title` VARCHAR(40),
  `author` VARCHAR(30),
  `genre` VARCHAR(30),
  `publisher`VARCHAR(40),
  `year_Released` int(4),
  PRIMARY KEY (`idBook`)
  );
  
  
  
    insert  into `books`(`idbook`,`title`,`author`,`publisher`,`genre`,`year_Released`)
    values
    (4353,'Friday The 13th','Simon Hawke','Penguin Random House','Horrors',2007),
    
    (3434,'Catch-22','Joseph Heller','Bonnier','Drama',2005),
    
    (5433,'On the Road','Jack Kerouac','Hachette Livre','Drama',2008),
    
    (4554,'To Kill A Mockingbird','Harper Lee','Cornerstone','History',2013),
    
    (3244,'The Lord Of The Rings','J. R. R. Tolkien','WEKA','Science Fiction',2011),
    
    (2132,'Lolita Vladimir Nabokov','Hachette Livre','Saraiva','Action and Adventure',2013),
    
    (4543,'The Catcher in the Rye', 'JD Salinger','Cornelsen','Drama',2012),
    
    (2344,'Midnight’s Children','Salman Rushdie','Gakken Co. Ltd.','Horrors',2016),
    
    (7645,'Alice’s Adventures In Wonderland','Lewis Carroll','Westermann','Action and Adventure',2017),
    
    (4256,'Ulysses James Joyce','Saraiva','Bonnier','Drama',2012),
    
    (3452,'Lord of the Flies','William Golding','Penguin Random House','Science Fiction',2015),
    
    (5656,'The Grapes Of Wrath','John Steinbeck','Penguin Random House','Action',2014),
    
    (5432,'1984','George Orwell','Klett','History',2016),
    
    (2345,'Jane Eyre','Charlotte Brontë','Mondadori','Mystery',2015),
    
    (4552,'Moby-Dick','Herman Melville','Penguin Random House','Action and Adventure',2011),
    
    (5654,'Mrs Dalloway','Virginia Woolf','Westermann','Romance',2014),
    
    (3455,'A Passage to India','EM Forster','The Perseus Book Group','Adventure',2016),
    
    (6564,'The Prime of Miss Jean Brodie','Muriel Spark',' Bonnier','Fantasy',2007),
    
    (3672,'One Hundred Years of Solitude','Gabriel García Márquez','Medien Union','Drama',2009),
    
    (6562,'Pride and Prejudice','Jane Austen','ACTISSIA SAS','History',2008);
    
    
    DROP TABLE IF EXISTS `borrowings`;
  CREATE TABLE `borrowings` (
  `borrowingId` int(15) AUTO_INCREMENT,
  `date_In` VARCHAR(10),
  `date_Out` VARCHAR(10),
  PRIMARY KEY (`borrowingId`)
    );
    
	 insert  into `borrowings`(`borrowingId`,`date_In`,`date_Out`)
    values
    (324,'21/05/2017','21/06/2017'),
    
	(234,'24/03/2017','21/04/2017'),
    
    (453,'14/03/2017','12/04/2017'),
    
    (122,'18/10/2017','21/11/2017'),
    
    (343,'17/08/2016','19/09/2016'),
    
    (565,'21/05/2017','21/06/2017'),
    
    (567,'24/05/2015','21/07/2015'),
    
    (365,'13/06/2018','23/07/2018'),
    
    (566,'19/05/2018','20/06/2018'),
    
    (546,'22/04/2014','21/05/2014'),
    
    (345,'21/01/2018','21/02/2018'),
    
    (789,'29/07/2018','21/08/2018');
    
    
   CREATE TABLE `copies` (
  `copyId` int(10) AUTO_INCREMENT,
  `shelf` VARCHAR(15),
  PRIMARY KEY (`copyId`),
   KEY `copyId_1` (`copyId`),  
  KEY `copyId_2` (`copyId`),				#copyId_2 didn't work because mysql was couldn't drop table 'borrowings' referenced by a foreign key constraint 'copies_fk_2' on table 'copies' which was the error I got.
  CONSTRAINT `copies_fk_1` FOREIGN KEY (`copyId`) REFERENCES `books` (`idBook`),
   CONSTRAINT `copies_fk_2` FOREIGN KEY (`copyId`) REFERENCES `borrowings` (`borrowingId`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
  );
  
   insert  into `copies`(`copyId`,`shelf`)
    values
    (443,'F53'),
    
	(454,'C24'),
    
	(243,'O65'),
    
    (334,'T26'),
    
	(354,'T24'),
    
	(564,'L37'),
    
    (312,'T29'),
    
	(676,'M64'),
    
    (423,'A45'),
    
    (565,'U33'),
    
	(574,'L35'),
    
	(765,'T24'),
    
    (435,'#195'),
    
	(576,'J45'),
    
	(367,'M65'),
    
    (645,'M64'),
    
	(353,'A43'),
    
    (245,'T26'),
    
    (455,'O62'),
    
    (345,'P45');
  
   CREATE TABLE `fines` (
  `fineId` int(5) AUTO_INCREMENT,
  `amount` VARCHAR(7),
  `exceededDays` int(10), 
  PRIMARY KEY (`fineId`),
  KEY`fineId`(`fineId`),
   KEY`exceededDays`(`exceededDays`),
  CONSTRAINT `fines_fk_1` FOREIGN KEY (`fineId`) REFERENCES `borrowings` (`borrowingId`),
   CONSTRAINT `fines_fk_2` FOREIGN KEY (`exceededDays`) REFERENCES `borrowings` (`borrowingId`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
  );
  
  
   insert  into `fines`(`fineId`,`amount`,`exceededDays`)
    values
    (435,'€5.23',4),
    
    (234,'€12.54',10),
    
    (443,'€4.23',3),
    
    (343,'€2.33',3),
    
    (323,'€3.34',4),
    
    (433,'€3.45',4),
    
    (322,'€4.52',5),
    
    (231,'€5.67',6);
    
    
  SET foreign_key_checks = 1;