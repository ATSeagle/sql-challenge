
SELECT * FROM departments;
SELECT * from dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
INNER JOIN salaries AS sal ON
emp.emp_no=sal.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

ALTER TABLE employees ALTER COLUMN hire_date TYPE VARCHAR(30); 

SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees AS emp
WHERE hire_date LIKE '1986%';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dept.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM departments AS dept
INNER JOIN dept_manager ON
dept.dept_no = dept_manager.dept_no
INNER JOIN employees AS emp ON 
dept_manager.emp_no = emp.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, departments.dept_name
FROM employees AS emp
INNER JOIN dept_emp ON
emp.emp_no = dept_emp.emp_no
INNER JOIN departments ON 
dept_emp.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT emp.first_name, emp.last_name, emp.sex
FROM employees AS emp
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, departments.dept_name
FROM employees AS emp
INNER JOIN dept_emp ON 
emp.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, departments.dept_name
FROM employees AS emp
INNER JOIN dept_emp ON 
emp.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' 
OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Last Name Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Frequency" DESC


