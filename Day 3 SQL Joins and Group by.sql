use northwind;

-- Joining Orders and Customers table
select customers.CustomerID, Orders.OrderID, Orders.OrderDate, 
customers.CustomerName, customers.Country
from Orders
inner join Customers
on Orders.CustomerID = Customers.CustomerID
order by customers.CustomerID;
-- . used for path

select *
from Orders
join Customers
on Orders.CustomerID = Customers.CustomerID;


-- suppliers and products
select suppliername, productname
from suppliers
inner join products
on suppliers.supplierid = products.supplierid;

-- G'Day, Mate and products
select suppliername, productname
from suppliers
inner join products
on suppliers.supplierid = products.supplierid
where suppliername = "G'Day, mate";

/* Write a query to list the employees who handled each order, along with the order date.*/
select FirstName, lastname, OrderDate, orderid, orders.employeeid
from orders 
inner join employees
on orders.EmployeeID = employees.EmployeeID;

/* Write a query to find all orders shipped by a specific shipper (e.g., ShipperName = 'Speedy Express'). */
select ShipperName, OrderID, OrderDate
from orders
inner join shippers
on orders.ShipperID = shippers.ShipperID
where ShipperName = 'Speedy Express';


/* Write a query to display all products along with their category names.*/
select CategoryName, ProductName
from products
inner join categories
on products.CategoryID = categories.CategoryID;


/* Write a query to list all products and their quantities for each order.*/
select ProductName, Quantity
from products
inner join order_details
on products.ProductID = order_details.ProductID;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees 
ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;
-- this query returns all employee info but matching order

SELECT Customers.CustomerName, Orders.OrderID, orderdate
FROM Customers -- left table
LEFT JOIN Orders -- right table
ON Customers.CustomerID = Orders.CustomerID
ORDER BY orderid;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders
order by customername;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders
order by customername;

SELECT count(Customers.CustomerName)
FROM Customers;

SELECT count(Orders.OrderID)
FROM orders;

-- number of quantity in each order
select od.orderid, o.OrderDate, od.ProductID, od.Quantity
from orders as o
join order_details as od
on o.orderid = od.OrderID;

select p.ProductName, s.SupplierName
from products as p
join suppliers as s
on p.SupplierID = s.SupplierID;

-- total quantity in each order
select od.orderid, sum(od.Quantity)
from orders as o
join order_details as od
on o.orderid = od.OrderID;

-- total quantity in each order
select od.orderid, sum(od.Quantity)
from orders as o
join order_details as od
on o.orderid = od.OrderID
group by od.OrderID;


-- How many customer in each country?
select country, count(customerid) as numberofcustomers
from customers
group by country;

-- Total Sales for each product
select p.ProductName, Sum(od.Quantity * p.Price) as totalsales
from products as p
join order_details as od
on p.ProductID = od.ProductID
group by p.ProductName
order by totalsales desc;

/* Write SQL query to list the number of customers in each city.*/
select city, count(customerid) as numberofcustomers
from customers
group by city
order by numberofcustomers desc;

/* Write a query to list each product category and 
the total quantity of products sold in that category.*/

select CategoryName, sum(Quantity) as totalsold
from categories as c
join products as p
on c.CategoryID = p.CategoryID
join order_details as od
on p.ProductID = od.ProductID
where CategoryName = "Beverages"
group by CategoryName;


 /*Write a query to list each employee and 
 the number of orders they have handled.*/
select FirstName, LastName, e.EmployeeID, count(o.orderid) as nooforders
from orders as o
join employees as e
on o.EmployeeID = e.EmployeeID
group by FirstName, LastName, e.EmployeeID;
