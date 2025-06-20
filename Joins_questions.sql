
Table: employees
| Column     | Type    | Description               |
| ---------- | ------- | ------------------------- |
| emp\_id    | INTEGER | Unique employee ID        |
| name       | TEXT    | Employee name             |
| department | TEXT    | Department they belong to |

Table: projects
| Column        | Type    | Description                  |
| ------------- | ------- | ---------------------------- |
| proj\_id      | INTEGER | Project ID                   |
| emp\_id       | INTEGER | Employee assigned to project |
| project\_name | TEXT    | Name of the project          |


Practice Questions

🔸 Basic Join Logic

-- List the names of all employees and the projects they are assigned to.
SELECT e.name, p.project_name 
from employees e 
JOIN projects p 
on e.emp_id = p.emp_id;

--Display employee names who are assigned to more than one project.
SELECT e.name, COUNT(p.project_name) as project_count
from employees e 
join projects p
ON e.emp_id = p.emp_id
group by e.name
HAVING COUNT(p.project_name) > 1;

--Find the names of employees who are not assigned to any project.
SELECT e.name 
from employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id
WHERE p.proj_id IS NULL;

--Retrieve the names of employees and their project names, including those without projects.
SELECT e.name, p.project_name 
from employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;

--For each department, list the number of employees working on at least one project.
SELECT COUNT(e.name)
from employees e 
left JOIN projects p 
on e.emp_id = p.emp_id
where p.proj_id is NOT NULL;

--Show the total number of projects handled by employees in the IT department.
select e.name, p.project_name, count(p.project_name) as number_of_project
FROM employees e 
join projects p 
on e.emp_id = p.emp_id
where e.department = 'IT'
GROUP by e.name, p.project_name;

--Find pairs of employees who are in the same department, but working on different projects.
SELECT 
  e1.name AS employee_1,
  e2.name AS employee_2,
  p1.project_name AS project_1,
  p2.project_name AS project_2,
  e1.department
FROM employees e1
JOIN projects p1 ON e1.emp_id = p1.emp_id

JOIN employees e2 ON e1.department = e2.department AND e1.emp_id < e2.emp_id
JOIN projects p2 ON e2.emp_id = p2.emp_id

WHERE p1.project_name != p2.project_name;

--Emulate a FULL OUTER JOIN between employees and projects
--to show all possible employee-project combinations, including unmatched ones on either side.

SELECT e.emp_id, e.name, e.department, p.project_name
from employees e
left join projects p on e.emp_id = p.emp_id

UNION

SELECT e.emp_id, e.name, e.department, p.project_name
from projects p
left join employees e on e.emp_id = p.emp_id;


