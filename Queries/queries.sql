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
