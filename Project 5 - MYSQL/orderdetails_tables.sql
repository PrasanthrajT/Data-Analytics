use northwind;


CREATE TABLE  OrderDetails (
OrderID INT UNSIGNED NOT NULL,
ProductID SMALLINT UNSIGNED NOT NULL,
UnitPrice DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 999999.99,
-- max value as default
Quantity SMALLINT(2) UNSIGNED NOT NULL DEFAULT 1,
Discount DOUBLE(8,0) NOT NULL DEFAULT 0, -- e.g., 0.15
PRIMARY KEY (OrderID, ProductID),
FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),

FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);


desc OrderDetails;


delimiter //
create procedure OrderDetails_insert()
begin 
INSERT  OrderDetails VALUES(10248,1,14,12,0);
INSERT OrderDetails VALUES(10248,2,9.8,10,0);
INSERT OrderDetails VALUES(10248,5,34.8,5,0);
INSERT OrderDetails VALUES(10249,4,18.6,9,0);
INSERT OrderDetails VALUES(10249,3,42.4,40,0);
INSERT OrderDetails VALUES(10250,5,7.7,10,0);
INSERT OrderDetails VALUES(10250,6,42.4,35,0.15);
INSERT OrderDetails VALUES(10250,7,16.8,15,0.15);
INSERT OrderDetails VALUES(10251,2,16.8,6,0.05);
INSERT OrderDetails VALUES(10251,8,15.6,15,0.05);

INSERT OrderDetails VALUES(10251,9,16.8,20,0);
INSERT OrderDetails VALUES(10252,8,64.8,40,0.05);
INSERT OrderDetails VALUES(10252,9,2,25,0.05);
INSERT OrderDetails VALUES(10252,7,27.2,40,0);

  


 INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,
	ShippedDate,ShipVia,Freight,ShipName,ShipAddress,
	ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
 VALUES (10281,'ROMEY',4,'2018-07-10','2018-07-13',1,2.94,
	'Romero y tomillo','Gran Vía, 1','Madrid',
	NULL,'28001','Spain');

end //

#call OrderDetails_insert;

select * from OrderDetails;