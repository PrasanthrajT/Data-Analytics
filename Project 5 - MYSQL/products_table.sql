


CREATE TABLE Products (

ProductID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
ProductName VARCHAR(40) NOT NULL,
SupplierID SMALLINT UNSIGNED NOT NULL, -- one supplier only
CategoryID TINYINT UNSIGNED NOT NULL,
QuantityPerUnit VARCHAR(20), -- e.g., &#39;10 boxes x 20 bags&#39;
UnitPrice DECIMAL(10,2) UNSIGNED DEFAULT 0,
UnitsInStock SMALLINT DEFAULT 0, -- Negative??
UnitsOnOrder SMALLINT UNSIGNED DEFAULT 0,
ReorderLevel SMALLINT UNSIGNED DEFAULT 0,
Discontinued BOOLEAN NOT NULL DEFAULT FALSE,
PRIMARY KEY (ProductID),
INDEX (ProductName),
FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID),
FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)
);


delimiter //
create procedure Products_insert()

begin

INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Chai',1,1,'10 boxes x 20 bags',18,39,0,10,0);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Chang',1,1,'24 - 12 oz bottles',19,17,40,25,0);
 
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)VALUES('Aniseed Syrup',1,2,'12 - 550 ml bottles',10,13,70,25,0);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Chef Anton''s Cajun Seasoning',2,2,'48 - 6 oz jars',22,53,0,0,0);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Chef Anton''s Gumbo Mix',2,2,'36 boxes',21.35,0,0,0,1);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Grandma''s Boysenberry Spread',3,2,'12 - 8 oz jars',25,120,0,25,0);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Uncle Bob''s Organic Dried Pears',3,7,'12 - 1 lb pkgs.',30,15,0,10,0);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Northwoods Cranberry Sauce',3,2,'12 - 12 oz jars',40,6,0,0,0);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Mishi Kobe Niku',4,6,'18 - 500 g pkgs.',97,29,0,0,1);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Ikura',4,8,'12 - 200 ml jars',31,31,0,0,0);

INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Queso Cabrales',5,4,'1 kg pkg.',21,22,30,30,0);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Queso Manchego La Pastora',5,4,'10 - 500 g pkgs.',38,86,0,0,0);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Konbu',6,8,'2 kg box',6,24,0,5,0);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)VALUES('Tofu',6,7,'40 - 100 g pkgs.',23.25,35,0,0,0);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Genen Shouyu',6,2,'24 - 250 ml bottles',15.5,39,0,5,0);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Pavlova',7,3,'32 - 500 g boxes',17.45,29,0,10,0);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Alice Mutton',7,6,'20 - 1 kg tins',39,0,0,0,1);
INSERT Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) VALUES('Carnarvon Tigers',7,8,'16 kg pkg.',62.5,42,0,0,0);

end //


#call Products_insert;

select * from products;