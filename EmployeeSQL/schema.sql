-- Drop table if exists
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

---------------------------------------------------------------------------------
-- Creating a new table for departments and import
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

---------------------------------------------------------------------------------
-- Creating a new table for salaries and import
CREATE TABLE salaries (
	--id SERIAL PRIMARY KEY,
	emp_no INT,
	salary INT,
	PRIMARY KEY (emp_no)
);

SELECT * FROM salaries;
---------------------------------------------------------------------------------
-- Creating a new table for titles and import
CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR,
	PRIMARY KEY (title_id)
);

-- View table columns and datatypes
SELECT * FROM titles;
---------------------------------------------------------------------------------
-- Creating a new table for employees and import
CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date VARCHAR,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * FROM employees;
---------------------------------------------------------------------------------
-- Creating a new table for dept_emp and import
CREATE TABLE dept_emp (
	id SERIAL PRIMARY KEY,
	emp_no INT,
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_emp;
--------------------------------------------------------------------------------
-- Creating a new table for dept_manager and import
CREATE TABLE dept_manager (
	id SERIAL PRIMARY KEY,
	dept_no VARCHAR,
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_manager;



SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT * FROM dept_emp;