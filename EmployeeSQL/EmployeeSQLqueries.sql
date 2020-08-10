--List for each employee: employee number, last name, first name, sex, and salary.
-- Query to display the many-to-many relationships
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees e
	JOIN Salaries s
	ON e.emp_no = s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.last_name, e.first_name, e.hire_date
FROM Employees e
WHERE hire_date >= '1/1/1986' AND
	  hire_date <'1/1/1987';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT
	dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM Employees e 
	JOIN Dept_Manager dm ON e.emp_no=dm.emp_no
	JOIN Departments d ON d.dept_no = dm.dept_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM Employees e
	JOIN Dept_Emp de ON e.emp_no=de.emp_no
	JOIN Departments d ON d.dept_no = de.dept_no;
	
--List first name, last name, and sex for employees whose first name is 
--"Hercules" and last names begin with "B."

SELECT *
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department
--include their employee number, last name, first name, and department name.

SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM Employees e
	JOIN Dept_Emp de ON e.emp_no=de.emp_no
	JOIN Departments d ON d.dept_no = de.dept_no
WHERE d.dept_no = 'd007';

--List all employees in the Sales and Development departments
--include their employee number, last name, first name, and department name.
				
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM Employees e
	JOIN Dept_Emp de ON e.emp_no=de.emp_no
	JOIN Departments d ON d.dept_no = de.dept_no
WHERE d.dept_no = 'd007' OR d.dept_no = 'd005';

--In descending order, list the frequency count of employee last names
--i.e., how many employees share each last name.

SELECT
	last_name,
	COUNT (last_name)
FROM
	Employees
GROUP BY 
	last_name 
ORDER BY COUNT (last_name) DESC;