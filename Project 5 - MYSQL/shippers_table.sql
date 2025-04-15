
use northwind;

CREATE TABLE Shippers (
ShipperID TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
CompanyName VARCHAR(40) NOT NULL,
Phone VARCHAR(24),
PRIMARY KEY (ShipperID)
);

desc Shippers;

delimiter //
create procedure Shippers_insert()
begin 
INSERT Shippers(ShipperID,CompanyName,Phone) VALUES(1,'Speedy Express','(503) 555-9831');
INSERT Shippers(ShipperID,CompanyName,Phone) VALUES(2,'United Package','(503) 555-3199');
INSERT shippers(ShipperID,CompanyName,Phone) VALUES(3,'Federal Shipping','(503) 555-9931');

end //

call Shippers_insert;

select * from shippers;