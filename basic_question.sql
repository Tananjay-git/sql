CREATE TABLE employees (
  id INTEGER,
  name TEXT,
  department TEXT,
  salary INTEGER
);

INSERT INTO employees VALUES
(1, 'Alice', 'IT', 60000),
(2, 'Bob', 'HR', 55000),
(3, 'Charlie', 'IT', 70000),
(4, 'Diana', 'Sales', 50000),
(5, 'Eve', 'IT', 80000);



--1. Fetch all data from the employees table.;
SELECT * from employees;

--2.Display only the names and salaries of all employees.;
SELECT name, salary from employees;

--Write a query to retrieve all employees who work in the IT department.
SELECT id, name from employees where department = 'IT';

--Find all employees whose salary is greater than 60,000.
select name from employees where salary > 60000;

--List all employees sorted by salary in descending order (highest first).
SELECT id, name, salary from employees order by salary desc;

--Retrieve the top 3 employees with the highest salaries.
SELECT name, salary FROM employees ORDER by salary desc limit 3 ;

--Find the employee(s) with the lowest salary.
SELECT name, salary from employees ORDER by salary ASC limit 1;

--Count how many employees are in each department.
SELECT id, name, COUNT(*), department FROM employees GROUP by department;

--Get the average salary of employees in the IT department.
SELECT department, avg(salary) FROM employees GROUP by department;

--Find the highest salary in the entire table.
SELECT * from employees ORDER by salary desc limit 1;