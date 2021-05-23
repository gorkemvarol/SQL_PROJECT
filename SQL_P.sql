--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employee.emp_no,employee.last_name, employee.first_name, salaries.salary FROM employee
INNER JOIN salaries 
ON employee.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986

SELECT first_name, last_name, hire_date FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employee.last_name, employee.first_name
FROM departments
INNER JOIN 
dept_manager
ON departments.dept_no = dept_manager.dept_no
INNER JOIN
employee
ON dept_manager.emp_no = employee.emp_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employee.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM employee
INNER JOIN
dept_employee
ON employee.emp_no = dept_employee.emp_no
INNER JOIN 
departments
ON dept_employee.dept_no = departments.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex FROM employee
WHERE first_name = 'Hercules' AND last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employee.emp_no, employee.first_name, employee.last_name, departments.dept_name
FROM employee
INNER JOIN
dept_employee
ON employee.emp_no = dept_employee.emp_no
INNER JOIN
departments
ON dept_employee.dept_no = departments.dept_no
WHERE dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT employee.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM employee
INNER JOIN
dept_employee
ON employee.emp_no = dept_employee.emp_no
INNER JOIN
departments
ON dept_employee.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select e.last_name, count(*)
from employee as e
	group by e.last_name
	order by 2 desc
