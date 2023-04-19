-- create tables and import csv's
CREATE TABLE titles (
	title_id VARCHAR (30) NOT NULL,
	title VARCHAR (30) NOT NULL,
    PRIMARY KEY (title_id));
-- View table
SELECT * FROM titles;

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR (30) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR (30) NOT NULL,
    last_name VARCHAR (30) NOT NULL,
    sex VARCHAR (30) NOT NULL,
    hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    PRIMARY KEY (emp_no));

-- View table
SELECT * FROM employees;


CREATE TABLE departments (
    dept_no VARCHAR (30) NOT NULL,
    dept_name VARCHAR (30) NOT NULL,
    PRIMARY KEY(dept_no));

-- View table
SELECT * FROM departments;

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR (30) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no));
	
-- View table
SELECT * FROM dept_emp;

CREATE TABLE dept_manager (
    dept_no VARCHAR (30) NOT NULL,
	emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no));

-- View table
SELECT * FROM dept_manager;

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no));
	
-- View table
SELECT * FROM salaries;

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no=s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '19860101' and '19861231';

--List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.
SELECT e.last_name, e.first_name, dm.dept_no, d.dept_name, e.emp_no  
FROM employees as e
INNER JOIN dept_manager as dm ON
e.emp_no=dm.emp_no
INNER JOIN departments as d ON
dm.dept_no=d.dept_no;

-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON
e.emp_no=de.emp_no
INNER JOIN departments as d ON
de.dept_no=d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

