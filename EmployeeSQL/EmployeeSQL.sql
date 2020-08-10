--Table creation
CREATE TABLE Departments (
	dept_no VARCHAR(50) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL
);

SELECT * FROM Departments

CREATE TABLE Titles (
	title_id VARCHAR(50) NOT NULL PRIMARY KEY,
	title VARCHAR(50) NOT NULL
);

SELECT * FROM Titles

CREATE TABLE Employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(50) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY(emp_title_id) REFERENCES Titles(title_id)
);

SELECT * FROM Employees

CREATE TABLE Salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM Salaries

CREATE TABLE Dept_Emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(50),
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments(dept_no)
);

SELECT * FROM Dept_Emp

CREATE TABLE Dept_Manager (
	dept_no VARCHAR(50) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY(dept_no, emp_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments(dept_no)
);

SELECT * FROM Dept_Manager
