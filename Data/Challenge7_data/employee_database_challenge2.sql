CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

SELECT emp_no,first_name, last_name
FROM employees

DROP TABLE titles CASCADE;
DROP TABLE titles;
CREATE TABLE titles (
     emp_no INT NOT NULL,
     title VARCHAR NOT NULL,
	 from_date DATE NOT NULL,
     to_date DATE NOT NULL,
	 FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM titles

SELECT title, from_date, to_date
FROM titles


DROP TABLE retirement_info2 CASCADE;
SELECT emp_no, first_name, last_name
INTO retirement_info2
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

SELECT retirement_info2.emp_no,
     retirement_info2.first_name,
     retirement_info2.last_name,
	 titles.title,
	 titles.from_date,
	 titles.to_date
INTO retirement_titles
FROM retirement_info2
INNER JOIN titles
ON retirement_info2.emp_no = titles.emp_no
ORDER BY retirement_info2.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
--SELECT DISTINCT ON (location) location, time, report
    --FROM weather_reports
    --ORDER BY location, time DESC;
DROP TABLE unique_titles CASCADE;
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title	
	
INTO unique_titles
FROM retirement_titles
--WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC; 
 

--ORDER BY "actor count" DESC

SELECT * FROM unique_titles;

--COUNT title FROM unique_titles;
--ALTER TABLE Customers
--ADD Email varchar(255);
--SELECT unique_titles.title,
__SELECT COUNT(title)
--FROM unique_titles
--WHERE title;

SELECT  unique_titles.title, COUNT(*)
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY COUNT(*) DESC;
SELECT * FROM retiring_titles;
--COUNT title TO count     
--
--FROM retirement_info2
--GROUP BY title
--ORDER BY count DESC;
SELECT employees.emp_no,
     employees.first_name,
     employees.last_name,
	 employees.birth_date,
	 dept_emp.from_date,
	 dept_emp.to_date,
	 titles.title
	 
--DISTINCT ON (emp_no) emp_no
--FROM employees
--ORDER BY emp_no, to_date DESC; 
INTO mentorship_eligibility1
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
--FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
--WHERE (to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	birth_date,
	from_date,
	to_date,
	title
INTO mentorship_eligibility
FROM mentorship_eligibility1
ORDER BY emp_no; 

SELECT * FROM mentorship_eligibility1
SELECT * FROM mentorship_eligibility
