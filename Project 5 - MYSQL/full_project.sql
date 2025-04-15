 use northwind;
 
 show tables;
 
 #1.List all customers  who did not  place even one order ?
  
select c.customerid,c.ContactName from customers c 
left join orders o on c.customerid =o.customerid where o.orderid is null;


#2.list of products and categories they belongs to?

select p.productid,p.productname,c.categoryname from products p 
inner join categories c on p.categoryid=c.categoryid;


#3.list all the products with their corresponding supplier details?

select p.productid,p.productname,s.CompanyName,s.ContactName from products p 
inner join suppliers s on p.SupplierID=s.SupplierID;


#4.List of customers and their orderdetails info?

select  o.orderid,c.customerid,c.companyname,d.ProductID,P.PRODUCTNAME, d.UnitPrice, d.Quantity, d.Discount from orders o 
inner join orderdetails d on o.orderid = d.orderid 
inner join customers c on c.customerid=o.customerid 
inner join products p on d.productid=p.productid;


#5.	list all customers who placed atleast one order?

select distinct(c.customerid) from orders o 
inner join customers c on o.customerid=c.customerid order by customerid asc;


#6.	list all the employees with the territories they belong to and their regions?

select distinct e.employeeid,concat(e.LastName," ",e.FirstName) as employee_name,e.City,e.Country,t.territoryid,d.territorydescription,r.regionid,r.regiondescription from employees e
inner join  employeeterritories t on e.employeeid=t.employeeid 
inner join  territories d on d.territoryid=t.territoryid
inner join  region r on r.regionid=d.regionid;

#7.	Find out the products & category sales for 2018?

select o.orderid,o.customerid,o.employeeid,o.orderdate,d.productid,p.productname,c.categoryname from orders o
left join orderdetails d on o.orderid=d.orderid
inner join products p on d.productid=p.productid
inner join categories c on p.categoryid=c.categoryid where year(o.orderdate)="2018"; 


select o.orderid,o.customerid,o.employeeid,o.orderdate,d.productid from orders o
left join orderdetails d on o.orderid=d.orderid where year(o.orderdate)="2018";






# 10.	for each order aggregate the minimum,maximum,average,total sum?

select sum(d.unitprice*d.quantity) as total_price,avg(d.unitprice*d.quantity) as avg_price,min(d.unitprice*d.quantity) as min_order_price,max(d.unitprice*d.quantity) as max_order_price from orderdetails d inner join products p on d.productid=p.productid order by productname asc;

#select d.orderid,p.productname, min((d.unitprice*d.quantity)) as minimum_order from orderdetails d inner join products p on d.productid=p.productid;
#select p.productname,max(d.unitprice*d.quantity) from orderdetails d inner join products p on d.productid=p.productid;
#select d.orderid,d.productid,p.productname, avg(d.unitprice*d.quantity) from orderdetails d inner join products p on d.productid=p.productid where d.orderid != "10248";

#11.	calcualte the average units in stock of the products?

select avg(unitsinstock) from products;

#12.	calculate the sum of units in stock by product category?

select distinct(categoryid),sum(unitsinstock) from products group by categoryid;

#13.	find all the customers who purchased more than one order?

select customerid,count(customerid) as no_oforders from orders group by customerid having count(customerid)>1 ;


#14.	find all the customers who purchesed more than one product in their orders ?

select d.orderid,o.customerid,c.contactname,d.quantity from orders o inner join orderdetails d on o.orderid=d.orderid
inner join customers c on c.customerid=o.customerid where d.quantity >1;


#15.Find all the orders with their total sale i.e., [orderId, sum(unit price*quantity)]

select orderid,unitprice,quantity,sum(unitprice*quantity) as totalsale from orderdetails group by orderid;


#16.Find all the sale orders whose total sale is greater than $5000 ?

select orderid,unitprice,quantity,sum(unitprice*quantity) as totalsale from orderdetails group by orderid having sum(unitprice*quantity)>5000;



#17.Get the number of products in the products table ?

select count(productid) as number_of_products from products;


#18.Find all the products having more than one supplier?

select count(supplierid),productname from products group by productid having count(supplierid)>1;

select count(supplierid),supplierid from products group by supplierid having count(supplierid)>1 order by productid asc  ;

select supplierid,productname from products group by productid;