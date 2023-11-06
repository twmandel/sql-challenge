--View the tables

SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;

--List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date between '1/1/1986' and '12/31/1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dm.emp_no, dm.dept_no, departments.dept_name, employees.first_name, employees.last_name
FROM dept_manager AS dm
INNER JOIN employees
ON employees.emp_no = dm.emp_no
INNER JOIN departments
ON dm.dept_no = departments.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT de.dept_no, de.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp AS de
INNER JOIN employees
ON employees.emp_no = de.emp_no
INNER JOIN departments
ON de.dept_no = departments.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.


SELECT de.emp_no, employees.last_name, employees.first_name
FROM dept_emp AS de
INNER JOIN employees
ON employees.emp_no = de.emp_no
INNER JOIN departments
ON de.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT de.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp AS de
INNER JOIN employees
ON employees.emp_no = de.emp_no
INNER JOIN departments
ON de.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "last name count"
FROM employees
GROUP BY last_name
ORDER BY "last name count"
DESC;