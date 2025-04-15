# 1 use case:List all customers  who did not  place even one order ?
 SELECT *
  FROM (SELECT DISTINCT c.CustomerID, o.orderID
          FROM customers c
               INNER JOIN orders o ON c.CustomerID = o.CustomerID
               INNER JOIN orderdetails od ON od.OrderID = o.OrderID) x
       RIGHT JOIN customers c ON c.CustomerID = x.CustomerID
 WHERE x.orderID IS NULL;
 
 #Method left join;
 SELECT *
  FROM (SELECT c.customerID,
               c.contactName,
               o.orderID,
               count(o.orderID) AS total_orders
          FROM customers c
               LEFT JOIN orders o ON c.customerID = o.customerID
               LEFT JOIN orderdetails od ON o.OrderID = od.OrderID
        GROUP BY o.orderID, c.CustomerID, c.contactName) X
 WHERE X.total_orders <= 0;
 
 # Using exists

SELECT c.CustomerID, c.ContactName
  FROM customers c
 WHERE NOT EXISTS
          (SELECT *
             FROM orders o,
                  orderdetails od
            WHERE o.CustomerID = c.CustomerID 
            AND   o.OrderID = od.OrderID); 

#2.use case : list of products and the categories they belong to?
SELECT p.productID,
       p.ProductName,
       c.categoryID,
       c.categoryName
  FROM products p, categories c
 WHERE p.CategoryID = c.CategoryID;
 
 #3. Use Case: list all the products with their corresponding supplier details?
 SELECT p.ProductID,
       p.ProductName,
       s.SupplierID,
       s.CompanyName
  FROM products p, suppliers s
 WHERE p.SupplierID = s.SupplierID;
 
 #4. Use Case: List of customers and their orderdetails info?
SELECT c.CustomerID,
       c.ContactName,
       od.OrderID,
       od.ProductID
  FROM customers c, orderdetails od, orders o
 WHERE c.CustomerID = o.CustomerID AND o.orderID = od.OrderID;
 
 #5.Use Case: list all customers who placed atleast one order?
SELECT c.customerID,
       c.contactName,
       o.orderID,
       count(o.orderID) AS total_orders
  FROM customers c, orders o, orderdetails od
 WHERE c.CustomerID = o.CustomerID AND o.OrderID = od.OrderID
GROUP BY o.orderID,c.CustomerID,c.contactName
HAVING count(o.OrderID) >= 1;
 # method -2 using inner query       
select * 
from
(       
SELECT c.customerID,
       c.contactName,
       o.orderID,
       count(o.orderID) AS total_orders
  FROM customers c, orders o, orderdetails od
 WHERE c.CustomerID = o.CustomerID AND o.OrderID = od.OrderID
GROUP BY o.orderID,c.CustomerID,c.contactName
)X
where X.total_orders >=1

#method 3 using joins

SELECT c.CustomerID,
       c.ContactName,
       o.orderID,
       count(o.orderID) AS total_orders
  FROM customers c
       INNER JOIN orders o ON c.CustomerID = o.CustomerID
       INNER JOIN orderdetails od ON o.OrderID = od.OrderID
GROUP BY o.orderID, c.CustomerID, c.contactName
HAVING count(o.OrderID) >= 1; 
# Using exists

SELECT c.CustomerID, c.ContactName
  FROM customers c
 WHERE NOT EXISTS
          (SELECT 1
             FROM orders o,
                  orderdetails od
            WHERE o.CustomerID = c.CustomerID 
            AND   o.OrderID = od.OrderID); 
           
# Using inner join
SELECT c.CustomerID, c.ContactName, o.OrderID
  FROM customers c
       INNER JOIN orders o ON c.CustomerID = o.CustomerID
       INNER JOIN orderdetails od ON o.OrderID = od.OrderID;
           
 # 6 use case:list all the employees with the territories they belong to and their regions?
SELECT e.EmployeeID,
       e.FirstName AS Emp_name,
       t.TerritoryDescription,
       r.RegionDescription
  FROM employees e,
       territories t,
       region r,
       employeeterritories et
 WHERE     e.EmployeeID = et.EmployeeID
       AND et.TerritoryID = t.TerritoryID
       AND t.RegionID = r.RegionID
