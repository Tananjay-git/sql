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

--Get the number of employees in each department.
SELECT department, count(name) as NUmber_of_employees 
from employees
GROUP by department;

--Show total salary expense per department.
SELECT department, salary FROM employees GROUP by department;

--Find departments with more than 2 employees.
SELECT department, count(emp_id) as number_of_emp FROM employees
GROUP by department
HAVING number_of_emp > 2;

--Get departments where total salary exceeds 150,000.
SELECT department, sum(salary) as total_salary 
from employees
GROUP by department
having total_salary > 150000;

--Find departments with average salary above 70,000.
SELECT department, AVG(salary) as average_salary
FROM employees
GROUP by department
having  average_salary > 70000;

--Find how many projects each employee is working on.
SELECT p.project_name, count(e.emp_id)
from employees e
join projects p 
on e.emp_id = p.emp_id
GROUP by 1;

--List project count per department.
SELECT e.department, count(p.project_id) as project_count
from employees e 
join projects p 
on e.emp_id = p.emp_id
GROUP by 1;

--Find total salary of employees working on at least 1 project.
SELECT e.name, sum(e.salary) as total_salary
from employees e 
join projects p 
on e.emp_id = p.emp_id
GROUP by e.name
HAVING count(p.project_id) >= 1;

--Assign a row number to each employee ordered by salary (highest first).
SELECT * , row_number() over(partition by emp_id ORDER by salary DESC) as row_number
from employees
ORDER by row_number desc;

--Rank employees within each department by salary.
SELECT *, rank() over(PARTITION BY department ORDER by salary DESC)as rank
from employees

--Find the top 2 highest-paid employees in each department.
select name, department, salary 
from employees
QUALIFY rank() over(partition by department ORDER by salary desc) <= 2 

--For each employee, show how their salary compares to the department average.
SELECT 
	name
    , salary
    , avg(salary) over(partition by department) as dept_avg_salary
    , salary - avg(salary) over(partition by department) as diff_from_avg
from employees

--Show each employee’s salary and the department's highest salary.
SELECT 
	name
    , department
    , salary
    , max(salary) over(partition by department ) as department_highest_salary
from employees
