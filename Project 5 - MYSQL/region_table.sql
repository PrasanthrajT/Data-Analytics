use northwind;

CREATE TABLE Region (
RegionID TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
-- [0,255]
RegionDescription VARCHAR(50) NOT NULL,

-- e.g., &#39;Eastern&#39;,&#39;Western&#39;,&#39;Northern&#39;,&#39;Southern&#39;
-- Could use an ENUM and eliminate this table
PRIMARY KEY (RegionID)
);

desc region;

delimiter //
create procedure Region_insert()
begin 

Insert Into Region (RegionDescription) Values ('Eastern');
Insert Into Region (RegionDescription) Values ('Western');
Insert Into Region (RegionDescription) Values ('Northern');
Insert Into Region (RegionDescription) Values ('Southern');

end //

call Region_insert;

select * from region;
