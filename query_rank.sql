create database denserrank;
use denserrank;

create table Employees(
EmployeeID int,
 FirstName varchar(30), 
 LastName varchar(30), 
 Salary int, 
 SalaryHireDate varchar(30)
);
 

select * from Employees;

insert into Employees values
(1, 'John', 'Doe', 60000, 2022-01-15),
(2, 'Jane', 'Smith', 75000, 2022-01-15),
(3, 'Michael', 'Johnson', 55000, 2022-01-15),
(4, 'Alice', 'Brown', 68000, 2022-01-15),
(5, 'Jane', 'Walker', 60000, 2022-01-15),
(6, 'Joy', 'Glazier', 75000, 2022-01-15);

-- Retrieve the top 3 highest paid employees from the Employees table along with their salaries
select FirstName, LastName, Salary, dense_rank() over (order by Salary desc) as 'Highest paid' 
from Employees limit 3;

-- Retrieve the highest paid employees from the Employees table along with their salaries.
select * from (select FirstName, LastName, Salary,
dense_rank() over( order by Salary desc  ) as 'Highest paid' 
from Employees) as result where Salary = (select max(Salary) from Employees);





