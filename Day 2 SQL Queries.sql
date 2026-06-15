-- you can exexcute query by highligting and pressing ligthning strike
-- you can also use ctrl + enter

-- activate schema
use northwind;

-- return all rows from customers table
select * from customers;

-- return all rows from customers table
SELECT * fRoM Customers;

-- return all rows from orders table
select * from orders;

-- return all rows from employees table
select * from employees;

-- return all rows from order_details table
select * from order_details;

-- return selected columns
SELECT CustomerName, City, Country FROM Customers;

-- return selected columns
SELECT ProductID, ProductName FROM Products;

-- return selected columns
SELECT Country FROM Customers;

-- return different values columns
SELECT DISTINCT Country FROM Customers;

-- return different values columns
select distinct country from customers;
 
-- return number of different values columns
SELECT COUNT(DISTINCT Country) FROM Customers;

-- return number of rows on customers table
select count(*) from customers;

-- number of rowsin customers table
SELECT COUNT(DISTINCT CustomerID) FROM Customers;

-- Write an SQL query to return these details from the Employees table.
select FirstName, LastName, BirthDate from employees;

-- Write an SQL query to retrieve this information from the Customers table.
select customerName, Address, City from customers;

-- Write an SQL query to return all unique city names from the Suppliers table.
select distinct city from suppliers;

-- Write an SQL query to count the number of distinct cities in the Customers table.
select count(distinct city) from customers;


-- customers from Mexico
SELECT * 
FROM customers 
WHERE Country = "Mexico";

-- customers from UK
select Customername, City
from Customers
where Country = 'UK';

-- customers from London
select Customername, Country
from Customers
where City = 'London';

-- Filter by productid 1
SELECT * FROM Products
WHERE ProductID =1;

-- filter by orderid
select * 
from orders
where orderid = 10250;

SELECT productname,price FROM Products
WHERE Price > 100;

-- Customers outside UK
select City, Country, Customername
from customers
where Country != "UK";

select City, Country, Customername
from customers
where Country <> "UK";

-- Write an SQL query to return all customers from London.
select * from customers where city = 'London';

-- Write an SQL query to return the number of customers from the USA.
select count(*) from customers where country = 'usa';

-- Write an SQL query to return CustomerID is equal to or greater than 15.
select * from customers where customerid >= 15;

-- Return customers from Germany, city in Berlin
select customername, City, Country
from customers
where Country= "Germany" and City= "Berlin";

-- UK customers outside London
select customername, City, Country
from customers
where Country = "UK" and City != "London"; 

select customername, City, Country
from customers
where Country = "UK" and not City = "London"; 

-- Return customers from Germany or city Berlin
select customername, City, Country
from customers
where Country= "Germany" or City= "London";
-- customer either in Germany or in London

-- Customers from UK or USA
select customername, City, Country
from customers
where Country = "UK" or Country = "usa";

-- product start with A
select *
from products
where productname like "a%";

-- product ending with A
select *
from products
where productname like "%a";

-- product including choco
select *
from products
where productname like "%choco%";

-- product has second letter a
select *
from products
where productname like "_a%";

-- contact name start with A and ending with O
SELECT * FROM Customers
WHERE ContactName LIKE 'a%o';

-- Write an SQL query to find all suppliers where the Country field contains 'land'.
select supplierName, country 
from suppliers 
where country like '%land%';

-- Write an SQL query to find these employees from the Employees table.
SELECT * 
FROM Employees 
WHERE FirstName LIKE '_n%';

-- Customers from France, UK or Germany
SELECT CustomerName, Country FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

SELECT CustomerName, Country FROM Customers
WHERE Country= "France" or Country= "Germany" or Country= "UK";

SELECT CustomerName, Country FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

-- Country for Suppliers
SELECT distinct Country FROM Suppliers;

-- Customers same country as Suppliers
select Customername, Country
from customers
Where country in (SELECT distinct Country FROM Suppliers);

/* Write an SQL query to find all such customers from 
 the Paris, Madrid, Berlin table. */
 Select Customername, city
 from customers 
 Where city in ('Berlin' ,'Paris', 'Madrid'); 
 
-- Find all orders that were shipped by ShipperID 1 or 3 from the Orders table.
Select orderid, shipperid 
from orders 
where shipperid in(1,3);

-- Find all customers who have placed an order.
 Select customername, customerid 
 From Customers 
 Where CustomerID IN ( Select distinct CustomerID From Orders);
 -- locate customerid in orders
 
-- customers with no orders
select * 
from customers 
where customerid not in (select customerid from orders);

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE Price >=10  and price <=20;

SELECT * FROM Products
WHERE Productname BETWEEN "Chais" AND "Pavlova";

-- order by Country
SELECT * FROM Customers
ORDER BY Country;

-- Order by Price
select Productname, Price
from Products
order by Price;

-- order by Country
SELECT * FROM Customers
ORDER BY Country DESC;

-- Order by Price
select Productname, Price
from Products
order by Price desc;

SELECT Country, Customername FROM Customers
ORDER BY Country, CustomerName;

SELECT Country, Customername FROM Customers
ORDER BY Country, CustomerName desc;

-- show first 3 customers
SELECT * FROM Customers
LIMIT 3;

SELECT * FROM Products
LIMIT 5;

SELECT * FROM Customers
order by customerid desc
LIMIT 3;

SELECT * FROM Customers
WHERE Country='Germany'
LIMIT 3;


-- min price
select min(price)
from products;

-- max price
select max(price)
from products;

-- avg price
select avg(price)
from products;

-- total price
select sum(price)
from products;

-- number of products in category 1
select count(*)
from products
where categoryid= 1;

-- number of products in category 1
select count(productid)
from products
where categoryid= 1;


-- avg price
select avg(price) as AveragePrice
from products;

SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;

SELECT CustomerName AS Customer, ContactName AS "Contact Person"
FROM Customers;

SELECT CustomerName, CONCAT_WS(", ", Address, PostalCode, City, Country) as Address
FROM Customers;

