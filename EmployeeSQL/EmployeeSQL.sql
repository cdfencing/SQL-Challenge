--Table creation

--not null not working
CREATE TABLE Departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

SELECT * FROM Departments

CREATE TABLE Titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

SELECT * FROM Titles

CREATE TABLE Employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR(1),
	hire_date DATE,
	FOREIGN KEY(emp_title_id) REFERENCES Titles(title_id)
);

SELECT * FROM Employees

CREATE TABLE Salaries (
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM Salaries

CREATE TABLE Dept_Emp (
	emp_no INT,
	dept_no VARCHAR,
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments(dept_no)
);

SELECT * FROM Dept_Emp

CREATE TABLE Dept_Manager (
	dept_no VARCHAR,
	emp_no INT,
	PRIMARY KEY(dept_no, emp_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments(dept_no)
);

SELECT * FROM Dept_Manager

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
