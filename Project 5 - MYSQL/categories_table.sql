use northwind;

CREATE TABLE Categories (
CategoryID TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
-- [0, 255], not expected to be large
CategoryName VARCHAR(30) NOT NULL,
-- e.g., &#39;Beverages&#39;,&#39;Condiments&#39;,etc
Description TEXT, -- up to 64KB characters
Picture BLOB, -- up to 64KB binary
PRIMARY KEY (CategoryID),
UNIQUE INDEX (CategoryName)
-- Build index on this unique-value column for fast search
);

 #drop table categories;
 
 desc Categories; 
 
 delimiter //
create procedure Categories_insert()
begin 
INSERT into Categories(CategoryName,Description) VALUES('Beverages','Soft drinks, coffees, teas, beers, and ales');
INSERT Categories(CategoryName,Description) VALUES('Condiments','Sweet and savory sauces, relishes, spreads, and seasonings');
INSERT Categories(CategoryName,Description) VALUES('Confections','Desserts, candies, and sweet breads');
INSERT Categories(CategoryName,Description) VALUES('Dairy Products','Cheeses');
INSERT Categories(CategoryName,Description) VALUES('Grains/Cereals','Breads, crackers, pasta, and cereal');
INSERT Categories(CategoryName,Description) VALUES('Meat/Poultry','Prepared meats');
INSERT Categories(CategoryName,Description) VALUES('Produce','Dried fruit and bean curd');
INSERT Categories(CategoryName,Description) VALUES('Seafood','Seaweed and fish');

end//
 
 
 #call Categories_insert;
 select * from categories;