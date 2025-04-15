


CREATE TABLE Orders (
OrderID INT UNSIGNED NOT NULL AUTO_INCREMENT,
-- Use UNSIGNED INT to avoid run-over
CustomerID VARCHAR(5),
EmployeeID MEDIUMINT UNSIGNED NOT NULL,
OrderDate DATE,
RequiredDate DATE,
ShippedDate DATE,
ShipVia TINYINT UNSIGNED,
Freight DECIMAL(10,2) UNSIGNED DEFAULT 0,
ShipName VARCHAR(40),
ShipAddress VARCHAR(60),
ShipCity VARCHAR(15),
ShipRegion VARCHAR(15),
ShipPostalCode VARCHAR(10),
ShipCountry VARCHAR(15),
PRIMARY KEY (OrderID),
INDEX (OrderDate),
INDEX (ShippedDate),
INDEX (ShipPostalCode),
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
FOREIGN KEY (ShipVia) REFERENCES Shippers (ShipperID)
);

desc Orders;

truncate orders;
delimiter //
create procedure Orders_insert()
begin 
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10248,'ALFKI',5,'1996-04-07','1996-01-09','1996-07-16',3,32.38,
	'Vins et alcools Chevalier','59 rue de l''Abbaye','Reims',
	NULL,'51100','France');
  
  
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10249,'ANATR',6,'1996-5-7','1996-08-16','1996-07-25',1,11.61,
	'Toms Spezialitäten','Luisenstr. 48','Münster',
	NULL,'44087','Germany');
  
  
  
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10250,'ANTON',4,'1996-08-07','1996-05-08','1996-12-07',2,65.83,
	'Hanari Carnes','Rua do Paço, 67','Rio de Janeiro',
	'RJ','05454-876','Brazil');
  
  
  
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10251,'AROUT',3,'1996-08-07','1996-05-08','1996-07-15',1,41.34,
	N'Victuailles en stock','2, rue du Commerce','Lyon',
	NULL,'69004','France');
  
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10252,'BERGS',4,'1996-09-07','1996-06-08','1996-11-07',2,51.30,
	'Suprêmes délices','Boulevard Tirou, 255','Charleroi',
	NULL,N'B-6000',N'Belgium');
  
  
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10253,'BLAUS',3,'1996-10-07','1996-12-24','1996-07-16',2,58.17,
	'Hanari Carnes','Rua do Paço, 67','Rio de Janeiro',
	'RJ','05454-876','Brazil');
  
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10254,'BLONP',5,'1996-07-11','1996-08-08','1996-07-23',2,22.98,
	'Chop-suey Chinese','Hauptstr. 31','Bern',
	NULL,'3012','Switzerland');
  
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10255,'BOLID',7,'1996-12-07','1996-09-08','1996-07-15',3,148.33,
	'Richter Supermarkt','Starenweg 5','Genève',
	NULL,'1204','Switzerland');
  
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10256,'BONAP',3,'1996-07-15','1996-12-08','1996-7-17',2,13.97,
	'Wellington Importadora','Rua do Mercado, 12','Resende',
	'SP','08737-363','Brazil');
  
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10257,'BOTTM',4,'1996-7-16','1996-08-13','1996-07-22',3,81.91,
	'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal',
	'Táchira','5022','Venezuela');
  
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10258,'ERNSH',1,'1996-07-11','1996-07-12','1996-07-12',1,140.51,
	'Ernst Handel','Kirchgasse 6','Graz',
	NULL,'8010','Austria');
  


INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10259,'CENTC',4,'1996-07-10','1996-08-10','1996-08-11',3,3.25,
	'Centro comercial Moctezuma','Sierras de Granada 9993','México D.F.',
	NULL,'05022','Mexico');
  
  
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10260,'OTTIK',4,'1996-05-07','1996-05-08','1996-05-08',1,55.09,
	'Ottilies Käseladen','Mehrheimerstr. 369','Köln',
	NULL,'50739','Germany');

INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10261,'QUEDE',4,'1996-07-10','1996-08-10','1996-08-11',2,3.05,
	'Que Delícia','Rua da Panificadora, 12','Rio de Janeiro',
	'RJ','02389-673','Brazil');
  
  
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10262,'RATTC',8,'1996-02-07','1996-02-08','1996-02-09',3,48.29,
	'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque',
	'NM','87110','USA');


INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10263,N'ERNSH',9,'2018-03-02','2018-03-04',3,146.06,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria');
  
 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10264,'FOLKO',6,'2018-03-05','2018-03-07',3,3.67,
	'Folk och fä HB','Åkergatan 24','Bräcke',
	NULL,'S-844 67','Sweden');
  
 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10265,'BLONP',2,'2018-03-12','2018-03-16',1,55.28,
	'Blondel père et fils','24, place Kléber','Strasbourg',
	NULL,'67000','France');
  
 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10266,'WARTH',3,'2018-03-12','2018-03-16',3,25.73,
	'Wartian Herkku','Torikatu 38','Oulu',
	NULL,'90110','Finland');

 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10267,'FRANK',4,'2018-03-20','2018-03-22',1,208.58,
	'Frankenversand','Berliner Platz 43','München',
	NULL,'80805','Germany');
  
 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10268,'GROSR',8,'2018-03-24','2018-03-26',3,66.29,
	'GROSELLA-Restaurante','5ª Ave. Los Palos Grandes','Caracas',
	'DF','1081','Venezuela');
  
 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10269,'WHITC',5,'2018-04-10','2018-04-13',1,4.56,
	'White Clover Markets','1029 - 12th Ave. S.','Seattle',
'WA','98124','USA');
  
 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10270,'WARTH',1,'2018-04-18','2018-04-20',1,136.54,
	'Wartian Herkku','Torikatu 38','Oulu',
	NULL,'90110','Finland');


 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10271,'SPLIR',6,'2018-05-06','2018-05-08',2,4.54,
	'Split Rail Beer & Ale','P.O. Box 555','Lander',
	'WY','82520','USA');


 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10272,'RATTC',6,'2018-05-21','2018-05-23',2,98.03,
	'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque',
	'NM','87110','USA');
  

 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10273,'QUICK',3,'2018-06-10','2018-06-12',3,76.07,
	'QUICK-Stop','Taucherstraße 10','Cunewalde',
	NULL,'01307','Germany');
  
 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10274,'VINET',6,'2018-06-15','2018-06-17',1,6.01,
	'Vins et alcools Chevalier','59 rue de l''Abbaye','Reims',
	NULL,'51100','France');
  
 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10275,'MAGAA',1,'2018-06-22','2018-06-24',1,26.93,
	'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',
	NULL,'24100','Italy');
  
 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES (10276,'TORTU',8,'2018-06-26','2018-06-27',3,13.84,
	'Tortuga Restaurante','Avda. Azteca 123','México D.F.',
	NULL,'05033','Mexico');
  
 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10277,'MORGK',2,'2018-06-22','2018-06-22',3,125.77,
	'Morgenstern Gesundkost','Heerstr. 22','Leipzig',
	NULL,'04179','Germany');
  

 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10278,'BERGS',8,'2018-06-29','2018-07-01',2,92.69,
	'Berglunds snabbköp','Berguvsvägen  8','Luleå',
	NULL,'S-958 22','Sweden');


 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
  VALUES (10279,'LEHMS',8,'2018-07-02','2018-07-04',2,25.83,
	'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',
	NULL,'60528','Germany');


 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)VALUES (10280,'BERGS',2,'2018-07-06','2018-07-08',1,8.98,
	'Berglunds snabbköp','Berguvsvägen  8','Luleå',
	NULL,'S-958 22','Sweden');
  
  

end //

#call Orders_insert;

select * from orders;

#select distinct(customerid) from orders;