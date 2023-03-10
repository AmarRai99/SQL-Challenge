
--1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s 
 ON e.emp_no = s.emp_no;
	
--2. List first name, last name, and hire date for employees who were hired in 1986.	

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager AS m
JOIN departments AS d
 ON m.dept_no = d.dept_no
JOIN employees AS e 
 ON e.emp_no = m.emp_no;
	
--Q4. List the department of each employee with the following information: employee number, last name, first name, and department name.
	
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de 
 ON e.emp_no = de.emp_no
JOIN departments AS d 
 ON de.dept_no = d.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--Q6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de 
 ON e.emp_no = de.emp_no
JOIN departments AS d 
 ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--Q7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de 
 ON e.emp_no = de.emp_no
JOIN departments AS d 
 ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development'
ORDER BY last_name;

--8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees 
GROUP BY last_name
ORDER BY frequency DESC;
