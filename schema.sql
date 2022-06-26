-- create tables

CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (
     emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
emp_no INT NOT NULL,
   dept_no VARCHAR(4) NOT NULL,
   from_date DATE NOT NULL,
   to_date DATE NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
   PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no, title, from_date)
);

-- display tables

SELECT * FROM salaries;

-- find employees 'first and last name' that were born between 1952 and 1955

-- The SELECT statement is more specific this time.
-- Instead of an asterisk to indicate that we want all of the records,
-- we're requesting only the first and last names of the employees.
-- FROM employees tells SQL in which of the six tables to look.
-- The WHERE clause brings up even more specifics.
-- We want SQL to look in the birth_date column for anyone born between January 1, 1952,
-- and December 31, 1955.

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- queries to search for specific years
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- count of employees with retirement eligibility
SELECT COUNT (first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
