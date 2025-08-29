-- 1-Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
create table Employees
(
ID int primary key,
Name varchar(50),
salary decimal
)

-- 2-Add a new column named "Department" to the "Employees" table with data type varchar(50).
alter table Employees
add Department varchar(50)

-- 3-Remove the "Salary" column from the "Employees" table.
alter table Employees
drop column salary

-- 4-Rename the "Department" column in the "Employees" table to "DeptName".
exec sp_rename 'Employees.Department','DeptName','column'

-- 5-Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar)
create table Projects
(
ProjectID int,
ProjectName varchar(50)
)

-- 6-Add a primary key constraint to the "Employees" table for the "ID" column.
alter table Employees
add constraint emp_id primary key (ID);

-- 7-Add a unique constraint to the "Name" column in the "Employees" table.
alter table Employees
add constraint name_uni unique (Name);

-- 8-Create a table named "Customers" with columns for CustomerID (integer), 
--FirstName (varchar),LastName (varchar), and Email (varchar), and Status (varchar).
create table Customers
(
CustomerID int,
FirstName varchar(30),
LastName varchar(30),
Email varchar(30),
Status varchar(20)
)

-- 9-Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
alter table Customers
add constraint customer_uni unique (FirstName,LastName)

-- 10-Create a table named "Orders" with columns for OrderID (integer)
--, CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
create table Orders
(
OrderID int,
CustomerID int,
OrderDate datetime2,
TotalAmount decimal
)

-- 11-Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
alter table Orders
add constraint amount_check check (TotalAmount>0)
go
-- 12-Create a schema named "Sales" and move the "Orders" table into this schema.
create schema Sales
go

alter schema Sales
transfer dpo.Orders

-- 13-Rename the "Orders" table to "SalesOrders."
exec sp_rename 'Sales.Orders', 'SalesOrders';
