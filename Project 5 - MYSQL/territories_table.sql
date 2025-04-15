use northwind;

CREATE TABLE Territories (
TerritoryID VARCHAR(20) NOT NULL, -- ZIP code
TerritoryDescription VARCHAR(50) NOT NULL, -- Name
RegionID TINYINT UNSIGNED NOT NULL,
-- Could use an ENUM to eliminate `Region` table
PRIMARY KEY (TerritoryID),
FOREIGN KEY (RegionID) REFERENCES Region (RegionID)
);

desc Territories;


delimiter //
create procedure Territories_insert()
begin 

Insert Into Territories Values ('01581','Westboro',1);
Insert Into Territories Values ('01730','Bedford',1);
Insert Into Territories Values ('01833','Georgetow',1);
Insert Into Territories Values ('02116','Boston',1);
Insert Into Territories Values ('02139','Cambridge',1);
Insert Into Territories Values ('02184','Braintree',1);
Insert Into Territories Values ('02903','Providence',1);
Insert Into Territories Values ('03049','Hollis',3);
Insert Into Territories Values ('03801','Portsmouth',3);
Insert Into Territories Values ('06897','Wilton',1);
Insert Into Territories Values ('07960','Morristown',1);
Insert Into Territories Values ('08837','Edison',1);
Insert Into Territories Values ('10019','New York',1);
Insert Into Territories Values ('10038','New York',1);
Insert Into Territories Values ('11747','Mellvile',1);
Insert Into Territories Values ('14450','Fairport',1);
Insert Into Territories Values ('19428','Philadelphia',3);
Insert Into Territories Values ('19713','Neward',1);
Insert Into Territories Values ('20852','Rockville',1);
Insert Into Territories Values ('27403','Greensboro',1);
Insert Into Territories Values ('27511','Cary',1);
Insert Into Territories Values ('29202','Columbia',4);
Insert Into Territories Values ('30346','Atlanta',4);
Insert Into Territories Values ('31406','Savannah',4);
Insert Into Territories Values ('32859','Orlando',4);
Insert Into Territories Values ('33607','Tampa',4);
Insert Into Territories Values ('40222','Louisville',1);
Insert Into Territories Values ('44122','Beachwood',3);
Insert Into Territories Values ('45839','Findlay',3);
Insert Into Territories Values ('48075','Southfield',3);
Insert Into Territories Values ('48084','Troy',3);
Insert Into Territories Values ('48304','Bloomfield Hills',3);
Insert Into Territories Values ('53404','Racine',3);
Insert Into Territories Values ('55113','Roseville',3);
Insert Into Territories Values ('55439','Minneapolis',3);
Insert Into Territories Values ('60179','Hoffman Estates',2);
Insert Into Territories Values ('60601','Chicago',2);
Insert Into Territories Values ('72716','Bentonville',4);
Insert Into Territories Values ('75234','Dallas',4);
Insert Into Territories Values ('78759','Austin',4);
Insert Into Territories Values ('80202','Denver',2);
Insert Into Territories Values ('80909','Colorado Springs',2);
Insert Into Territories Values ('85014','Phoenix',2);
Insert Into Territories Values ('85251','Scottsdale',2);
Insert Into Territories Values ('90405','Santa Monica',2);
Insert Into Territories Values ('94025','Menlo Park',2);
Insert Into Territories Values ('94105','San Francisco',2);
Insert Into Territories Values ('95008','Campbell',2);
Insert Into Territories Values ('95054','Santa Clara',2);
Insert Into Territories Values ('95060','Santa Cruz',2);
Insert Into Territories Values ('98004','Bellevue',2);
Insert Into Territories Values ('98052','Redmond',2);
Insert Into Territories Values ('98104','Seattle',2);



end //


#call territories_insert;

select * from territories;