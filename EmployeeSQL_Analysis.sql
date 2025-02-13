--1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e 
JOIN salaries s
ON e.emp_no = s.emp_no
;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE 
		e.hire_date > '1985-12-31' AND 
		e.hire_date < '1987-01-01'
;

--3. List the manager of each department along with their department number, 
--	 department name, employee number, last name, and first name.

SELECT m.dept_no, m.emp_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager m
JOIN employees e
ON m.emp_no = e.emp_no
JOIN departments d
ON d.dept_no = m.dept_no
;


--4. List the department number for each employee along with that employee’s employee number,
--	 last name, first name, and department name.

SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e
ON de.emp_no = e.emp_no
JOIN departments d
ON d.dept_no = de.dept_no
;


--5. List first name, last name, and sex of each employee whose first name is Hercules and 
--	 whose last name begins with the letter B.

SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE 
		e.first_name = 'Hercules' AND 
		e.last_name LIKE 'B%'
;


--6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
;

--7. List each employee in the Sales and Development departments, including their employee number,
--	 last name, first name, and department name.

SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
;


--8. List the frequency counts, in descending order, of all the employee last names 
--	 (that is, how many employees share each last name)

SELECT e.last_name, COUNT (*)
FROM employees e
GROUP BY e.last_name
ORDER BY COUNT(*) DESC
;