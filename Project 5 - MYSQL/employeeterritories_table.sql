use northwind;

CREATE TABLE EmployeeTerritories (
EmployeeID MEDIUMINT UNSIGNED NOT NULL,
TerritoryID VARCHAR(20) NOT NULL,
PRIMARY KEY (EmployeeID, TerritoryID),
FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
FOREIGN KEY (TerritoryID) REFERENCES Territories (TerritoryID)
);

desc EmployeeTerritories;

delimiter //
create procedure EmployeeTerritories_insert()
begin 
Insert Into EmployeeTerritories Values (1,'06897');
Insert Into EmployeeTerritories Values (1,'19713');
Insert Into EmployeeTerritories Values (2,'01581');
Insert Into EmployeeTerritories Values (2,'01730');
Insert Into EmployeeTerritories Values (2,'01833');
Insert into EmployeeTerritories Values (2,'02116');
Insert Into EmployeeTerritories Values (2,'02139');
Insert Into EmployeeTerritories Values (2,'02184');
Insert Into EmployeeTerritories Values (2,'40222');
Insert Into EmployeeTerritories Values (3,'30346');
Insert Into EmployeeTerritories Values (3,'31406');
Insert Into EmployeeTerritories Values (3,'32859');
Insert Into EmployeeTerritories Values (3,'33607');
Insert Into EmployeeTerritories Values (4,'20852');
Insert Into EmployeeTerritories Values (4,'27403');
Insert Into EmployeeTerritories Values (4,'27511');
Insert Into EmployeeTerritories Values (5,'02903');
Insert Into EmployeeTerritories Values (5,'07960');
Insert Into EmployeeTerritories Values (5,'08837');
Insert Into EmployeeTerritories Values (5,'10019');
Insert Into EmployeeTerritories Values (5,'10038');
Insert Into EmployeeTerritories Values (5,'11747');
Insert Into EmployeeTerritories Values (5,'14450');
Insert Into EmployeeTerritories Values (6,'85014');
Insert Into EmployeeTerritories Values (6,'85251');
Insert Into EmployeeTerritories Values (6,'98004');
Insert Into EmployeeTerritories Values (6,'98052');
Insert Into EmployeeTerritories Values (6,'98104');
Insert Into EmployeeTerritories Values (7,'60179');
Insert Into EmployeeTerritories Values (7,'60601');
Insert Into EmployeeTerritories Values (7,'80202');
Insert Into EmployeeTerritories Values (7,'80909');
Insert Into EmployeeTerritories Values (7,'90405');
Insert Into EmployeeTerritories Values (7,'94025');
Insert Into EmployeeTerritories Values (7,'94105');
Insert Into EmployeeTerritories Values (7,'95008');
Insert Into EmployeeTerritories Values (7,'95054'); 

Insert Into EmployeeTerritories Values (7,'95060');
Insert Into EmployeeTerritories Values (8,'19428');
Insert Into EmployeeTerritories Values (8,'44122');
Insert Into EmployeeTerritories Values (8,'45839');
Insert Into EmployeeTerritories Values (8,'53404'); 
end//
#call employeeterritories_insert;


select * from employeeterritories;
