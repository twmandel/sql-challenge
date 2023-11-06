--Create the tables, columns, and relationships

CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY NOT NULL,
    title VARCHAR NOT NULL
     );

CREATE TABLE employees (
    emp_no int PRIMARY KEY  NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date date NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date date NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
     );


CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY NOT NULL,
    dept_name VARCHAR NOT NULL
     );

CREATE TABLE "salaries" (
    "emp_no" int NOT NULL,
    "salary" int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR NOT NULL,
    "emp_no" int NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE "dept_emp" (
    "emp_no" int NOT NULL,
    "dept_no" VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--View the tables

SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;