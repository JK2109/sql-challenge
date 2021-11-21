--Data Analysis
--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.sex,
	s.salary
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no = s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT e.first_name,
	e.last_name,
	e.hire_date
FROM employees as e
WHERE hire_date LIKE '%1986';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager as dm
INNER JOIN departments as d ON dm.dept_no = d.dept_no
INNER JOIN employees as e ON dm.emp_no = e.emp_no;


--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON e.emp_no = de.emp_no
INNER JOIN departments as d ON de.dept_no = d.dept_no;


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name,
	e.last_name,
	e.sex
FROM employees as e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON e.emp_no = de.emp_no
INNER JOIN departments as d ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON e.emp_no = de.emp_no
INNER JOIN departments as d ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;

--BONUS : run additional 3 analysis
--List the name of employee with the highest, including their employee number, last name, first name, and salary.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	s.salary
FROM employees as e
INNER JOIN salaries as s ON e.emp_no = s.emp_no
WHERE salary IN
(
	SELECT MAX(salary) FROM salaries
);

--List the average salary by department in decending order by average salary amount.

SELECT d.dept_name, ROUND(AVG(s.salary),2) AS "Avg_Salary" 
FROM departments as d
INNER JOIN dept_emp as de ON d.dept_no = de.dept_no
INNER JOIN salaries as s ON de.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY "Avg_Salary" DESC;

--List the name of employee working in mulitple department , including their employee number, last name, first name, and department name.

SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON e.emp_no = de.emp_no
INNER JOIN departments as d ON de.dept_no = d.dept_no
WHERE e.emp_no IN
(
	SELECT emp_no FROM dept_emp
	GROUP BY emp_no
	HAVING COUNT(*) > 1  
);