GROUP BY e.EmployeeID;

# 7 Use Case :Find out the products & category sales for 2018?

SELECT p.productID,
       p.ProductName,
       c.CategoryID,
       c.CategoryName,
       o.OrderID
 from orders o
 join orderdetails od on o.OrderID = od.OrderID
 join products p ON p.ProductID = od.ProductID
 join categories c ON c.CategoryID = p.CategoryID
 where YEAR(o.orderdate)='1996';
#using natural join

SELECT products.productID,
       products.ProductName,
       categories.CategoryID,
       categories.CategoryName,
       orders.OrderID
 from orders 
 natural join orderdetails 
 natural join products 
 natural join categories 
 where YEAR(orders.orderdate)='1996';

select o.OrderDate,od.orderID
from orders o,orderdetails od
where YEAR(o.orderdate)='1996' and o.OrderID = od.OrderID
group by o.OrderDate, od.orderID;

#8 Use Case :Find out the products & category sales between 2018-01-01 to 2018-04-30?
SELECT p.productID,
       p.ProductName,
       c.CategoryID,
       c.CategoryName,
       o.OrderID
 from orders o
 join orderdetails od on o.OrderID = od.OrderID
 join products p ON p.ProductID = od.ProductID
 join categories c ON c.CategoryID = p.CategoryID
 where o.OrderDate between DATE('1996-01-01') and DATE('1996-04-30');
 
 #9 Use Case :Find the Quarterly orders BY products WITH total sales?
  SELECT p.ProductName,
       c.CategoryName,
       concat('QTR',quarter(o.OrderDate)) as orderquarter
 FROM categories c
 JOIN products p ON p.CategoryID = c.CategoryID
 JOIN orderdetails od ON od.ProductID = p.ProductID
 JOIN orders o ON o.OrderID = od.OrderID
 where o.OrderDate between date('1996-01-01') and date('1996-12-31')
 GROUP BY c.CategoryName,p.ProductName
 ORDER BY c.CategoryName,p.ProductName,orderquarter;
 
 select *,concat ('qrt',quarter(date(o.OrderDate))) orders o,
 where o.OrderDate between date('1996-01-01') and date('1996-12-31')
 
 
 # 10 Use case: for each order aggregate the minimum,maximum,average,total sum?
 
 SELECT OrderID,
       count(*)Total_Orders,
       min(unitprice*Quantity)min_amount,
       max(unitprice*Quantity)max_amount,
       avg(unitprice*Quantity)avg_amount,
       sum(unitprice*Quantity)Total_amount
FROM Orderdetails  
GROUP BY OrderID;
 
 
#11 Use case: calcualte the average units in stock of the products?
 select avg (unitsInstock)
 from products
 
 
#12 use case: calculate the sum of units in stock by product category?
 
 SELECT sum(unitsInstock), categoryID
  FROM products
GROUP BY categoryID;

#13 Use case: find all the customers who purchased more than one order?

SELECT c.CustomerID,
count(o.OrderID)
  FROM customers c,
       orders o
 WHERE c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
HAVING count(o.OrderID) > 1;

#14Use Case:find all the customers who purchesed more than one product in their orders ?
select c.CustomerID,
       o.OrderID,
       count(od.ProductID)
from   Customers c,
       Orders o,
       OrderDetails od
where c.CustomerID = o.CustomerID
and   o.OrderID = od.OrderID
group by od.OrderID
having count(od.OrderID)>1;

#15 Use Case:Find all the orders with their total sale i.e., [orderId, sum(unit price*quantity)]
select OrderID,
       sum(unitprice*quantity)
from Orderdetails 
group by OrderID;

#16 Use Case: Find all the sale orders whose total sale is greater than $5000 ?
select OrderID,
       sum(unitprice*quantity)
from OrderDetails 
group by OrderID
having sum(UnitPrice*quantity)>5000;

#17 Use Case: Get the number of products in the products table ?
SELECT COUNT(*)
FROM products;

#18 Use Case: Find all the products having more than one supplier?
select p.ProductID,p.ProductName,count(s.SupplierID) as supplier_count
from products p, suppliers s
where p.SupplierID = s.SupplierID
group by s.SupplierID
having supplier_count >=1;
